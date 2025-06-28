import 'dart:async';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:asroo_store/features/customer/search/data/model/search_request_body.dart';
import 'package:asroo_store/features/customer/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._repo) : super(const SearchState.initial()) {
    on<SearchForProductEvent>(_searchForProduct);
  }

  final SearchRepo _repo;

  FutureOr<void> _searchForProduct(
    SearchForProductEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchState.loading());

    final result = await _repo.searchProduct(body: event.body);

    result.when(
      success: (data) {
        if (data.getAllProductList.isEmpty) {
          emit(const SearchState.empty());
        } else {
          emit(SearchState.success(productsList: data.getAllProductList));
        }
      },
      failure: (error) {
        emit(SearchState.error(error: error));
      },
    );
  }
}
