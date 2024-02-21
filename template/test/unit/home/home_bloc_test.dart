import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/feature/home/bloc/home_bloc.dart';

import '../../utils/dummy/entry/entry_model.dart';
import 'home_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<EntryUseCase>()])
void main() {
  late EntryUseCase useCase;

  setUpAll(() {
    useCase = MockEntryUseCase();
  });

  group('home bloc unit', () {
    blocTest<HomeBloc, HomeState>(
      'when success',
      setUp: () {
        configureDependenciesTest();
        getIt
          ..unregister<EntryUseCase>()
          ..registerFactory<EntryUseCase>(() => useCase);
      },
      tearDown: getIt.reset,
      build: () {
        when(useCase.fetch()).thenAnswer(
          (_) async => const Right([dummyEntryModel]),
        );
        return getIt<HomeBloc>();
      },
      act: (cubit) => cubit.add(const HomeEvent.started()),
      expect: () => [
        isA<$Loading>(),
        isA<$Data>(),
        isA<$Data>(),
        isA<$Data>(),
        isA<$Data>(),
      ],
    );
    blocTest<HomeBloc, HomeState>(
      'when success entries empty',
      setUp: () {
        configureDependenciesTest();
        getIt
          ..unregister<EntryUseCase>()
          ..registerFactory<EntryUseCase>(() => useCase);
      },
      tearDown: getIt.reset,
      build: () {
        when(useCase.fetch()).thenAnswer(
          (_) async => const Right([]),
        );
        return getIt<HomeBloc>();
      },
      act: (cubit) => cubit.add(const HomeEvent.started()),
      expect: () => [
        isA<$Loading>(),
        isA<$Data>(),
      ],
    );
    final error = ErrorState<String>(error: 'error');
    blocTest<HomeBloc, HomeState>(
      'when failure',
      setUp: () {
        configureDependenciesTest();
        getIt
          ..unregister<EntryUseCase>()
          ..registerFactory<EntryUseCase>(() => useCase);
      },
      tearDown: getIt.reset,
      build: () {
        when(useCase.fetch()).thenAnswer(
          (_) async => Left(error),
        );
        return getIt<HomeBloc>();
      },
      act: (cubit) => cubit.add(const HomeEvent.started()),
      expect: () => [
        isA<$Loading>(),
        $Error(error),
      ],
    );
  });
}
