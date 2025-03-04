import 'dart:async';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:asroo_store/features/admin/add_products/data/repos/product_admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_admin_products_event.dart';
part 'get_all_admin_products_state.dart';
part 'get_all_admin_products_bloc.freezed.dart';

class GetAllAdminProductsBloc
    extends Bloc<GetAllAdminProductsEvent, GetAllAdminProductsState> {
  GetAllAdminProductsBloc(this._repo)
    : super(const GetAllAdminProductsState.loading()) {
    on<FetchAdminAllProductsEvent>(_getAllProducts);
  }

  final ProductAdminRepo _repo;

  FutureOr<void> _getAllProducts(
    FetchAdminAllProductsEvent event,
    Emitter<GetAllAdminProductsState> emit,
  ) async {
    if (event.isNotLoading) {
      emit(const GetAllAdminProductsState.loading());
    }

    final result = await _repo.getAllProductsAdmin();

    result.when(
      success: (data) {
        if (data.getAllProductList.isEmpty) {
          emit(const GetAllAdminProductsState.empty());
        } else {
          emit(
            GetAllAdminProductsState.success(
              productList: data.getAllProductList,
            ),
          );
        }
      },
      failure: (error) {
        emit(GetAllAdminProductsState.error(error: error));
      },
    );
  }
}
