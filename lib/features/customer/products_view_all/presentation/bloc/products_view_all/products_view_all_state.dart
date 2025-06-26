import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:equatable/equatable.dart';

abstract class ProductsViewAllState extends Equatable {
  const ProductsViewAllState({
    required this.productsList,
    required this.hasMoreData,
  });

  final List<GetAllProductModel> productsList;
  final bool hasMoreData;

  @override
  List<Object?> get props => [productsList, hasMoreData];
}

class ProductsViewAllInitialState extends ProductsViewAllState {
  const ProductsViewAllInitialState({
    required super.productsList,
    required super.hasMoreData,
  });
}

class ProductsViewAllLoadingState extends ProductsViewAllState {
  const ProductsViewAllLoadingState({
    required super.productsList,
    required super.hasMoreData,
  });
}

class ProductsViewAllSuccessState extends ProductsViewAllState {
  const ProductsViewAllSuccessState({
    required super.productsList,
    required super.hasMoreData,
  });
}

class ProductsViewAllErrorState extends ProductsViewAllState {
  const ProductsViewAllErrorState({
    required super.productsList,
    required super.hasMoreData,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object?> get props => [...super.props, errorMessage];
}
