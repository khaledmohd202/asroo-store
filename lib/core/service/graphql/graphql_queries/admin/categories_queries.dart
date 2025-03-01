class CategoriesQueries {
  factory CategoriesQueries() {
    return _instance;
  }

  const CategoriesQueries._();

  static const CategoriesQueries _instance = CategoriesQueries._();

  // Get All Categories.
  Map<String, dynamic> getAllCategoriesMapQuery() {
    return {
      'query': '''
      {
        categories{
          id
          name
          image
        }
    }
  ''',
    };
  }
}
