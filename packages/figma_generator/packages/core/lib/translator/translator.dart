import 'package:dio/dio.dart';

String generateToken(dynamic a) {
  var tkk = _tKK();
  var b = tkk[0];

  var d = []; //List();

  for (var f = 0; f < a.toString().length; f++) {
    var g = a.toString().codeUnitAt(f);
    if (128 > g) {
      d.add(g);
    } else {
      if (2048 > g) {
        d.add(g >> 6 | 192);
      } else {
        if (55296 == (g & 64512) &&
            f + 1 < a.toString().length &&
            56320 == (a.toString().codeUnitAt(f + 1) & 64512)) {
          g = 65536 +
              ((g & 1023) << 10) +
              (a.toString().codeUnitAt(++f) & 1023);
          d.add(g >> 18 | 240);
          d.add(g >> 12 & 63 | 128);
        } else {
          d.add(g >> 12 | 224);
        }
        d.add(g >> 6 & 63 | 128);
      }
      d.add(g & 63 | 128);
    }
  }
  a = b;
  for (var e = 0; e < d.length; e++) {
    if (a is String) {
      a = int.parse(a) + d[e];
    } else {
      a += d[e];
    }
    a = wr(a, '+-a^+6');
  }
  a = wr(a, '+-3^+b+-f');
  a ^= tkk[1] != null ? tkk[1] + 0 : 0;
  if (0 > a) {
    a = (a & 2147483647) + 2147483648;
  }
  a %= 1E6;
  a = (a as double).round();
  return '$a.${a ^ int.parse(b)}';
}

List _tKK() {
  return ['406398', (561666268 + 1526272306)];
}

int wr(dynamic a, dynamic b) {
  // ignore: prefer_typing_uninitialized_variables
  var d;
  try {
    for (var c = 0; c < b.toString().length - 2; c += 3) {
      d = b[c + 2];
      d = 'a'.codeUnitAt(0) <= d.toString().codeUnitAt(0)
          ? (d[0].toString().codeUnitAt(0)) - 87
          : int.parse(d);
      d = '+' == b[c + 1] ? unsignedRightShift(a, d) : a << d;
      a = '+' == b[c] ? (a + (d as int) & 4294967295) : a ^ d;
    }
    return a;
  } on Error {
    rethrow;
  }
}

int unsignedRightShift(var a, var b) {
  int m;
  if (b >= 32 || b < -32) {
    m = (b / 32) as int;
    b = b - (m * 32);
  }

  if (b < 0) {
    b = 32 + b;
  }

  if (b == 0) {
    return ((a >> 1) & 0x7fffffff) * 2 + ((a >> b) & 1);
  }

  if (a < 0) {
    a = (a >> 1);
    a &= 2147483647;
    a |= 0x40000000;
    a = (a >> (b - 1));
  } else {
    a = (a >> b);
  }
  return a;
}

Future<MTran?> translator(
  String sourceText, {
  Lang from = Lang._auto,
  Lang to = Lang.en,
}) async {
  var dio = Dio();
  dio.options.queryParameters = {
    'client': 't',
    'sl': from.code,
    'tl': to.code,
    'hl': to.code,
    'dt': 't',
    'ie': 'UTF-8',
    'oe': 'UTF-8',
    'otf': '1',
    'ssel': '0',
    'tsel': '0',
    'kc': '7',
    'tk': generateToken(sourceText),
    'q': sourceText
  };
  var response = await dio.request(
    'https://translate.googleapis.com/translate_a/single',
    options: Options(
      method: 'GET',
    ),
  );

  if (response.statusCode == 200) {
    return MTran(
      s: response.data[0][0][0],
      type: response.data[2] ?? from.code,
    );
  } else {
    print(response.statusMessage);
    return null;
  }
}

class MTran {
  final String s;
  final String type;
  @override
  String toString() => 's=> $s, type: $type';

  MTran({required this.s, required this.type});
}

