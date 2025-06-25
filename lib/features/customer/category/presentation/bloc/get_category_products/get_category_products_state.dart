part of 'get_category_products_bloc.dart';

@freezed
class GetCategoryProductsState with _$GetCategoryProductsState {
  const factory GetCategoryProductsState.loading() = LoadingState;
  const factory GetCategoryProductsState.success({
    required List<GetAllProductModel> productsList,
  }) = SuccessState;
  const factory GetCategoryProductsState.empty() = EmptyState;
  const factory GetCategoryProductsState.error({required String message}) =
      ErrorState;
}
