// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteFeedResponse _$DeleteFeedResponseFromJson(Map<String, dynamic> json) =>
    DeleteFeedResponse(
      duration: json['duration'] as String,
      taskId: json['task_id'] as String,
    );

Map<String, dynamic> _$DeleteFeedResponseToJson(DeleteFeedResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'task_id': instance.taskId,
    };