enum Lang implements Comparable<Lang> {
  _auto('Automatic', 'auto', 'auto'),
  af('Afrikaans', 'af', 'af'),
  sq('Albanian', 'sq', 'sq'),
  am('Amharic', 'am', 'am'),
  ar('Arabic', 'ar', 'ar'),
  hy('Armenian', 'hy', 'hy'),
  as('Assamese', 'as', 'as'),
  ay('Aymara', 'ay', 'ay'),
  az('Azerbaijani', 'az', 'az'),
  bm('Bambara', 'bm', 'bm'),
  eu('Basque', 'eu', 'eu'),
  be('Belarusian', 'be', 'be'),
  bn('Bengali', 'bn', 'bn'),
  bho('Bhojpuri', 'bho', 'bho'),
  bs('Bosnian', 'bs', 'bs'),
  bg('Bulgarian', 'bg', 'bg'),
  ca('Catalan', 'ca', 'ca'),
  ceb('Cebuano', 'ceb', 'ceb'),
  zhCn('Chinese (Simplified)', 'zh-cn', 'zhCn'),
  zhTw('Chinese (Traditional)', 'zh-tw', 'zhTw'),
  co('Corsican', 'co', 'co'),
  hr('Croatian', 'hr', 'hr'),
  cs('Czech', 'cs', 'cs'),
  da('Danish', 'da', 'da'),
  dv('Dhivehi', 'dv', 'dv'),
  doi('Dogri', 'doi', 'doi'),
  nl('Dutch', 'nl', 'nl'),
  en('English', 'en', 'en'),
  eo('Esperanto', 'eo', 'eo'),
  et('Estonian', 'et', 'et'),
  ee('Ewe', 'ee', 'ee'),
  fil('Filipino (Tagalog)', 'fil', 'fil'),
  fi('Finnish', 'fi', 'fi'),
  fr('French', 'fr', 'fr'),
  fy('Frisian', 'fy', 'fy'),
  gl('Galician', 'gl', 'gl'),
  ka('Georgian', 'ka', 'ka'),
  de('German', 'de', 'de'),
  el('Greek', 'el', 'el'),
  gn('Guarani', 'gn', 'gn'),
  gu('Gujarati', 'gu', 'gu'),
  ht('Haitian Creole', 'ht', 'ht'),
  ha('Hausa', 'ha', 'ha'),
  haw('Hawaiian', 'haw', 'haw'),
  he('Hebrew', 'he', 'he'),
  hi('Hindi', 'hi', 'hi'),
  hmn('Hmong', 'hmn', 'hmn'),
  hu('Hungarian', 'hu', 'hu'),
  iIs('Icelandic', 'is', 'is'),
  ig('Igbo', 'ig', 'ig'),
  ilo('Ilocano', 'ilo', 'ilo'),
  id('Indonesian', 'id', 'id'),
  ga('Irish', 'ga', 'ga'),
  it('Italian', 'it', 'it'),
  ja('Japanese', 'ja', 'ja'),
  jv('Javanese', 'jv', 'jv'),
  kn('Kannada', 'kn', 'kn'),
  kk('Kazakh', 'kk', 'kk'),
  km('Khmer', 'km', 'km'),
  rw('Kinyarwanda', 'rw', 'rw'),
  gom('Konkani', 'gom', 'gom'),
  ko('Korean', 'ko', 'ko'),
  kri('Krio', 'kri', 'kri'),
  ku('Kurdish (Kurmanji)', 'ku', 'ku'),
  ckb('Kurdish (Sorani)', 'ckb', 'ckb'),
  ky('Kyrgyz', 'ky', 'ky'),
  lo('Lao', 'lo', 'lo'),
  la('Latin', 'la', 'la'),
  lv('Latvian', 'lv', 'lv'),
  ln('Lingala', 'ln', 'ln'),
  lt('Lithuanian', 'lt', 'lt'),
  lg('Luganda', 'lg', 'lg'),
  lb('Luxembourgish', 'lb', 'lb'),
  mk('Macedonian', 'mk', 'mk'),
  mai('Maithili', 'mai', 'mai'),
  mg('Malagasy', 'mg', 'mg'),
  ms('Malay', 'ms', 'ms'),
  ml('Malayalam', 'ml', 'ml'),
  mt('Maltese', 'mt', 'mt'),
  mi('Maori', 'mi', 'mi'),
  mr('Marathi', 'mr', 'mr'),
  mniMtei('Meiteilon (Manipuri)', 'mni-mtei', 'mni-mtei'),
  lus('Mizo', 'lus', 'lus'),
  mn('Mongolian', 'mn', 'mn'),
  my('Myanmar (Burmese)', 'my', 'my'),
  ne('Nepali', 'ne', 'ne'),
  no('Norwegian', 'no', 'no'),
  ny('Nyanja (Chichewa)', 'ny', 'ny'),
  or('Odia (Oriya)', 'or', 'or'),
  om('Oromo', 'om', 'om'),
  ps('Pashto', 'ps', 'ps'),
  fa('Persian', 'fa', 'fa'),
  pl('Polish', 'pl', 'pl'),
  pt('Portuguese', 'pt', 'pt'),
  pa('Punjabi', 'pa', 'pa'),
  qu('Quechua', 'qu', 'qu'),
  ro('Romanian', 'ro', 'ro'),
  ru('Russian', 'ru', 'ru'),
  sm('Samoan', 'sm', 'sm'),
  sa('Sanskrit', 'sa', 'sa'),
  gd('Scots Gaelic', 'gd', 'gd'),
  nso('Sepedi', 'nso', 'nso'),
  sr('Serbian', 'sr', 'sr'),
  st('Sesotho', 'st', 'st'),
  sn('Shona', 'sn', 'sn'),
  sd('Sindhi', 'sd', 'sd'),
  si('Sinhala', 'si', 'si'),
  sk('Slovak', 'sk', 'sk'),
  sl('Slovenian', 'sl', 'sl'),
  so('Somali', 'so', 'so'),
  es('Spanish', 'es', 'es'),
  su('Sundanese', 'su', 'su'),
  sw('Swahili', 'sw', 'sw'),
  sv('Swedish', 'sv', 'sv'),
  tl('Tagalog (Filipino)', 'tl', 'tl'),
  tg('Tajik', 'tg', 'tg'),
  ta('Tamil', 'ta', 'ta'),
  tt('Tatar', 'tt', 'tt'),
  te('Telugu', 'te', 'te'),
  th('Thai', 'th', 'th'),
  ti('Tigrinya', 'ti', 'ti'),
  ts('Tsonga', 'ts', 'ts'),
  tr('Turkish', 'tr', 'tr'),
  tk('Turkmen', 'tk', 'tk'),
  ak('Twi (Akan)', 'ak', 'ak'),
  uk('Ukrainian', 'uk', 'uk'),
  ur('Urdu', 'ur', 'ur'),
  ug('Uyghur', 'ug', 'ug'),
  uz('Uzbek', 'uz', 'uz'),
  vi('Vietnamese', 'vi', 'vi'),
  cy('Welsh', 'cy', 'cy'),
  xh('Xhosa', 'xh', 'xh'),
  yi('Yiddish', 'yi', 'yi'),
  yo('Yoruba', 'yo', 'yo'),
  zu('Zulu', 'zu', 'zu');

  final String code;
  final String file;
  final String locale;
  const Lang(this.locale, this.code, this.file);

  @override
  int compareTo(Lang other) => index - other.index;
}

Lang getLangByString(String str) {
  if (Lang.values.any((e) => e.code == str)) {
    return Lang.values.firstWhere((e) => e.code == str);
  }
  throw Exception('$str Invalid!');
}
