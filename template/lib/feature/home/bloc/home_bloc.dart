import 'dart:async';
import 'dart:developer' as dev;

import 'package:domain/domain.dart';
import 'package:domain/utils/is_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._useCase) : super(const $Initial()) {
    on<HomeEvent>((event, emit) {
      return event.when<void>(
        started: () async {
          dev.Timeline.startSync('test performance home');

          add(const HomeEvent.loading());

          final homeFetch = HomeFetch(
            us: _useCase,
            token: kIsWeb || kTest ? null : RootIsolateToken.instance!,
          );

          final result = await computeApp(_fetchRes, homeFetch);
          add(result);

          unawaited(computeApp(_fetchRes1, homeFetch).then(add));
          unawaited(computeApp(_fetchRes2, homeFetch).then(add));
          unawaited(computeApp(_fetchRes3, homeFetch).then(add));

          dev.Timeline.finishSync();
        },
        loading: () => emit(const HomeState.loading()),
        error: (e) => emit(HomeState.error(e)),
        data: (e, e1, e2, e3) {
          final s = state;
          if (s is $Loading) {
            emit($Data(entries1: e1, entries2: e2, entries3: e3, entries: e));
            return;
          }
          if (s is! $Data) return;
          if (e != null) {
            emit(s.copyWith.call(entries: e));
          }
          if (e1 != null) {
            emit(s.copyWith.call(entries1: e1));
          }
          if (e2 != null) {
            emit(s.copyWith.call(entries2: e2));
          }
          if (e3 != null) {
            emit(s.copyWith.call(entries3: e3));
          }
        },
      );
    });
  }

  final EntryUseCase _useCase;
}

FutureOr<HomeEvent> _fetchRes(HomeFetch h) async {
  final result = await h.us.fetch(token: h.token);
  final data = result.fold((l) => l, (r) => r);
  if (data is ErrorState) {
    return HomeEvent.error(data);
  }
  data as List<EntryModel>;
  if (data.isEmpty) return const HomeEvent.data();
  return HomeEvent.data(entries: data);
}

FutureOr<HomeEvent> _fetchRes1(HomeFetch h) async {
  final result = await h.us.fetch(token: h.token);
  final data = result.fold((l) => l, (r) => r);
  if (data is ErrorState) {
    return HomeEvent.error(data);
  }
  data as List<EntryModel>;
  if (data.isEmpty) return const HomeEvent.data();
  return HomeEvent.data(entries1: data);
}

FutureOr<HomeEvent> _fetchRes2(HomeFetch h) async {
  final result = await h.us.fetch(token: h.token);
  final data = result.fold((l) => l, (r) => r);
  if (data is ErrorState) {
    return HomeEvent.error(data);
  }
  data as List<EntryModel>;
  if (data.isEmpty) return const HomeEvent.data();
  return HomeEvent.data(entries2: data);
}

FutureOr<HomeEvent> _fetchRes3(HomeFetch h) async {
  final result = await h.us.fetch(token: h.token);
  final data = result.fold((l) => l, (r) => r);

  if (data is ErrorState) {
    return HomeEvent.error(data);
  }
  data as List<EntryModel>;
  if (data.isEmpty) return const HomeEvent.data();
  return HomeEvent.data(entries3: data);
}

extension HomeStateX on HomeState {
  bool get isData => maybeMap(orElse: () => false, data: (_) => true);
  bool get isError => maybeMap(orElse: () => false, error: (_) => true);
  List<EntryModel> get entries => maybeMap(
        orElse: () => <EntryModel>[],
        data: (_) => _.entries ?? <EntryModel>[],
      );
  List<EntryModel> get entries1 => maybeMap(
        orElse: () => <EntryModel>[],
        data: (_) => _.entries1 ?? <EntryModel>[],
      );
  List<EntryModel> get entries2 => maybeMap(
        orElse: () => <EntryModel>[],
        data: (_) => _.entries2 ?? <EntryModel>[],
      );
  List<EntryModel> get entries3 => maybeMap(
        orElse: () => <EntryModel>[],
        data: (_) => _.entries3 ?? <EntryModel>[],
      );
}

class HomeFetch {
  HomeFetch({required this.us, required this.token});

  final EntryUseCase us;
  final RootIsolateToken? token;
}
