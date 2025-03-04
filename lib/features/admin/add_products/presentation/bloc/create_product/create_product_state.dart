part of 'create_product_bloc.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = _Initial;
  const factory CreateProductState.loading() = LoadingState;
  const factory CreateProductState.success() = SuccessState;
  const factory CreateProductState.error({required String error}) = ErrorState;
}
