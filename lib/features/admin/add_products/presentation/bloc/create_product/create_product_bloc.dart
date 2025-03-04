import 'dart:async';
import 'package:asroo_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:asroo_store/features/admin/add_products/data/repos/product_admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';
part 'create_product_bloc.freezed.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductBloc(this._repo) : super(const _Initial()) {
    on<CreateNewProductEvent>(_createProduct);
  }

  final ProductAdminRepo _repo;

  // Create a new Product.
  FutureOr<void> _createProduct(
    CreateNewProductEvent event,
    Emitter<CreateProductState> emit,
  ) async {
    emit(const CreateProductState.loading());

    final result = await _repo.createProductAdmin(body: event.body);

    result.when(
      success: (_) {
        emit(const CreateProductState.success());
      },
      failure: (error) {
        emit(CreateProductState.error(error: error));
      },
    );
  }
}
