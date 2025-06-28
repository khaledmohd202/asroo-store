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
      'query': '''
        {
        products(price_min: 100, price_max: 200, title: null) {
          id
          title
          price
          images
          description
          category {
            id
            name
          }
        }
        }
      ''',
      'variables': {
        'priceMin': body.priceMin,
        'priceMax': body.priceMax,
        'title': body.searchName,
      },
    };
  }
}

/**{
	products(price_min: 100, price_max: 200, title: null) {
		title
		price
	}
} */
