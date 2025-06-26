class ProductsViewAllQueries {

  factory ProductsViewAllQueries() {
    return _instance;
  }
  const ProductsViewAllQueries._();

  static const ProductsViewAllQueries _instance = ProductsViewAllQueries._();

  // Get products of View All Button.
  Map<String, dynamic> getProductsViewAllMapQuery({required int offset}) {
    return {
      'query': '''
          {
          products(limit: 2, offset: $offset) {
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
