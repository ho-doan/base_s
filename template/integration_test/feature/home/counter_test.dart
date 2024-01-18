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

import '../../../test/utils/dummy/entry/entry_model.dart';
import 'counter_test.mocks.dart';

@GenerateNiceMocks([MockSpec<EntryUseCase>()])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockEntryUseCase mockEntryUseCase;
  setUpAll(() {
    mockEntryUseCase = MockEntryUseCase();
    configureDependenciesTest();
    getIt
      ..unregister<EntryUseCase>()
      ..registerFactory<EntryUseCase>(() => mockEntryUseCase);
  });
  tearDownAll(getIt.reset);

  final homeScreen = MaterialApp(
    home: BlocProvider(
      create: (BuildContext context) =>
          getIt<HomeBloc>()..add(const HomeEvent.started()),
      child: const HomeScreen(),
    ),
  );

  group('Counter Integration', () {
    testWidgets(
      'when success',
      (tester) async {
        when(mockEntryUseCase.fetch())
            .thenAnswer((_) async => const Right([dummyEntryModel]));
        await tester.pumpWidget(homeScreen);

        await tester.pump();

        expect(find.text(dummyEntryModel.getName()), findsOneWidget);

        // Finds the floating action button to tap on.
        final fab = find.byIcon(Icons.add);

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        expect(find.text(dummyEntryModel.getName()), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        expect(find.text(dummyEntryModel.getName()), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        expect(find.text(dummyEntryModel.getName()), findsOneWidget);
      },
    );
    testWidgets(
      'when success data empty',
      (tester) async {
        when(mockEntryUseCase.fetch()).thenAnswer((_) async => const Right([]));
        await tester.pumpWidget(homeScreen);

        await tester.pump();

        expect(find.text('Data empty'), findsOneWidget);

        // Finds the floating action button to tap on.
        final fab = find.byIcon(Icons.add);

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        expect(find.text('Data empty'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        expect(find.text('Data empty'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        expect(find.text('Data empty'), findsOneWidget);
      },
    );
    testWidgets(
      'when failure',
      (tester) async {
        when(mockEntryUseCase.fetch())
            .thenAnswer((_) async => Left(ErrorState(error: '')));
        await tester.pumpWidget(homeScreen);

        await tester.pump();

        expect(find.text('Error'), findsOneWidget);

        // Finds the floating action button to tap on.
        final fab = find.byIcon(Icons.add);

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        expect(find.text('Error'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        expect(find.text('Error'), findsOneWidget);

        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        expect(find.text('Error'), findsOneWidget);
      },
    );
  });
}
