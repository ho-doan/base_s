import 'dart:io';

import 'package:common/system/themes/themes.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/router/router.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/core/utils/utils.dart';
import 'package:template/feature/app/app.dart';

import '../../../test/utils/dummy/category/category_model.dart';
import '../../../test/utils/http_overrides.dart';
import 'home_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CategoryUseCase>(),
  MockSpec<ProductUseCase>(),
])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MockHttpOverrides();
  late MockCategoryUseCase mockCategoryUseCase;
  late ProductUseCase productUseCase;
  setUpAll(() {
    mockCategoryUseCase = MockCategoryUseCase();
    productUseCase = MockProductUseCase();
    configureDependenciesTest();
    getIt
      ..unregister<CategoryUseCase>()
      ..registerFactory<CategoryUseCase>(() => mockCategoryUseCase)
      ..unregister<ProductUseCase>()
      ..registerFactory(() => productUseCase);
  });
  tearDownAll(getIt.reset);

  final homeScreen = MaterialApp.router(
    scrollBehavior: MyCustomScrollBehavior(),
    routerDelegate: Routers.ins.$router.routerDelegate,
    routeInformationProvider: Routers.ins.$router.routeInformationProvider,
    routeInformationParser: Routers.ins.$router.routeInformationParser,
    title: 'Flutter Demo',
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    theme: AppThemes.internal().lightTheme,
    darkTheme: AppThemes.internal().dartTheme,
  );

  group('Home Integration', () {
    testWidgets(
      'when success',
      (tester) async {
        when(mockCategoryUseCase.fetch(token: anyNamed('token')))
            .thenAnswer((_) async => const Right([dummyCategoryModel]));
        when(productUseCase.fetch(1, token: anyNamed('token')))
            .thenAnswer((_) async => const Right([dummyProduct]));
        await tester.pumpWidget(homeScreen);

        await tester.pump(Durations.short4);

        expect(find.text(dummyCategoryModel.getName), findsNWidgets(1));

        // Finds the floating action button to tap on.
        final fab = find.byIcon(Icons.add);

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        await tester.pump(Durations.short4);

        expect(find.text(dummyCategoryModel.getName), findsNWidgets(1));

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        await tester.pump(Durations.short4);

        expect(find.text(dummyCategoryModel.getName), findsNWidgets(1));

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        await tester.pump(Durations.short4);

        expect(find.text(dummyCategoryModel.getName), findsNWidgets(1));
      },
    );
    testWidgets(
      'when success data empty',
      (tester) async {
        when(mockCategoryUseCase.fetch(token: anyNamed('token')))
            .thenAnswer((_) async => const Right([]));
        await tester.pumpWidget(homeScreen);

        await tester.pump(Durations.extralong4);

        // expect(find.text('Data empty'), findsOneWidget);

        // Finds the floating action button to tap on.
        final fab = find.byIcon(Icons.add);

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong4);

        // expect(find.text('Data empty'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong4);

        // expect(find.text('Data empty'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong4);

        // expect(find.text('Data empty'), findsOneWidget);
      },
    );
    testWidgets(
      'when failure',
      (tester) async {
        when(mockCategoryUseCase.fetch(token: anyNamed('token')))
            .thenAnswer((_) async => Left(ErrorState<String>(error: '')));
        await tester.pumpWidget(homeScreen);

        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong4);

        // expect(find.text('Error'), findsOneWidget);

        // Finds the floating action button to tap on.
        final fab = find.byIcon(Icons.add);

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong4);

        // expect(find.text('Error'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong4);

        // expect(find.text('Error'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong4);

        // expect(find.text('Error'), findsOneWidget);
      },
    );
  });
}
