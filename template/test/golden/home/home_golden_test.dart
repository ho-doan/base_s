import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/feature/home/home_screen.dart';

import '../../utils/dummy/category/category_model.dart';
import 'home_golden_test.mocks.dart';
import 'step/i_see_widget.dart';
import 'step/i_tab_icon_widget.dart';
import 'step/is_rendered_home_screen.dart';
import 'step/is_running_home_screen.dart';
import 'step/screenshot_verified.dart';

@GenerateNiceMocks([MockSpec<CategoryUseCase>()])
void main() {
  late MockCategoryUseCase mockCategoryUseCase;
  setUpAll(() {
    mockCategoryUseCase = MockCategoryUseCase();
    configureDependenciesTest();
    getIt
      ..unregister<CategoryUseCase>()
      ..registerFactory<CategoryUseCase>(() => mockCategoryUseCase);
  });
  tearDownAll(getIt.reset);
  group('Home golden test', () {
    testWidgets('when success', (tester) async {
      when(mockCategoryUseCase.fetch(token: anyNamed('token')))
          .thenAnswer((_) async => const Right([dummyCategoryModel]));
      await runningHomeScreen(tester);
      await iSeeNText(tester, dummyCategoryModel.getName, 4);
    });
    testWidgets('when success tab', (tester) async {
      when(mockCategoryUseCase.fetch(token: anyNamed('token')))
          .thenAnswer((_) async => const Right([dummyCategoryModel]));
      await runningHomeScreen(tester);
      await iSeeNText(tester, dummyCategoryModel.getName, 4);
      await iTapIcon(tester, Icons.add);
      await iSeeNText(tester, dummyCategoryModel.getName, 4);
    });
    testGoldens('when success data is not empty', (tester) async {
      when(mockCategoryUseCase.fetch(token: anyNamed('token'))).thenAnswer(
        (_) async => Right([for (int i = 0; i < 10; i++) dummyCategoryModel]),
      );
      await runningRenderedHomeScreen(tester);
      await screenshotVerifiedCounter(tester, 'home_screen_data');
      addTearDown(() => tester.view.reset());
    });
    testGoldens('when success data is empty', (tester) async {
      when(mockCategoryUseCase.fetch(token: anyNamed('token')))
          .thenAnswer((_) async => const Right([]));
      await runningRenderedHomeScreen(tester);
      await screenshotVerifiedCounter(tester, 'home_screen_empty');
      addTearDown(() => tester.view.reset());
    });
    testGoldens('when failure', (tester) async {
      when(mockCategoryUseCase.fetch(token: anyNamed('token')))
          .thenAnswer((_) async => Left(ErrorState<String>(error: '')));
      await runningRenderedHomeScreen(tester);
      await screenshotVerifiedCounter(tester, 'home_screen_failure');
      addTearDown(() => tester.view.reset());
    });

    testWidgets(
      'when success data is empty',
      (tester) async {
        when(mockCategoryUseCase.fetch(token: anyNamed('token')))
            .thenAnswer((_) async => const Right([dummyCategoryModel]));
        await loadAppFonts();
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(
            devices: [
              Device.iphone11,
            ],
          )
          ..addScenario(widget: homeScreen);
        await tester.pumpDeviceBuilder(builder);
        await iTapIcon(tester, Icons.add);
        await expectLater(
          find.byType(HomeScreen),
          matchesGoldenFile('goldens/home_initial.png'),
        );
      },
    );
  });
}
