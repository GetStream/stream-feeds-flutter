// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_feed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFeedRequest _$UpdateFeedRequestFromJson(Map<String, dynamic> json) =>
    UpdateFeedRequest(
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
    );

Map<String, dynamic> _$UpdateFeedRequestToJson(UpdateFeedRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
    };
