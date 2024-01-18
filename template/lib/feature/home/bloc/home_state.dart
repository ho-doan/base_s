part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = $Initial;
  const factory HomeState.loading() = $Loading;
  const factory HomeState.error(ErrorState error) = $Error;
  const factory HomeState.data(List<EntryModel> entries) = $Data;
}
