part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.loading() = _Loading;
  const factory HomeEvent.error(ErrorState error) = _Error;
  const factory HomeEvent.data({
    List<EntryModel>? entries,
    List<EntryModel>? entries1,
    List<EntryModel>? entries2,
    List<EntryModel>? entries3,
  }) = _Data;
}
