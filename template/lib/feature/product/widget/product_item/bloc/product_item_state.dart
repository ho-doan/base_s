part of 'product_item_bloc.dart';

@freezed
class ProductItemState with _$ProductItemState {
  const factory ProductItemState.initial() = _Initial;
  const factory ProductItemState.loading() = _$Loading;
  const factory ProductItemState.error(ErrorState error) = _$Error;
  const factory ProductItemState.data(List<ProductModel> products) = _$Data;
}
