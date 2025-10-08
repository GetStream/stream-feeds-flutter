// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityResponse _$ActivityResponseFromJson(Map<String, dynamic> json) =>
    ActivityResponse(
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookmarkCount: (json['bookmark_count'] as num).toInt(),
      commentCount: (json['comment_count'] as num).toInt(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      currentFeed: json['current_feed'] == null
          ? null
          : FeedResponse.fromJson(json['current_feed'] as Map<String, dynamic>),
      custom: json['custom'] as Map<String, dynamic>,
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      editedAt: _$JsonConverterFromJson<int, DateTime>(
          json['edited_at'], const EpochDateTimeConverter().fromJson),
      expiresAt: _$JsonConverterFromJson<int, DateTime>(
          json['expires_at'], const EpochDateTimeConverter().fromJson),
      feeds: (json['feeds'] as List<dynamic>).map((e) => e as String).toList(),
      filterTags: (json['filter_tags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hidden: json['hidden'] as bool?,
      id: json['id'] as String,
      interestTags: (json['interest_tags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isWatched: json['is_watched'] as bool?,
      latestReactions: (json['latest_reactions'] as List<dynamic>)
          .map((e) => FeedsReactionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] == null
          ? null
          : ActivityLocation.fromJson(json['location'] as Map<String, dynamic>),
      mentionedUsers: (json['mentioned_users'] as List<dynamic>)
          .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      moderation: json['moderation'] == null
          ? null
          : ModerationV2Response.fromJson(
              json['moderation'] as Map<String, dynamic>),
      notificationContext: json['notification_context'] == null
          ? null
          : NotificationContext.fromJson(
              json['notification_context'] as Map<String, dynamic>),
      ownBookmarks: (json['own_bookmarks'] as List<dynamic>)
          .map((e) => BookmarkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownReactions: (json['own_reactions'] as List<dynamic>)
          .map((e) => FeedsReactionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      parent: json['parent'] == null
          ? null
          : ActivityResponse.fromJson(json['parent'] as Map<String, dynamic>),
      poll: json['poll'] == null
          ? null
          : PollResponseData.fromJson(json['poll'] as Map<String, dynamic>),
      popularity: (json['popularity'] as num).toInt(),
      reactionCount: (json['reaction_count'] as num).toInt(),
      reactionGroups: (json['reaction_groups'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, ReactionGroupResponse.fromJson(e as Map<String, dynamic>)),
      ),
      score: (json['score'] as num).toDouble(),
      searchData: json['search_data'] as Map<String, dynamic>,
      shareCount: (json['share_count'] as num).toInt(),
      text: json['text'] as String?,
      type: json['type'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      visibility: $enumDecode(
          _$ActivityResponseVisibilityEnumMap, json['visibility'],
          unknownValue: ActivityResponseVisibility.unknown),
      visibilityTag: json['visibility_tag'] as String?,
    );

Map<String, dynamic> _$ActivityResponseToJson(ActivityResponse instance) =>
    <String, dynamic>{
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
      'bookmark_count': instance.bookmarkCount,
      'comment_count': instance.commentCount,
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'current_feed': instance.currentFeed?.toJson(),
      'custom': instance.custom,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'edited_at': _$JsonConverterToJson<int, DateTime>(
          instance.editedAt, const EpochDateTimeConverter().toJson),
      'expires_at': _$JsonConverterToJson<int, DateTime>(
          instance.expiresAt, const EpochDateTimeConverter().toJson),
      'feeds': instance.feeds,
      'filter_tags': instance.filterTags,
      'hidden': instance.hidden,
      'id': instance.id,
      'interest_tags': instance.interestTags,
      'is_watched': instance.isWatched,
      'latest_reactions':
          instance.latestReactions.map((e) => e.toJson()).toList(),
      'location': instance.location?.toJson(),
      'mentioned_users':
          instance.mentionedUsers.map((e) => e.toJson()).toList(),
      'moderation': instance.moderation?.toJson(),
      'notification_context': instance.notificationContext?.toJson(),
      'own_bookmarks': instance.ownBookmarks.map((e) => e.toJson()).toList(),
      'own_reactions': instance.ownReactions.map((e) => e.toJson()).toList(),
      'parent': instance.parent?.toJson(),
      'poll': instance.poll?.toJson(),
      'popularity': instance.popularity,
      'reaction_count': instance.reactionCount,
      'reaction_groups':
          instance.reactionGroups.map((k, e) => MapEntry(k, e.toJson())),
      'score': instance.score,
      'search_data': instance.searchData,
      'share_count': instance.shareCount,
      'text': instance.text,
      'type': instance.type,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user.toJson(),
      'visibility': _$ActivityResponseVisibilityEnumMap[instance.visibility]!,
      'visibility_tag': instance.visibilityTag,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$ActivityResponseVisibilityEnumMap = {
  ActivityResponseVisibility.private: 'private',
  ActivityResponseVisibility.public: 'public',
  ActivityResponseVisibility.tag: 'tag',
  ActivityResponseVisibility.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
