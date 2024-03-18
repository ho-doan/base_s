part of 'figma_bloc.dart';

@freezed
class FigmaEvent with _$FigmaEvent {
  const factory FigmaEvent.started() = _Started;
  const factory FigmaEvent.loading() = _Loading;
  const factory FigmaEvent.error(ErrorState error) = _Error;
  const factory FigmaEvent.data({
    @Default(null) FigmaFile? file,
  }) = _Data;
}
