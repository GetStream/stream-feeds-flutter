// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestTagResponse _$InterestTagResponseFromJson(Map<String, dynamic> json) => InterestTagResponse(
  count: (json['count'] as num).toInt(),
  source: json['source'] as String,
  tag: json['tag'] as String,
  weight: (json['weight'] as num).toDouble(),
);

Map<String, dynamic> _$InterestTagResponseToJson(
  InterestTagResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'source': instance.source,
  'tag': instance.tag,
  'weight': instance.weight,
};
