import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/feature/home/bloc/home_bloc.dart';

import '../../utils/dummy/category/category_model.dart';
import 'home_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CategoryUseCase>(),
  MockSpec<ProductUseCase>(),
])
void main() {
  late CategoryUseCase useCase;
  late ProductUseCase productUseCase;

  setUpAll(() {
    useCase = MockCategoryUseCase();
    productUseCase = MockProductUseCase();
  });

  group('home bloc unit', () {
    blocTest<HomeBloc, HomeState>(
      'when success',
      setUp: () {
        configureDependenciesTest();
        getItTesting
          ..unregister<CategoryUseCase>()
          ..registerFactory<CategoryUseCase>(() => useCase)
          ..unregister<ProductUseCase>()
          ..registerFactory<ProductUseCase>(() => productUseCase);
      },
      tearDown: getItTesting.reset,
      build: () {
        when(useCase.fetch()).thenAnswer(
          (_) async => const Right([dummyCategoryModel]),
        );
        when(productUseCase.fetch(1)).thenAnswer(
          (_) async => const Right([ProductModel(name: 'product')]),
        );
        return getItTesting<HomeBloc>();
      },
      act: (cubit) => cubit.add(const HomeEvent.started()),
      expect: () => [
        isA<$Loading>(),
        isA<$Data>(),
      ],
    );
    blocTest<HomeBloc, HomeState>(
      'when success data empty',
      setUp: () {
        configureDependenciesTest();
        getItTesting
          ..unregister<CategoryUseCase>()
          ..registerFactory<CategoryUseCase>(() => useCase)
          ..unregister<ProductUseCase>()
          ..registerFactory<ProductUseCase>(() => productUseCase);
      },
      tearDown: getItTesting.reset,
      build: () {
        when(useCase.fetch()).thenAnswer(
          (_) async => const Right([]),
        );
        return getItTesting<HomeBloc>();
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
        getItTesting
          ..unregister<CategoryUseCase>()
          ..registerFactory<CategoryUseCase>(() => useCase)
          ..unregister<ProductUseCase>()
          ..registerFactory<ProductUseCase>(() => productUseCase);
      },
      tearDown: getItTesting.reset,
      build: () {
        when(useCase.fetch()).thenAnswer(
          (_) async => Left(error),
        );
        return getIt<HomeBloc>();
      },
      act: (cubit) => cubit.add(const HomeEvent.started()),
      expect: () => [
        isA<$Loading>(),
        isA<$Data>(),
      ],
    );
  });
}
