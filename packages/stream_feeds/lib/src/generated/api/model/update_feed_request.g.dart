// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_feed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFeedRequest _$UpdateFeedRequestFromJson(Map<String, dynamic> json) =>
    UpdateFeedRequest(
      createdById: json['created_by_id'] as String?,
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
    );

Map<String, dynamic> _$UpdateFeedRequestToJson(UpdateFeedRequest instance) =>
    <String, dynamic>{
      'created_by_id': instance.createdById,
      'custom': instance.custom,
    };
