// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallType _$CallTypeFromJson(Map<String, dynamic> json) => CallType(
      appPK: (json['app_p_k'] as num).toInt(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      externalStorage: json['external_storage'] as String,
      name: json['name'] as String,
      notificationSettings: json['notification_settings'] == null
          ? null
          : NotificationSettings.fromJson(
              json['notification_settings'] as Map<String, dynamic>),
      pK: (json['p_k'] as num).toInt(),
      settings: json['settings'] == null
          ? null
          : CallSettings.fromJson(json['settings'] as Map<String, dynamic>),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$CallTypeToJson(CallType instance) => <String, dynamic>{
      'app_p_k': instance.appPK,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'external_storage': instance.externalStorage,
      'name': instance.name,
      'notification_settings': instance.notificationSettings?.toJson(),
      'p_k': instance.pK,
      'settings': instance.settings?.toJson(),
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
    };
