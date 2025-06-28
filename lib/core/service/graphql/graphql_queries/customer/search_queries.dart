import 'package:asroo_store/features/customer/search/data/model/search_request_body.dart';

class SearchQueries {
  factory SearchQueries() {
    return _instance;
  }
  const SearchQueries._();

  static const SearchQueries _instance = SearchQueries._();

  // Get products by price range and title.
  Map<String, dynamic> searchProduct({
    required SearchRequestBody body,
  }) {
    return {
      'query': r'''
        query SearchProducts($searchName: String , $priceMax: Int , $priceMin: Int){
             products(title: $searchName, price_max: $priceMax, price_min:$priceMin){
            id
            title
            images
            description
            price
            category{
                name
                id
            }
          }
        }
        ''',
      'variables': {
        'searchName': body.searchName,
        'priceMax': body.priceMax,
        'priceMin': body.priceMin,
      },
    };
  }
}
