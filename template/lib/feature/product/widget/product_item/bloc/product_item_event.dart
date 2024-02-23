part of 'product_item_bloc.dart';

@freezed
class ProductItemEvent with _$ProductItemEvent {
  const factory ProductItemEvent.started(CategoryModel category) = _Started;
  const factory ProductItemEvent.loading() = _Loading;
  const factory ProductItemEvent.error(ErrorState error) = _Error;
  const factory ProductItemEvent.data(List<ProductModel> lst) = _Data;
}
