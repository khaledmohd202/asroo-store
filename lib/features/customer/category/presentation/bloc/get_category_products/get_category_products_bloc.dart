import 'dart:async';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:asroo_store/features/customer/category/data/repos/category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_category_products_event.dart';
part 'get_category_products_state.dart';
part 'get_category_products_bloc.freezed.dart';

class GetCategoryProductsBloc
    extends Bloc<GetCategoryProductsEvent, GetCategoryProductsState> {
  GetCategoryProductsBloc(this._repo)
    : super(const GetCategoryProductsState.loading()) {
    on<FetchCategoryProductsEvent>(_getCategoryProducts);
  }

  final CategoryRepo _repo;

  FutureOr<void> _getCategoryProducts(
    FetchCategoryProductsEvent event,
    Emitter<GetCategoryProductsState> emit,
  ) async {
    emit(const GetCategoryProductsState.loading());

    final result = await _repo.getCategoryProducts(
      categoryId: event.categoryId,
    );

    result.when(
      success: (data) {
        if (data.getAllProductList.isEmpty) {
          emit(const GetCategoryProductsState.empty());
        } else {
          emit(
            GetCategoryProductsState.success(
              productsList: data.getAllProductList,
            ),
          );
        }
      },
      failure: (error) {
        emit(GetCategoryProductsState.error(message: error));
      },
    );
  }
}
