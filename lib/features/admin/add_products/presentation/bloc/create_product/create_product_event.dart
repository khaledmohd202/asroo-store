part of 'create_product_bloc.dart';

@freezed
class CreateProductEvent with _$CreateProductEvent {
  const factory CreateProductEvent.started() = _Started;
  const factory CreateProductEvent.createNewProduct({
    required CreateProductRequestBody body,
  }) = CreateNewProductEvent;
}
