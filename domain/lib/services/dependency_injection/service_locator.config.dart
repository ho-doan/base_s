// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/local_data_sources/category/category_local_data_source.dart'
    as _i3;
import '../../data/local_data_sources/local_data_sources.dart' as _i7;
import '../../data/local_data_sources/product/product_local_data_source.dart'
    as _i11;
import '../../data/remote_data_sources/category/category_remote_data_source.dart'
    as _i4;
import '../../data/remote_data_sources/product/product_remote_data_source.dart'
    as _i12;
import '../../data/remote_data_sources/remote_data_sources.dart' as _i8;
import '../../repositories/category/category_repository.dart' as _i6;
import '../../repositories/product/product_repository.dart' as _i13;
import '../../repositories/repositories.dart' as _i10;
import '../../use_cases/category/category_use_case.dart' as _i9;
import '../../use_cases/product/product_use_case.dart' as _i14;
import '../networks/api_client.dart' as _i5;

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
  gh.factory<_i3.CategoryLocalDataSource>(() => _i3.CategoryLocalDataSource());
  gh.factory<_i4.CategoryRemoteDataSource>(
      () => _i4.CategoryRemoteDataSource(gh<_i5.ApiClient>()));
  gh.factory<_i6.CategoryRepository>(() => _i6.CategoryRepository(
        gh<_i7.CategoryLocalDataSource>(),
        gh<_i8.CategoryRemoteDataSource>(),
      ));
  gh.factory<_i9.CategoryUseCase>(
      () => _i9.CategoryUseCase(gh<_i10.CategoryRepository>()));
  gh.factory<_i11.ProductLocalDataSource>(() => _i11.ProductLocalDataSource());
  gh.factory<_i12.ProductRemoteDataSource>(
      () => _i12.ProductRemoteDataSource(gh<_i5.ApiClient>()));
  gh.factory<_i13.ProductRepository>(() => _i13.ProductRepository(
        gh<_i7.ProductLocalDataSource>(),
        gh<_i8.ProductRemoteDataSource>(),
      ));
  gh.factory<_i14.ProductUseCase>(
      () => _i14.ProductUseCase(gh<_i10.ProductRepository>()));
  return getIt;
}
