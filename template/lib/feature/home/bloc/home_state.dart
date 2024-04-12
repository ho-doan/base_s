part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = $Initial;
  const factory HomeState.loading() = $Loading;
  const factory HomeState.error(ErrorState error) = $Error;
  const factory HomeState.data({
    @Default(Categories.started()) Categories categories,
  }) = $Data;
}

@freezed
class Categories with _$Categories {
  const factory Categories.started() = _CateStarted;
  const factory Categories.loading() = _CateLoading;
  const factory Categories.error(ErrorState error) = _CateError;
  const factory Categories.data(List<CategoryModel> categories) = _CateData;
}
