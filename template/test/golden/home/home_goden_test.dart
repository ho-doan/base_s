import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/feature/home/home_screen.dart';

import '../../utils/dummy/entry/entry_model.dart';
import 'home_goden_test.mocks.dart';
import 'step/i_see_widget.dart';
import 'step/i_tab_icon_widget.dart';
import 'step/is_rendered_home_screen.dart';
import 'step/is_running_home_screen.dart';
import 'step/screenshot_verified.dart';

@GenerateNiceMocks([MockSpec<EntryUseCase>()])
void main() {
  late MockEntryUseCase mockEntryUseCase;
  setUpAll(() {
    mockEntryUseCase = MockEntryUseCase();
    configureDependenciesTest();
    getIt
      ..unregister<EntryUseCase>()
      ..registerFactory<EntryUseCase>(() => mockEntryUseCase);
  });
  tearDownAll(getIt.reset);
  group('Counter', () {
    testWidgets('when success', (tester) async {
      when(mockEntryUseCase.fetch())
          .thenAnswer((_) async => const Right([dummyEntryModel]));
      await runningCounter(tester);
      await iSeeText(tester, dummyEntryModel.getName());
    });
    testWidgets('when success tab', (tester) async {
      when(mockEntryUseCase.fetch())
          .thenAnswer((_) async => const Right([dummyEntryModel]));
      await runningCounter(tester);
      await iSeeText(tester, dummyEntryModel.getName());
      await iTapIcon(tester, Icons.add);
      await iSeeText(tester, dummyEntryModel.getName());
    });
    testGoldens('when success data is not empty', (tester) async {
      when(mockEntryUseCase.fetch())
          .thenAnswer((_) async => const Right([dummyEntryModel]));
      await runningRenderedCounter(tester);
      await screenshotVerifiedCounter(tester, 'home_screen_data');
      addTearDown(() => tester.view.reset());
    });
    testGoldens('when success data is empty', (tester) async {
      when(mockEntryUseCase.fetch()).thenAnswer((_) async => const Right([]));
      await runningRenderedCounter(tester);
      await screenshotVerifiedCounter(tester, 'home_screen_empty');
      addTearDown(() => tester.view.reset());
    });
    testGoldens('when failure', (tester) async {
      when(mockEntryUseCase.fetch())
          .thenAnswer((_) async => Left(ErrorState(error: '')));
      await runningRenderedCounter(tester);
      await screenshotVerifiedCounter(tester, 'home_screen_failure');
      addTearDown(() => tester.view.reset());
    });

    testWidgets(
      'when success data is empty',
      (tester) async {
        when(mockEntryUseCase.fetch())
            .thenAnswer((_) async => const Right([dummyEntryModel]));
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
