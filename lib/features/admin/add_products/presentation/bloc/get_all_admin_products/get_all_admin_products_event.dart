part of 'get_all_admin_products_bloc.dart';

@freezed
class GetAllAdminProductsEvent with _$GetAllAdminProductsEvent {
  const factory GetAllAdminProductsEvent.started() = _Started;
  const factory GetAllAdminProductsEvent.fetchAdminAllProducts({
    required bool isNotLoading,
  }) = FetchAdminAllProductsEvent;
}
