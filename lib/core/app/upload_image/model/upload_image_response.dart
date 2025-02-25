import 'package:json_annotation/json_annotation.dart';
part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  UploadImageResponse(this.location);
  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);

  final String? location;
}
