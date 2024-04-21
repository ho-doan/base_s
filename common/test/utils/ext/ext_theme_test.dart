import 'package:common/common.dart';
import 'package:common/generator/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void main() {
  Widget app({ThemeMode mode = ThemeMode.system}) => MaterialApp(
        themeMode: mode,
        theme: AppThemes.internal().lightTheme,
        darkTheme: AppThemes.internal().dartTheme,
        home: Home(),
      );
  group('Theme ext', () {
    testWidgets('with system', (tester) async {
      await tester.pumpWidget(app());
      final context = tester.element(find.byType(Home));
      //#region ext
      expect(context.theme, isA<ThemeData>());

      expect(context.theme.colors, isA<AppColors>());
      expect(context.theme.colors.black, isA<Color>());
      expect(context.theme.colors.black, ColorName.black);

      expect(context.theme.styles, isA<AppStyles>());
      expect(context.theme.styles.c1, isA<TextStyle>());
      expect(context.theme.styles.c1.fontSize, 14);
      //#endregion
      //#region style
      var themeCp = Theme.of(context).copyWith(extensions: [
        context.theme.styles.copyWith(c1: TextStyle(fontSize: 15))
      ]);
      expect(themeCp.styles.c1.fontSize, 15);
      expect(themeCp.styles.c2.fontWeight, FontWeight.w500);
      themeCp = Theme.of(context).copyWith(
        extensions: [context.theme.styles.copyWith(c1: null)],
      );
      expect(themeCp.styles.c1.fontSize, 14);
      expect(themeCp.styles.c2.fontWeight, FontWeight.w500);

      themeCp = Theme.of(context).copyWith(extensions: [
        context.theme.styles.lerp(null, .4),
      ]);
      expect(themeCp.styles.c1.fontSize, 14);
      expect(themeCp.styles.c2.fontWeight, FontWeight.w500);

      themeCp = Theme.of(context).copyWith(extensions: [
        context.theme.styles.lerp(AppStyles.internal(), .4),
      ]);
      expect(themeCp.styles.c1.fontSize, 14);
      expect(themeCp.styles.c2.fontWeight, FontWeight.w500);
      //#endregion
      //#region color
      themeCp = Theme.of(context).copyWith(
        extensions: [context.theme.colors.copyWith(black: Colors.red)],
      );
      expect(themeCp.colors.black, Colors.red);
      expect(themeCp.colors.white, ColorName.white);

      themeCp = Theme.of(context).copyWith(
        extensions: [context.theme.colors.copyWith(black: null)],
      );
      expect(themeCp.colors.black, ColorName.black);
      expect(themeCp.colors.white, ColorName.white);

      themeCp = Theme.of(context).copyWith(extensions: [
        context.theme.colors.lerp(null, .4),
      ]);
      expect(themeCp.colors.black, ColorName.black);
      expect(themeCp.colors.white, ColorName.white);

      themeCp = Theme.of(context).copyWith(extensions: [
        context.theme.colors.lerp(AppColors.light(), .4),
      ]);
      expect(themeCp.colors.black, ColorName.black);
      //#endregion
    });
    testWidgets('with light', (tester) async {
      await tester.pumpWidget(app(mode: ThemeMode.light));
      final context = tester.element(find.byType(Home));

      expect(context.theme, isA<ThemeData>());

      expect(context.theme.colors, isA<AppColors>());
      expect(context.theme.colors.black, isA<Color>());
      expect(context.theme.colors.black, ColorName.black);

      expect(context.theme.styles, isA<AppStyles>());
      expect(context.theme.styles.c1, isA<TextStyle>());
      expect(context.theme.styles.c1.fontSize, 14);
    });
    testWidgets('with dark', (tester) async {
      await tester.pumpWidget(app(mode: ThemeMode.dark));
      final context = tester.element(find.byType(Home));

      expect(context.theme, isA<ThemeData>());

      expect(context.theme.colors, isA<AppColors>());
      expect(context.theme.colors.black, isA<Color>());
      expect(context.theme.colors.black, ColorName.white);

      expect(context.theme.styles, isA<AppStyles>());
      expect(context.theme.styles.c1, isA<TextStyle>());
      expect(context.theme.styles.c1.fontSize, 14);
    });
  });
}
