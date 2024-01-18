import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._useCase) : super(const $Initial()) {
    on<HomeEvent>((event, emit) {
      return event.when<void>(
        started: () async {
          add(const HomeEvent.loading());
          final res = await _useCase.fetch();
          res.fold(
            (l) => add(HomeEvent.error(l)),
            (r) => add(HomeEvent.data(r)),
          );
        },
        loading: () => emit(const HomeState.loading()),
        error: (e) => emit(HomeState.error(e)),
        data: (e) => emit(HomeState.data(e)),
      );
    });
  }

  final EntryUseCase _useCase;
}
