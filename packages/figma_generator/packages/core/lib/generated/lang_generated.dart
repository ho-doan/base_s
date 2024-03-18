import 'dart:io';

import 'package:core/figma/figma.dart';
import 'package:dart_style/dart_style.dart';

String generatedLangs(
  File pubspecFile,
  DartFormatter formatter,
  String langs,
  FigmaFile figmaFile,
) {
  final buffer = StringBuffer();
  for (final i in figmaFile.document.allText) {
    buffer.writeln(i.replaceAll(
        '\n', '\\n')); // .replaceAll(new RegExp(r'\W+'), ' ') // r'[^\w\s]+'
  }

  return buffer.toString(); //formatter.format(buffer.toString());
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


// var headers = {
//   'X-Figma-Token': 'figd_JsfT_-mkMcCAtawNtiDDcl-gf1vrCIEBphdFCgWp'
// };
// var dio = Dio();
// var response = await dio.request(
//   'https://translate.googleapis.com/translate_a/single?sl=auto&q=Xin chào tôi là Hổ Đoàn&tl=en&hl=en&client=gtx&dt=t&ie=UTF-8&oe=UTF-8&otf=1&ssel=0&tsel=0&kc=7',
//   options: Options(
//     method: 'GET',
//     headers: headers,
//   ),
// );

// if (response.statusCode == 200) {
//   print(json.encode(response.data));
// }
// else {
//   print(response.statusMessage);
// }