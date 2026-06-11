// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_feed_visibility_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeFeedVisibilityRequest _$ChangeFeedVisibilityRequestFromJson(
        Map<String, dynamic> json) =>
    ChangeFeedVisibilityRequest(
      pendingFollowsAction: $enumDecodeNullable(
          _$ChangeFeedVisibilityRequestPendingFollowsActionEnumMap,
          json['pending_follows_action'],
          unknownValue:
              ChangeFeedVisibilityRequestPendingFollowsAction.unknown),
      visibility: $enumDecode(
          _$ChangeFeedVisibilityRequestVisibilityEnumMap, json['visibility'],
          unknownValue: ChangeFeedVisibilityRequestVisibility.unknown),
    );

Map<String, dynamic> _$ChangeFeedVisibilityRequestToJson(
        ChangeFeedVisibilityRequest instance) =>
    <String, dynamic>{
      'pending_follows_action':
          _$ChangeFeedVisibilityRequestPendingFollowsActionEnumMap[
              instance.pendingFollowsAction],
      'visibility':
          _$ChangeFeedVisibilityRequestVisibilityEnumMap[instance.visibility]!,
    };

const _$ChangeFeedVisibilityRequestPendingFollowsActionEnumMap = {
  ChangeFeedVisibilityRequestPendingFollowsAction.autoApprove: 'auto_approve',
  ChangeFeedVisibilityRequestPendingFollowsAction.reject: 'reject',
  ChangeFeedVisibilityRequestPendingFollowsAction.unknown: '_unknown',
};

const _$ChangeFeedVisibilityRequestVisibilityEnumMap = {
  ChangeFeedVisibilityRequestVisibility.followers: 'followers',
  ChangeFeedVisibilityRequestVisibility.members: 'members',
  ChangeFeedVisibilityRequestVisibility.private: 'private',
  ChangeFeedVisibilityRequestVisibility.public: 'public',
  ChangeFeedVisibilityRequestVisibility.visible: 'visible',
  ChangeFeedVisibilityRequestVisibility.unknown: '_unknown',
};
