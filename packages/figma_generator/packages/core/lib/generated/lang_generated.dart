import 'dart:io';

import '../models/model.dart';
import '../services/translator/translator.dart';
import '../utils/utils.dart';

Future<List<TrnResult>> genDefault(FigmaFile figmaFile) async {
  return [
    for (final i in figmaFile.document.allText.removeDuplicated)
      await _genText(i),
  ].where((e) => e != null).cast<TrnResult>().toList();
}

String generatedLangEn(List<TrnResult> ens) {
  final cEns = ens.map((e) => e.en).toList();
  final buffer = StringBuffer();
  final allText = [for (final i in ens) _checkJson(i.en, i.value, cEns)];
  buffer
    ..writeln('{')
    ..writeln(allText.join(',\n'))
    ..writeln('}');

  return buffer.toString();
}

Future<String> generatedLangs(
  Lang lang,
  List<TrnResult> ens,
) async {
  final cEns = ens.map((e) => e.en).toList();
  final buffer = StringBuffer();

  final allText = [for (final i in ens) await _genTextLangs(i, lang, cEns)]
      .where((e) => e != null)
      .cast<String>()
      .toList();
  buffer
    ..writeln('{')
    ..writeln(allText.join(',\n'))
    ..writeln('}');

  return buffer.toString();
}

Future<String?> _genTextLangs(TrnResult t, Lang lang, List<String> ens) async {
  stdout.writeln('fetch text ${t.value} => ${lang.locale} Loading...');
  final s = await translator(t.en, to: lang);
  if (s == null) return null;
  return _checkJson(t.en, s.s, ens);
}

Future<TrnResult?> _genText(String str) async {
  stdout.writeln('fetch text $str => ${Lang.en.locale} Loading...');
  final s = await translator(str);
  if (s == null) return null;
  return TrnResult(str, s.s);
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
