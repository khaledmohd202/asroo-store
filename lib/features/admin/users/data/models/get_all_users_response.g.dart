// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersResponse _$GetAllUsersResponseFromJson(Map<String, dynamic> json) =>
    GetAllUsersResponse(
      GetAllUsersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllUsersResponseToJson(
        GetAllUsersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllUsersData _$GetAllUsersDataFromJson(Map<String, dynamic> json) =>
    GetAllUsersData(
      (json['users'] as List<dynamic>)
          .map((e) => GetAllUsersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUsersDataToJson(GetAllUsersData instance) =>
    <String, dynamic>{
      'users': instance.usersList,
    };

GetAllUsersModel _$GetAllUsersModelFromJson(Map<String, dynamic> json) =>
    GetAllUsersModel(
      json['id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$GetAllUsersModelToJson(GetAllUsersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
