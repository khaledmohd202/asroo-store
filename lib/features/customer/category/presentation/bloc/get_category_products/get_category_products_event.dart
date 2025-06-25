part of 'get_category_products_bloc.dart';

@freezed
class GetCategoryProductsEvent with _$GetCategoryProductsEvent {
  const factory GetCategoryProductsEvent.started() = _Started;
  const factory GetCategoryProductsEvent.getCategoryProducts({
    required int categoryId,
  }) = FetchCategoryProductsEvent;
}
