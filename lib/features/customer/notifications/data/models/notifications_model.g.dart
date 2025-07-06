// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) =>
    NotificationsModel(
      notificationId: json['notification_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: json['created_at'] as String,
      isRead: json['is_read'] as bool,
      productId: (json['product_id'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationsModelToJson(NotificationsModel instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'title': instance.title,
      'body': instance.body,
      'created_at': instance.createdAt,
      'is_read': instance.isRead,
      'product_id': instance.productId,
    };
