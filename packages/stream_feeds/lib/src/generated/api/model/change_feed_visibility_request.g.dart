// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_feed_visibility_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeFeedVisibilityRequest _$ChangeFeedVisibilityRequestFromJson(
  Map<String, dynamic> json,
) => ChangeFeedVisibilityRequest(
  pendingFollowsAction: json['pending_follows_action'] == null
      ? null
      : ChangeFeedVisibilityRequestPendingFollowsAction.fromJson(
          json['pending_follows_action'] as String,
        ),
  visibility: ChangeFeedVisibilityRequestVisibility.fromJson(
    json['visibility'] as String,
  ),
);

Map<String, dynamic> _$ChangeFeedVisibilityRequestToJson(
  ChangeFeedVisibilityRequest instance,
) => <String, dynamic>{
  'pending_follows_action': instance.pendingFollowsAction?.toJson(),
  'visibility': instance.visibility.toJson(),
};
