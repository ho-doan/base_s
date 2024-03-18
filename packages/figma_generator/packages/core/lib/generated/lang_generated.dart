import 'dart:io';

import '../figma/figma_document.dart';
import '../figma/figma_file.dart';
import '../translator/translator.dart';

Future<List<TrnResult>> genDefault(FigmaFile figmaFile) async {
  return [for (final i in figmaFile.document.allText) await _genText(i)]
      .where((e) => e != null)
      .cast<TrnResult>()
      .toList();
}

String generatedLangEn(List<TrnResult> ens) {
  final buffer = StringBuffer();
  buffer.writeln('{');
  final _allText = [
    for (final i in ens)
      '\t"${i.en.replaceAll(new RegExp(r'\W+'), '_')}"'
          ': "${i.value.replaceAll('\n', '\\n')}"'
  ];
  buffer.writeln(_allText.join(',\n'));
  buffer.writeln('}');

  return buffer.toString(); //formatter.format(buffer.toString());
}

Future<String> generatedLangs(
  Lang lang,
  List<TrnResult> ens,
) async {
  final buffer = StringBuffer();
  buffer.writeln('{');
  final _allText = [for (final i in ens) await genText(i, lang)]
      .where((e) => e != null)
      .cast<String>()
      .toList();

  buffer.writeln(_allText.join(',\n'));
  buffer.writeln('}');

  return buffer.toString(); //formatter.format(buffer.toString());
}

Future<String?> genText(TrnResult t, Lang lang) async {
  stdout.writeln('fetch text ${t.value} => ${lang.locale} Loading...');
  final s = await translator(t.en, to: lang);
  if (s == null) return null;
  return '\t"${t.en.replaceAll(new RegExp(r'\W+'), '_')}"'
      ': "${s.s.replaceAll('\n', '\\n')}"';
}

Future<TrnResult?> _genText(String str) async {
  stdout.writeln('fetch text $str => ${Lang.en.locale} Loading...');
  final s = await translator(str, to: Lang.en);
  if (s == null) return null;
  return TrnResult(str, s.s);
  // final key = s.s.replaceAll(new RegExp(r'\W+'), '_');
  // return '"$key": "${str.replaceAll('\n', '\\n')}"';
}

extension on FigmaDocument? {
  List<String> get allText {
    if (this == null) return [];
    final lst = <String>[];
    if (this!.characters != null) {
      lst.add(this!.characters!);
    }
    if (this!.children != null) {
      for (final item in this!.children!) {
        lst.addAll(item.allText);
      }
    }
    return lst;
  }

  List<FigmaDocument> get documents {
    if (this == null) return [];
    final lst = <FigmaDocument>[];

    lst.add(this!);

    if (this!.children != null) {
      for (final item in this!.children!) {
        lst.addAll(item.documents);
      }
    }
    return lst;
  }
}

class TrnResult {
  final String value;
  final String en;

  TrnResult(this.value, this.en);
}
