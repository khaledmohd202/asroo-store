import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  final String name;
  final String email;
  final String password;
  final String avatar;

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
