class ProductDetailsQueries {
  factory ProductDetailsQueries() {
    return _instance;
  }
  const ProductDetailsQueries._();

  static const ProductDetailsQueries _instance = ProductDetailsQueries._();

  // Get product details.
  Map<String, dynamic> getProductDetailsMapQuery({required int productId}) {
    return {
      'query': '''
          {
          product(id: $productId) {
            title
            price
            images
            description
          }
        }
          ''',
      'variables': {'productId': productId},
    };
  }
}
