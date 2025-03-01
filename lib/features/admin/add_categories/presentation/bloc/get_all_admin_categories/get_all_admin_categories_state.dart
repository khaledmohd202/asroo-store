part of 'get_all_admin_categories_bloc.dart';

@freezed
class GetAllAdminCategoriesState with _$GetAllAdminCategoriesState {
  // const factory GetAllAdminCategoriesState.initial() = _Initial;
  const factory GetAllAdminCategoriesState.loading() = LoadingState;

  const factory GetAllAdminCategoriesState.success({
    required GetAllCategoriesResponse categoryModel,
  }) = SuccessState;

  const factory GetAllAdminCategoriesState.empty() = EmptyState;

  const factory GetAllAdminCategoriesState.error({required String error}) =
      ErrorState;
}
