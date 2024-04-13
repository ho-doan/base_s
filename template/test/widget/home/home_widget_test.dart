import 'dart:io';

import 'package:common/system/themes/themes.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/router/router.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/core/utils/utils.dart';
import 'package:template/feature/app/app.dart';

import '../../utils/dummy/category/category_model.dart';
import '../../utils/http_overrides.dart';
import 'home_widget_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CategoryUseCase>(),
  MockSpec<ProductUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MockHttpOverrides();
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
  testWidgets(
    'when success',
    (WidgetTester tester) async {
      when(mockCategoryUseCase.fetch())
          .thenAnswer((_) async => const Right([dummyCategoryModel]));
      when(productUseCase.fetch(1, token: anyNamed('token')))
          .thenAnswer((_) async => const Right([dummyProduct]));
      // Build our app and trigger a frame.
      await tester.pumpWidget(homeScreen);

      await tester.pump();

      expect(find.text(dummyCategoryModel.getName), findsNWidgets(1));

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text(dummyCategoryModel.getName), findsNWidgets(1));
    },
  );
  testWidgets(
    'when data empty',
    (WidgetTester tester) async {
      when(mockCategoryUseCase.fetch())
          .thenAnswer((_) async => const Right([]));
      // Build our app and trigger a frame.
      await tester.pumpWidget(homeScreen);

      await tester.pump();

      // expect(find.text('Data empty'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // expect(find.text('Data empty'), findsOneWidget);
    },
  );
  testWidgets(
    'when failure',
    (WidgetTester tester) async {
      when(mockCategoryUseCase.fetch())
          .thenAnswer((_) async => Left(ErrorState<String>(error: '')));
      // Build our app and trigger a frame.
      await tester.pumpWidget(homeScreen);

      await tester.pump();

      // expect(find.text('Error'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // expect(find.text('Error'), findsOneWidget);
    },
  );
}
