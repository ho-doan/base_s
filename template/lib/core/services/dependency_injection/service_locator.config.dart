// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../feature/figma/bloc/figma_bloc.dart' as _i3;
import '../../../feature/home/bloc/home_bloc.dart' as _i5;
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
  gh.factory<_i3.FigmaBloc>(() => _i3.FigmaBloc(gh<_i4.FigmaUseCase>()));
  gh.factory<_i5.HomeBloc>(() => _i5.HomeBloc(
        gh<_i4.EntryUseCase>(),
        gh<_i4.CategoryUseCase>(),
      ));
  gh.factory<_i6.ProductItemBloc>(
      () => _i6.ProductItemBloc(gh<_i4.ProductUseCase>()));
  return getIt;
}
