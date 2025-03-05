import 'package:json_annotation/json_annotation.dart';
part 'get_all_users_response.g.dart';

@JsonSerializable()
class GetAllUsersResponse {
  GetAllUsersResponse(this.data);

  factory GetAllUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersResponseFromJson(json);

  final GetAllUsersData data;
}

@JsonSerializable()
class GetAllUsersData {
  GetAllUsersData(this.usersList);

  factory GetAllUsersData.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersDataFromJson(json);

  @JsonKey(name: 'users')
  final List<GetAllUsersModel> usersList;
}

@JsonSerializable()
class GetAllUsersModel {
  GetAllUsersModel(this.id, this.name, this.email);

  factory GetAllUsersModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersModelFromJson(json);

  final String? id;
  final String? name;
  final String? email;
}
