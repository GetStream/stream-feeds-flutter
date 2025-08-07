// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderResponseData _$ReminderResponseDataFromJson(
        Map<String, dynamic> json) =>
    ReminderResponseData(
      channel: json['channel'] == null
          ? null
          : ChannelResponse.fromJson(json['channel'] as Map<String, dynamic>),
      channelCid: json['channel_cid'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      messageId: json['message_id'] as String,
      remindAt: _$JsonConverterFromJson<int, DateTime>(
          json['remind_at'], const EpochDateTimeConverter().fromJson),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$ReminderResponseDataToJson(
        ReminderResponseData instance) =>
    <String, dynamic>{
      'channel': instance.channel?.toJson(),
      'channel_cid': instance.channelCid,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'message': instance.message?.toJson(),
      'message_id': instance.messageId,
      'remind_at': _$JsonConverterToJson<int, DateTime>(
          instance.remindAt, const EpochDateTimeConverter().toJson),
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user?.toJson(),
      'user_id': instance.userId,
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
