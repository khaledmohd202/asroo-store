import 'dart:async';
import 'package:asroo_store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:asroo_store/features/admin/add_categories/data/repos/categories_admin_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_admin_categories_event.dart';
part 'get_all_admin_categories_state.dart';
part 'get_all_admin_categories_bloc.freezed.dart';

class GetAllAdminCategoriesBloc
    extends Bloc<GetAllAdminCategoriesEvent, GetAllAdminCategoriesState> {
  GetAllAdminCategoriesBloc(this._repo)
    : super(const GetAllAdminCategoriesState.loading()) {
    on<FetchAdminAllCategoriesEvent>(_fetchAdminAllCategories);
  }

  final CategoriesAdminRepos _repo;

  FutureOr<void> _fetchAdminAllCategories(
    FetchAdminAllCategoriesEvent event,
    Emitter<GetAllAdminCategoriesState> emit,
  ) async {
    if (event.isNotLoading) {
    emit(const GetAllAdminCategoriesState.loading());
    }
    final result = await _repo.getAllCategoriesAdmin();

    result.when(
      success: (data) {
        if (data.getAllCategoriesList.isEmpty) {
          emit(const GetAllAdminCategoriesState.empty());
        } else {
          emit(GetAllAdminCategoriesState.success(categoryModel: data));
        }
      },
      failure: (error) {
        emit(GetAllAdminCategoriesState.error(error: error));
      },
    );
  }
}
