// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedInput _$FeedInputFromJson(Map<String, dynamic> json) => FeedInput(
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      description: json['description'] as String?,
      filterTags: (json['filter_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => FeedMemberRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      visibility: $enumDecodeNullable(
          _$FeedInputVisibilityEnumMap, json['visibility'],
          unknownValue: FeedInputVisibility.unknown),
    );

Map<String, dynamic> _$FeedInputToJson(FeedInput instance) => <String, dynamic>{
      'custom': instance.custom,
      'description': instance.description,
      'filter_tags': instance.filterTags,
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'visibility': _$FeedInputVisibilityEnumMap[instance.visibility],
    };

const _$FeedInputVisibilityEnumMap = {
  FeedInputVisibility.followers: 'followers',
  FeedInputVisibility.members: 'members',
  FeedInputVisibility.private: 'private',
  FeedInputVisibility.public: 'public',
  FeedInputVisibility.visible: 'visible',
  FeedInputVisibility.unknown: '_unknown',
};
