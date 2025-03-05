import 'dart:async';
import 'package:asroo_store/features/admin/users/data/models/get_all_users_response.dart';
import 'package:asroo_store/features/admin/users/data/repos/users_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';
part 'get_all_users_bloc.freezed.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc(this._repo) : super(const GetAllUsersState.loading()) {
    on<GetAdminAllUsersEvent>(_getAllUsers);
    on<SearchFroUserEvent>(_searchForUser);
  }

  final UsersRepo _repo;
  List<GetAllUsersModel> usersList = [];
  final TextEditingController searchController = TextEditingController();

  // Get All Users.
  FutureOr<void> _getAllUsers(
    GetAdminAllUsersEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    if (event.isNotLoading) {
      emit(const GetAllUsersState.loading());
    }

    final result = await _repo.getAllUsers();

    result.when(
      success: (users) {
        usersList = users.data.usersList;
        emit(GetAllUsersState.success(usersList: usersList));
      },
      failure: (error) {
        emit(GetAllUsersState.error(error: error));
      },
    );
  }

  // Search For User.
  FutureOr<void> _searchForUser(
    SearchFroUserEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    final searchResult =
        usersList
            .where(
              (e) =>
                  e.name!.toLowerCase().startsWith(
                    event.searchName!.toLowerCase().trim(),
                  ) ||
                  e.email!.toLowerCase().startsWith(
                    event.searchName!.toLowerCase().trim(),
                  ),
            )
            .toList();

    if (searchResult.isEmpty) {
      emit(const GetAllUsersState.empty());
    } else {
      emit(GetAllUsersState.success(usersList: searchResult));
    }
  }
}
