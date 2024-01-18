// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/local_data_sources/entry/entry_local_data_source.dart'
    as _i3;
import '../../data/remote_data_sources/entry/entries_remote_data_source.dart'
    as _i4;
import '../../repositories/entry/entry_repository.dart' as _i6;
import '../../repositories/repositories.dart' as _i8;
import '../../use_cases/entry/entry_use_case.dart' as _i7;
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
  gh.factory<_i3.EntryLocalDataSource>(() => _i3.EntryLocalDataSource());
  gh.factory<_i4.EntryRemoteDataSource>(
      () => _i4.EntryRemoteDataSource(gh<_i5.ApiClient>()));
  gh.factory<_i6.EntryRepository>(() => _i6.EntryRepository(
        gh<_i3.EntryLocalDataSource>(),
        gh<_i4.EntryRemoteDataSource>(),
      ));
  gh.factory<_i7.EntryUseCase>(
      () => _i7.EntryUseCase(gh<_i8.EntryRepository>()));
  return getIt;
}
