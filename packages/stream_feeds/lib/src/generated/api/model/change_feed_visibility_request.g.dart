// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_feed_visibility_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeFeedVisibilityRequest _$ChangeFeedVisibilityRequestFromJson(
  Map<String, dynamic> json,
) => ChangeFeedVisibilityRequest(
  pendingFollowsAction: json['pending_follows_action'] as ChangeFeedVisibilityRequestPendingFollowsAction?,
  visibility: json['visibility'] as FeedVisibility,
);

Map<String, dynamic> _$ChangeFeedVisibilityRequestToJson(
  ChangeFeedVisibilityRequest instance,
) => <String, dynamic>{
  'pending_follows_action': instance.pendingFollowsAction,
  'visibility': instance.visibility,
};
