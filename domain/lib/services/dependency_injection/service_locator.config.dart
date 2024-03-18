// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/local_data_sources/local_data_sources.dart' as _i6;
import '../../data/remote_data_sources/category/category_remote_data_source.dart'
    as _i3;
import '../../data/remote_data_sources/entry/entries_remote_data_source.dart'
    as _i10;
import '../../data/remote_data_sources/figma/figma_remote_data_source.dart'
    as _i13;
import '../../data/remote_data_sources/product/category_remote_data_source.dart'
    as _i16;
import '../../data/remote_data_sources/remote_data_sources.dart' as _i7;
import '../../repositories/category/category_repository.dart' as _i5;
import '../../repositories/entry/entry_repository.dart' as _i11;
import '../../repositories/figma/figma_repository.dart' as _i14;
import '../../repositories/product/product_repository.dart' as _i17;
import '../../repositories/repositories.dart' as _i9;
import '../../use_cases/category/category_use_case.dart' as _i8;
import '../../use_cases/entry/entry_use_case.dart' as _i12;
import '../../use_cases/figma/figma_use_case.dart' as _i15;
import '../../use_cases/product/product_use_case.dart' as _i18;
import '../networks/api_client.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CategoryRemoteDataSource>(
      () => _i3.CategoryRemoteDataSource(gh<_i4.ApiClient>()));
  gh.factory<_i5.CategoryRepository>(() => _i5.CategoryRepository(
        gh<_i6.CategoryLocalDataSource>(),
        gh<_i7.CategoryRemoteDataSource>(),
      ));
  gh.factory<_i8.CategoryUseCase>(
      () => _i8.CategoryUseCase(gh<_i9.CategoryRepository>()));
  gh.factory<_i10.EntryRemoteDataSource>(
      () => _i10.EntryRemoteDataSource(gh<_i4.ApiClient>()));
  gh.factory<_i11.EntryRepository>(() => _i11.EntryRepository(
        gh<_i6.EntryLocalDataSource>(),
        gh<_i10.EntryRemoteDataSource>(),
      ));
  gh.factory<_i12.EntryUseCase>(
      () => _i12.EntryUseCase(gh<_i9.EntryRepository>()));
  gh.factory<_i13.FigmaRemoteDataSource>(
      () => _i13.FigmaRemoteDataSource(gh<_i4.ApiClientFigma>()));
  gh.factory<_i14.FigmaRepository>(
      () => _i14.FigmaRepository(gh<_i7.FigmaRemoteDataSource>()));
  gh.factory<_i15.FigmaUseCase>(
      () => _i15.FigmaUseCase(gh<_i9.FigmaRepository>()));
  gh.factory<_i16.ProductRemoteDataSource>(
      () => _i16.ProductRemoteDataSource(gh<_i4.ApiClient>()));
  gh.factory<_i17.ProductRepository>(() => _i17.ProductRepository(
        gh<_i6.ProductLocalDataSource>(),
        gh<_i7.ProductRemoteDataSource>(),
      ));
  gh.factory<_i18.ProductUseCase>(
      () => _i18.ProductUseCase(gh<_i9.ProductRepository>()));
  return getIt;
}
