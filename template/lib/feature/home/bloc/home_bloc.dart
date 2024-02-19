import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';

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

          final dir = await getApplicationDocumentsDirectory();

          final homeFetch = HomeFetch(dir, _useCase);

          unawaited(compute(_fetchRes, homeFetch).then(add));
          unawaited(compute(_fetchRes1, homeFetch).then(add));
          unawaited(compute(_fetchRes2, homeFetch).then(add));
          unawaited(compute(_fetchRes3, homeFetch).then(add));

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

class HomeFetch {
  HomeFetch(this.dir, this.us);

  final Directory dir;
  final EntryUseCase us;
}

FutureOr<HomeEvent> _fetchRes(HomeFetch m) async {
  final result = await m.us.fetch(dir: m.dir);
  final data = result.fold((l) => l, (r) => r);
  if (data is ErrorState) {
    return HomeEvent.error(data);
  }
  data as List<EntryModel>;
  if (data.isEmpty) return const HomeEvent.data();
  return HomeEvent.data(entries: data);
}

FutureOr<HomeEvent> _fetchRes1(HomeFetch m) async {
  final result = await m.us.fetch(dir: m.dir);
  final data = result.fold((l) => l, (r) => r);
  if (data is ErrorState) {
    return HomeEvent.error(data);
  }
  data as List<EntryModel>;
  if (data.isEmpty) return const HomeEvent.data();
  return HomeEvent.data(entries1: data);
}

FutureOr<HomeEvent> _fetchRes2(HomeFetch m) async {
  final result = await m.us.fetch(dir: m.dir);
  final data = result.fold((l) => l, (r) => r);
  if (data is ErrorState) {
    return HomeEvent.error(data);
  }
  data as List<EntryModel>;
  if (data.isEmpty) return const HomeEvent.data();
  return HomeEvent.data(entries2: data);
}

FutureOr<HomeEvent> _fetchRes3(HomeFetch m) async {
  final result = await m.us.fetch(dir: m.dir);
  final data = result.fold((l) => l, (r) => r);

  if (data is ErrorState) {
    return HomeEvent.error(data);
  }
  data as List<EntryModel>;
  if (data.isEmpty) return const HomeEvent.data();
  return HomeEvent.data(entries3: data);
}
