// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ban_action_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanActionRequest _$BanActionRequestFromJson(Map<String, dynamic> json) =>
    BanActionRequest(
      channelBanOnly: json['channel_ban_only'] as bool?,
      deleteMessages: $enumDecodeNullable(
          _$BanActionRequestDeleteMessagesEnumMap, json['delete_messages'],
          unknownValue: BanActionRequestDeleteMessages.unknown),
      ipBan: json['ip_ban'] as bool?,
      reason: json['reason'] as String?,
      shadow: json['shadow'] as bool?,
      timeout: (json['timeout'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BanActionRequestToJson(BanActionRequest instance) =>
    <String, dynamic>{
      'channel_ban_only': instance.channelBanOnly,
      'delete_messages':
          _$BanActionRequestDeleteMessagesEnumMap[instance.deleteMessages],
      'ip_ban': instance.ipBan,
      'reason': instance.reason,
      'shadow': instance.shadow,
      'timeout': instance.timeout,
    };

const _$BanActionRequestDeleteMessagesEnumMap = {
  BanActionRequestDeleteMessages.hard: 'hard',
  BanActionRequestDeleteMessages.pruning: 'pruning',
  BanActionRequestDeleteMessages.soft: 'soft',
  BanActionRequestDeleteMessages.unknown: '_unknown',
};
