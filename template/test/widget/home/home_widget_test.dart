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

import '../../utils/dummy/entry/entry_model.dart';
import 'home_widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<EntryUseCase>()])
void main() {
  final homeScreen = MaterialApp(
    home: BlocProvider(
      create: (BuildContext context) =>
          getIt<HomeBloc>()..add(const HomeEvent.started()),
      child: const HomeScreen(),
    ),
  );
  late MockEntryUseCase mockEntryUseCase;
  setUpAll(() {
    mockEntryUseCase = MockEntryUseCase();
    configureDependenciesTest();
    getIt
      ..unregister<EntryUseCase>()
      ..registerFactory<EntryUseCase>(() => mockEntryUseCase);
  });
  tearDownAll(getIt.reset);
  testWidgets(
    'when success',
    (WidgetTester tester) async {
      when(mockEntryUseCase.fetch())
          .thenAnswer((_) async => const Right([dummyEntryModel]));
      // Build our app and trigger a frame.
      await tester.pumpWidget(homeScreen);

      await tester.pump();

      expect(find.text(dummyEntryModel.getName()), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text(dummyEntryModel.getName()), findsOneWidget);
    },
  );
  testWidgets(
    'when entries empty',
    (WidgetTester tester) async {
      when(mockEntryUseCase.fetch()).thenAnswer((_) async => const Right([]));
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
      when(mockEntryUseCase.fetch())
          .thenAnswer((_) async => Left(ErrorState(error: '')));
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
