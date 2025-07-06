import 'package:freezed_annotation/freezed_annotation.dart';
part 'notifications_model.g.dart';

@JsonSerializable()
class NotificationsModel {
  NotificationsModel({
    required this.notificationId,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isRead,
    required this.productId,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsModelToJson(this);

  @JsonKey(name: 'notification_id')
  final String notificationId;
  final String title;
  final String body;

  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'is_read')
  final bool isRead;
  @JsonKey(name: 'product_id')
  final int productId;
}
