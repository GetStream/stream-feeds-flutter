// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestTagResponse _$InterestTagResponseFromJson(Map<String, dynamic> json) =>
    InterestTagResponse(
      count: (json['count'] as num).toInt(),
      tag: json['tag'] as String,
    );

Map<String, dynamic> _$InterestTagResponseToJson(
        InterestTagResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'tag': instance.tag,
    };
