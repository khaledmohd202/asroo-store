import 'dart:async';
import 'package:asroo_store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:asroo_store/features/customer/home/data/repos/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';
part 'get_all_categories_bloc.freezed.dart';

class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc(this._repo)
    : super(const GetAllCategoriesState.loading()) {
    on<FetchCategoriesEvent>(_getAllCategories);
  }

  final HomeRepo _repo;

  FutureOr<void> _getAllCategories(
    FetchCategoriesEvent event,
    Emitter<GetAllCategoriesState> emit,
  ) async {
    emit(const GetAllCategoriesState.loading());

    final result = await _repo.getAllCategories();

    result.when(
      success: (data) {
        if (data.getAllCategoriesList.isEmpty) {
          emit(const GetAllCategoriesState.empty());
        } else {
          emit(
            GetAllCategoriesState.success(
              categoriesList: data.getAllCategoriesList,
            ),
          );
        }
      },
      failure: (error) {
        emit(GetAllCategoriesState.error(error: error));
      },
    );
  }
}
