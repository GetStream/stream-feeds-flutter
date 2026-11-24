// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_reactions_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendReactionsOptions _$FriendReactionsOptionsFromJson(
  Map<String, dynamic> json,
) => FriendReactionsOptions(
  enabled: json['enabled'] as bool?,
  limit: (json['limit'] as num?)?.toInt(),
  type: json['type'] as FriendReactionType?,
);

Map<String, dynamic> _$FriendReactionsOptionsToJson(
  FriendReactionsOptions instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'limit': instance.limit,
  'type': instance.type,
};
