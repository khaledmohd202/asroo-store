import 'package:asroo_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:asroo_store/features/admin/add_products/data/models/update_product_request_body.dart';

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

  // Delete Product.
  Map<String, dynamic> deleteProductMapQuery({required String productId}) {
    return {
      'query': r'''
          mutation DeleteProduct($productId: ID!){
              deleteProduct(id: $productId)
            }
      ''',
      'variables': {'productId': productId},
    };
  }

  // Update Product.
  Map<String, dynamic> updateProductMapQuery({
    required UpdateProductRequestBody body,
  }) {
    return {
      'query': r'''
          mutation UpdateProduct($productId: ID!, $title: String!, $description: String!, $imageList: [String!]!, $price: Float!, $categoryId: Float!){
            updateProduct(
                  id: $productId,
                  changes: {
                  title: $title,
                  categoryId: $categoryId,
                  images: $imageList,
                  description: $description,
                  price: $price
                })
             {
              title
            }
          }
      ''',
      'variables': {
        'productId': body.productId,
        'title': body.title,
        'description': body.description,
        'imageList': body.imageList,
        'price': body.price,
        'categoryId': body.categoryId,
      },
    };
  }
}
