// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnBatchResponse _$OwnBatchResponseFromJson(Map<String, dynamic> json) => OwnBatchResponse(
  data:
      (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, FeedOwnData.fromJson(e as Map<String, dynamic>)),
      ) ??
      {},
  duration: json['duration'] as String,
);

Map<String, dynamic> _$OwnBatchResponseToJson(OwnBatchResponse instance) => <String, dynamic>{
  'data': instance.data.map((k, e) => MapEntry(k, e.toJson())),
  'duration': instance.duration,
};
