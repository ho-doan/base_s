part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.loading() = _Loading;
  const factory HomeEvent.error(ErrorState error) = _Error;
  const factory HomeEvent.data({
    @Default(null) List<EntryModel>? entries,
    @Default(null) List<EntryModel>? entries1,
    @Default(null) List<EntryModel>? entries2,
    @Default(null) List<EntryModel>? entries3,
    @Default(null) Categories? categories,
  }) = _Data;
}
