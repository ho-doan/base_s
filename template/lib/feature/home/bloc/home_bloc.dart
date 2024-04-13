import 'dart:async';
import 'dart:developer' as dev;

import 'package:common/utils/extensions/list_ext.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../../../core/services/dependency_injection/service_locator.dart';
import '../../product/widget/product_item/bloc/product_item_bloc.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._categoryUseCase) : super(const $Initial()) {
    on<HomeEvent>((event, emit) {
      return event.when<void>(
        started: () async {
          dev.Timeline.startSync('test performance home');

          add(const HomeEvent.loading());

          products = [];

          final homeFetch = HomeFetch(
            us: _categoryUseCase,
            token: kTest ? null : RootIsolateToken.instance!,
          );

          final result = await computeApp(_fetchCategory, homeFetch);
          add(result);

          dev.Timeline.finishSync();
        },
        loading: () => emit(const HomeState.loading()),
        error: (e) => emit(HomeState.error(e)),
        data: (cate) {
          // final s = state;
          // if (s is $Loading) {
          //   emit($Data(categories: cate));
          //   return;
          // }
          // if (s is! $Data) return;

          if (cate != null && !cate.data.isNullOrEmpty) {
            products = [
              for (final _ in cate.data.lst) getIt<ProductItemBloc>(),
            ];
          }

          // emit(
          //   s.copyWith.call(
          //     categories: cate ?? s.categories,
          //   ),
          // );

          emit(
            $Data(
              categories: cate ??
                  Categories.error(
                    ErrorState(error: 'cate null'),
                  ),
            ),
          );
        },
      );
    });
  }

  final CategoryUseCase _categoryUseCase;

  late List<ProductItemBloc> products;
}

FutureOr<HomeEvent> _fetchCategory(HomeFetch h) async {
  final result = await h.us.fetch(token: h.token);
  final data = result.fold((l) => l, (r) => r);

  if (data is ErrorState) {
    return HomeEvent.data(categories: Categories.error(data));
  }
  data as List<CategoryModel>;
  return HomeEvent.data(categories: Categories.data(data));
}

extension HomeStateX on HomeState {
  bool get isData => maybeMap(orElse: () => false, data: (_) => true);
  $Data? get data => maybeMap(orElse: () => null, data: (_) => _);
  bool get isError => maybeMap(orElse: () => false, error: (_) => true);
  List<CategoryModel> get categories => maybeMap(
        orElse: () => <CategoryModel>[],
        data: (_) => _.categories.data ?? <CategoryModel>[],
      );
}

class HomeFetch {
  HomeFetch({required this.us, required this.token});

  final CategoryUseCase us;
  final RootIsolateToken? token;
}

extension CategoriesX on Categories {
  List<CategoryModel>? get data => maybeMap(
        orElse: () => null,
        data: (p) => p.categories,
      );
}

typedef _Builder = (HomeState, HomeState);

extension BuilderHome on _Builder {
  bool get build =>
      this.$2.isData && this.$1.data?.categories != this.$2.data?.categories;
}
