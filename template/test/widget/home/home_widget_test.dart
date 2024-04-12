import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/feature/home/bloc/home_bloc.dart';
import 'package:template/feature/home/home_screen.dart';

import '../../utils/dummy/category/category_model.dart';
import 'home_widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryUseCase>()])
void main() {
  final homeScreen = MaterialApp(
    home: BlocProvider(
      create: (BuildContext context) =>
          getIt<HomeBloc>()..add(const HomeEvent.started()),
      child: const HomeScreen(),
    ),
  );
  late MockCategoryUseCase mockCategoryUseCase;
  setUpAll(() {
    mockCategoryUseCase = MockCategoryUseCase();
    configureDependenciesTest();
    getIt
      ..unregister<CategoryUseCase>()
      ..registerFactory<CategoryUseCase>(() => mockCategoryUseCase);
  });
  tearDownAll(getIt.reset);
  testWidgets(
    'when success',
    (WidgetTester tester) async {
      when(mockCategoryUseCase.fetch())
          .thenAnswer((_) async => const Right([dummyCategoryModel]));
      // Build our app and trigger a frame.
      await tester.pumpWidget(homeScreen);

      await tester.pump();

      expect(find.text(dummyCategoryModel.getName), findsNWidgets(4));

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text(dummyCategoryModel.getName), findsNWidgets(4));
    },
  );
  testWidgets(
    'when entries empty',
    (WidgetTester tester) async {
      when(mockCategoryUseCase.fetch())
          .thenAnswer((_) async => const Right([]));
      // Build our app and trigger a frame.
      await tester.pumpWidget(homeScreen);

      await tester.pump();

      expect(find.text('Data empty'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('Data empty'), findsOneWidget);
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

      expect(find.text('Error'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('Error'), findsOneWidget);
    },
  );
}
