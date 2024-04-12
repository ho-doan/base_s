// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../feature/app/cubit/app_cubit.dart' as _i3;
import '../../../feature/home/bloc/home_bloc.dart' as _i4;
import '../../../feature/product/widget/product_item/bloc/product_item_bloc.dart'
    as _i6;

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
  gh.factory<_i3.AppCubit>(() => _i3.AppCubit());
  gh.factory<_i4.HomeBloc>(() => _i4.HomeBloc(gh<_i5.CategoryUseCase>()));
  gh.factory<_i6.ProductItemBloc>(
      () => _i6.ProductItemBloc(gh<_i5.ProductUseCase>()));
  return getIt;
}
