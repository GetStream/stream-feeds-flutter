// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_action_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitActionResponse _$SubmitActionResponseFromJson(
        Map<String, dynamic> json) =>
    SubmitActionResponse(
      duration: json['duration'] as String,
      item: json['item'] == null
          ? null
          : ReviewQueueItemResponse.fromJson(
              json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitActionResponseToJson(
        SubmitActionResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'item': instance.item?.toJson(),
    };
