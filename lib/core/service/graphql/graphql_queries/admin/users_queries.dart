class UsersQueries {
  factory UsersQueries() {
    return _instance;
  }

  const UsersQueries._();

  static const UsersQueries _instance = UsersQueries._();

  // Get All Users.
  Map<String, dynamic> getAllUsersMapQuery() {
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

  // Delete Users.
  Map<String, dynamic> deleteUsersMapQuery({required String userId}) {
    return {
      'query': r'''
          mutation DeleteUser($userId: ID!){
              deleteUser(id: $userId)
            }
      ''',
      'variables': {'userId': userId},
    };
  }
}
