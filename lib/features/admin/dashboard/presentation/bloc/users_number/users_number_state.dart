part of 'users_number_bloc.dart';

@freezed
class UsersNumberState with _$UsersNumberState {
  const factory UsersNumberState.loading() = LoadingState;
  const factory UsersNumberState.success({required String numbers}) =
      SuccessState;
  const factory UsersNumberState.error({required String error}) = ErrorState;
}
