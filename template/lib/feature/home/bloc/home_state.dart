part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = $Initial;
  const factory HomeState.loading() = $Loading;
  const factory HomeState.error(ErrorState error) = $Error;
  const factory HomeState.data({
    @Default([]) List<EntryModel>? entries,
    @Default([]) List<EntryModel>? entries1,
    @Default([]) List<EntryModel>? entries2,
    @Default([]) List<EntryModel>? entries3,
  }) = $Data;
}
