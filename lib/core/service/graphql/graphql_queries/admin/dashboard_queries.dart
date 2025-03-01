class DashboardQueries {
  factory DashboardQueries() {
    return _instance;
  }
  const DashboardQueries._();
  static const _instance = DashboardQueries._();

  // Products
  Map<String, dynamic> numberOfProductsMapQuery() {
    return {
      'query': '''
        {
          products{
            title
          }
        }
      ''',
    };
  }
  // Categories
  Map<String, dynamic> numberOfCategoriesMapQuery() {
    return {
      'query': '''
        {
          categories{
            name
          }
        }
      ''',
    };
  }
  // Users
  Map<String, dynamic> numberOfUsersMapQuery() {
    return {
      'query': '''
        {
          users{
            name
          }
        }
      ''',
    };
  }
}
