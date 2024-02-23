import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'product_item_event.dart';
part 'product_item_state.dart';
part 'product_item_bloc.freezed.dart';

class ProductItemBloc extends Bloc<ProductItemEvent, ProductItemState> {
  ProductItemBloc(this._useCase) : super(const _Initial()) {
    on<ProductItemEvent>((event, emit) {
      return event.when<void>(
        started: (cate) {
          category = cate;
          add(const ProductItemEvent.loading());
          computeApp(_fetchProducts, ProductItemFetch(_useCase, cate: cate))
              .then(add);
        },
        loading: () => emit(const ProductItemState.loading()),
        error: (error) => emit(ProductItemState.error(error)),
        data: (lst) => emit(ProductItemState.data(lst)),
      );
    });
  }
  final ProductUseCase _useCase;

  late CategoryModel category;

  FutureOr<ProductItemEvent> _fetchProducts(ProductItemFetch m) async {
    final result = await m._us.fetch(m.cate.id ?? -1);
    return result.fold(ProductItemEvent.error, ProductItemEvent.data);
  }

  void reload() => add(ProductItemEvent.started(category));
}

class ProductItemFetch {
  const ProductItemFetch(this._us, {required this.cate});

  final ProductUseCase _us;
  final CategoryModel cate;
}
