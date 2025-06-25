class CategoryQueries {
  factory CategoryQueries() {
    return _instance;
  }
  const CategoryQueries._();

  static const CategoryQueries _instance = CategoryQueries._();

  // Get categories.
  Map<String, dynamic> getCategoriesMapQuery({required int categoryId}) {
    return {
      'query': '''
      products(categoryId: $categoryId) {
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
      ''',
    };
  }
}
