// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FxNotification _$FxNotificationFromJson(Map<String, dynamic> json) =>
    _FxNotification(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      read: json['read'] as bool? ?? false,
      createdAt: json['createdAt'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FxNotificationToJson(_FxNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'read': instance.read,
      'createdAt': instance.createdAt,
      'data': instance.data,
    };
