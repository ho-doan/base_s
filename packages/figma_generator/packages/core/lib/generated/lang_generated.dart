import 'dart:io';

import '../figma/figma_document.dart';
import '../figma/figma_file.dart';
import '../translator/translator.dart';

Future<List<TrnResult>> genDefault(FigmaFile figmaFile) async {
  return [
    for (final i in figmaFile.document.allText.removeDuplicated)
      await _genText(i)
  ].where((e) => e != null).cast<TrnResult>().toList();
}

String generatedLangEn(List<TrnResult> ens) {
  final cEns = ens.map((e) => e.en).toList();
  final buffer = StringBuffer();
  buffer.writeln('{');
  final allText = [for (final i in ens) _checkJson(i.en, i.value, cEns)];
  buffer.writeln(allText.join(',\n'));
  buffer.writeln('}');

  return buffer.toString(); //formatter.format(buffer.toString());
}

Future<String> generatedLangs(
  Lang lang,
  List<TrnResult> ens,
) async {
  final cEns = ens.map((e) => e.en).toList();
  final buffer = StringBuffer();
  buffer.writeln('{');
  final allText = [for (final i in ens) await genText(i, lang, cEns)]
      .where((e) => e != null)
      .cast<String>()
      .toList();

  buffer.writeln(allText.join(',\n'));
  buffer.writeln('}');

  return buffer.toString(); //formatter.format(buffer.toString());
}

Future<String?> genText(TrnResult t, Lang lang, List<String> ens) async {
  stdout.writeln('fetch text ${t.value} => ${lang.locale} Loading...');
  final s = await translator(t.en, to: lang);
  if (s == null) return null;
  return _checkJson(t.en, s.s, ens);
}

Future<TrnResult?> _genText(String str) async {
  stdout.writeln('fetch text $str => ${Lang.en.locale} Loading...');
  final s = await translator(str, to: Lang.en);
  if (s == null) return null;
  return TrnResult(str, s.s);
  // final key = s.s.replaceAll(new RegExp(r'\W+'), '_');
  // return '"$key": "${str.replaceAll('\n', '\\n')}"';
}

String _checkJson(String key, String value, List<String> keys) {
  final cKey = key.r;
  final cValue = value.v;
  final index = keys.indexOf(key);
  if (keys.where((e) => e.r == cKey).length > 1) {
    if (index > -1) {
      int ix = 0;
      for (int i = 0; i < index; i++) {
        if (keys[i].r == cKey) ix++;
      }
      if (ix != 0) {
        return '\t"${cKey}_$ix": "$cValue"';
      }
    }
  }
  return '\t"$cKey": "$cValue"';
}

extension on String {
  String get r => replaceAll(RegExp(r'\W+'), '_');
  String get v => replaceAll('\n', '\\n');
}

extension on FigmaDocument? {
  List<String> get allText {
    if (this == null) return [];
    final lst = <String>[];
    if (this!.characters != null && this!.characters!.isNotEmpty) {
      lst.add(this!.characters!);
    }
    if (this!.children != null) {
      for (final item in this!.children!) {
        lst.addAll(item.allText);
      }
    }
    return lst;
  }

  // ignore: unused_element
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

extension on List<String> {
  List<String> get removeDuplicated {
    return toSet().toList();
  }
}

class TrnResult {
  final String value;
  final String en;

  TrnResult(this.value, this.en);
}
