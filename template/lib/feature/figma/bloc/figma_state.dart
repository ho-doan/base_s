part of 'figma_bloc.dart';

@freezed
class FigmaState with _$FigmaState {
  const factory FigmaState.initial() = $Initial;
  const factory FigmaState.loading() = $Loading;
  const factory FigmaState.error(ErrorState error) = $Error;
  const factory FigmaState.data({
    @Default(null) FigmaFile? file,
  }) = $Data;
}
