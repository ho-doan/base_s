import 'package:flutter/material.dart';

import '../../generator/colors.gen.dart';
import '../../generator/fonts.gen.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors._({
    required this.black,
    required this.white,
    required this.borderColor,
  });

  factory AppColors.light() => const AppColors._(
        black: ColorName.black,
        white: ColorName.white,
        borderColor: ColorName.borderColorLight,
      );
  factory AppColors.dark() => const AppColors._(
        black: ColorName.black,
        white: ColorName.white,
        borderColor: ColorName.borderColorDart,
      );

  final Color black;
  final Color white;
  final Color borderColor;

  @override
  ThemeExtension<AppColors> copyWith({
    Color? black,
    Color? white,
    Color? borderColor,
  }) {
    return AppColors._(
      black: black ?? this.black,
      white: white ?? this.white,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors._(
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }
}

const _baseStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

class AppStyles extends ThemeExtension<AppStyles> {
  const AppStyles._({
    required this.c1,
    required this.c2,
    required this.h1,
    required this.h2,
    required this.l1,
    required this.l2,
  });

  factory AppStyles.internal() => AppStyles._(
        c1: _baseStyle.copyWith(fontSize: 14),
        c2: _baseStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        h1: _baseStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
        h2: _baseStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        l1: _baseStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
        l2: _baseStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
      );

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle c1;
  final TextStyle c2;
  final TextStyle l1;
  final TextStyle l2;

  @override
  ThemeExtension<AppStyles> copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? c1,
    TextStyle? c2,
    TextStyle? l1,
    TextStyle? l2,
  }) {
    return AppStyles._(
      c1: c1 ?? this.c1,
      c2: c2 ?? this.c2,
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      l1: l1 ?? this.l1,
      l2: l2 ?? this.l2,
    );
  }

  @override
  ThemeExtension<AppStyles> lerp(
    ThemeExtension<AppStyles>? other,
    double t,
  ) {
    if (other is! AppStyles) {
      return this;
    }
    return AppStyles._(
      c1: TextStyle.lerp(c1, other.c1, t)!,
      c2: TextStyle.lerp(c2, other.c2, t)!,
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      l1: TextStyle.lerp(l1, other.l1, t)!,
      l2: TextStyle.lerp(l2, other.l2, t)!,
    );
  }
}

class AppThemes {
  AppThemes.internal();
  ThemeData get lightTheme => ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>{
          AppColors.light(),
          AppStyles.internal(),
        },
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: FontFamily.sFPro,
            ),
      );
  ThemeData get dartTheme => ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>{
          AppColors.dark(),
          AppStyles.internal(),
        },
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: FontFamily.sFPro,
            ),
      );
}
