// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feedback_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityFeedbackEvent _$ActivityFeedbackEventFromJson(
        Map<String, dynamic> json) =>
    ActivityFeedbackEvent(
      activityFeedback: ActivityFeedbackEventPayload.fromJson(
          json['activity_feedback'] as Map<String, dynamic>),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>,
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : UserResponseCommonFields.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityFeedbackEventToJson(
        ActivityFeedbackEvent instance) =>
    <String, dynamic>{
      'activity_feedback': instance.activityFeedback.toJson(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'received_at': _$JsonConverterToJson<int, DateTime>(
          instance.receivedAt, const EpochDateTimeConverter().toJson),
      'type': instance.type,
      'user': instance.user?.toJson(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
