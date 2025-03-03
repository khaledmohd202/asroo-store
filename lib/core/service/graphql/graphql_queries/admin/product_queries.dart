class ProductQueries {
  factory ProductQueries() {
    return _instance;
  }
  const ProductQueries._();

  static const ProductQueries _instance = ProductQueries._();


  // Get All Products
  Map<String, dynamic> getAllProductsMapQuery() {
    return {
      'query': '''
            {
            products{
              id
              title
              price
              images
              description
              category{
                id
                name
                }
            }
          }
      ''',
    };
  }
}
