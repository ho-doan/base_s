import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/feature/home/bloc/home_bloc.dart';
import 'package:template/feature/home/home_screen.dart';

import '../../../test/utils/dummy/category/category_model.dart';
import 'home_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryUseCase>()])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockCategoryUseCase mockCategoryUseCase;
  setUpAll(() {
    mockCategoryUseCase = MockCategoryUseCase();
    configureDependenciesTest();
    getIt
      ..unregister<CategoryUseCase>()
      ..registerFactory<CategoryUseCase>(() => mockCategoryUseCase);
  });
  tearDownAll(getIt.reset);

  final homeScreen = MaterialApp(
    home: BlocProvider(
      create: (BuildContext context) =>
          getIt<HomeBloc>()..add(const HomeEvent.started()),
      child: const HomeScreen(),
    ),
  );

  group('Home Integration', () {
    testWidgets(
      'when success',
      (tester) async {
        when(mockCategoryUseCase.fetch(token: anyNamed('token')))
            .thenAnswer((_) async => const Right([dummyCategoryModel]));
        await tester.pumpWidget(homeScreen);

        await tester.pump(Durations.short4);

        expect(find.text(dummyCategoryModel.getName), findsNWidgets(4));

        // Finds the floating action button to tap on.
        final fab = find.byIcon(Icons.add);

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        await tester.pump(Durations.short4);

        expect(find.text(dummyCategoryModel.getName), findsNWidgets(4));

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        await tester.pump(Durations.short4);

        expect(find.text(dummyCategoryModel.getName), findsNWidgets(4));

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        await tester.pump(Durations.short4);

        expect(find.text(dummyCategoryModel.getName), findsNWidgets(4));
      },
    );
    testWidgets(
      'when success data empty',
      (tester) async {
        when(mockCategoryUseCase.fetch(token: anyNamed('token')))
            .thenAnswer((_) async => const Right([]));
        await tester.pumpWidget(homeScreen);

        await tester.pump(Durations.extralong3);

        expect(find.text('Data empty'), findsOneWidget);

        // Finds the floating action button to tap on.
        final fab = find.byIcon(Icons.add);

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong3);

        expect(find.text('Data empty'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong3);

        expect(find.text('Data empty'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong3);

        expect(find.text('Data empty'), findsOneWidget);
      },
    );
    testWidgets(
      'when failure',
      (tester) async {
        when(mockCategoryUseCase.fetch(token: anyNamed('token')))
            .thenAnswer((_) async => Left(ErrorState<String>(error: '')));
        await tester.pumpWidget(homeScreen);

        await tester.pump(Durations.extralong3);

        expect(find.text('Error'), findsOneWidget);

        // Finds the floating action button to tap on.
        final fab = find.byIcon(Icons.add);

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong3);

        expect(find.text('Error'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong3);

        expect(find.text('Error'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();
        await tester.pump(Durations.extralong3);

        expect(find.text('Error'), findsOneWidget);
      },
    );
  });
}
