class UsersQueries {
  factory UsersQueries() {
    return _instance;
  }

  const UsersQueries._();

  static const UsersQueries _instance = UsersQueries._();

  // Get All Users.
  Map<String, dynamic> getAllUsers() {
    return {
      'query': '''
          {
            users{
              id
              name
              email
            }
          }
          ''',
    };
  }
}
