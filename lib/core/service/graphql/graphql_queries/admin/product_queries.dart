import 'package:asroo_store/features/admin/add_products/data/models/create_product_request_body.dart';

class ProductQueries {
  factory ProductQueries() {
    return _instance;
  }
  const ProductQueries._();

  static const ProductQueries _instance = ProductQueries._();

  // Get All Products.
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

  // Create a Product.
  Map<String, dynamic> createProductMapQuery({
    required CreateProductRequestBody body,
  }) {
    return {
      'query': r'''
          mutation CreateProduct($title: String!, $price: Float!, $description: String!, $categoryId: Float!, $imageList: [String!]!){
            addProduct(
              data: {
                title: $title
                price: $price
                description: $description
                categoryId: $categoryId
                images: $imageList
              }
            ) {
              title
            }
          }
      ''',
      'variables': {
        'title': body.title,
        'price': body.price,
        'description': body.description,
        'categoryId': body.categoryId,
        'imageList': body.imageList,
      },
    };
  }
}
