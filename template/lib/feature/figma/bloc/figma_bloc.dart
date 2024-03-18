import 'dart:developer' as dev;

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'figma_bloc.freezed.dart';
part 'figma_event.dart';
part 'figma_state.dart';

class FigmaBloc extends Bloc<FigmaEvent, FigmaState> {
  FigmaBloc(this._figmaUseCase) : super(const $Initial()) {
    on<FigmaEvent>((event, emit) {
      return event.when<void>(
        started: () async {
          dev.Timeline.startSync('test performance figma');

          add(const FigmaEvent.loading());

          // final homeFetch = HomeFetch(
          //   us: _useCase,
          //   usCate: _categoryUseCase,
          //   token: kTest ? null : RootIsolateToken.instance!,
          // );

          // final result = await computeApp(_fetchRes, homeFetch);
          // add(result);

          final file = await _figmaUseCase.fetchFile();

          file.fold((l) => throw l, (r) => add(FigmaEvent.data(file: r)));

          dev.Timeline.finishSync();
        },
        loading: () => emit(const FigmaState.loading()),
        error: (e) => emit(FigmaState.error(e)),
        data: (e) {
          emit(FigmaState.data(file: e));
        },
      );
    });
  }

  final FigmaUseCase _figmaUseCase;
}

// FutureOr<HomeEvent> _fetchRes(HomeFetch h) async {
//   final result = await h.us.fetch(token: h.token);
//   final data = result.fold((l) => l, (r) => r);
//   if (data is ErrorState) {
//     return HomeEvent.error(data);
//   }
//   data as List<EntryModel>;
//   if (data.isEmpty) return const HomeEvent.data();
//   return HomeEvent.data(entries: data);
// }
