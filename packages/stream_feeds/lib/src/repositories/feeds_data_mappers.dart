import '../../stream_feeds.dart';
import '../generated/api/api.g.dart' as api;
import '../models.dart';

extension FeedsReactionResponseMapper on api.FeedsReactionResponse {
  FeedsReactionData toModel() {
    return FeedsReactionData(
      activityId: activityId,
      createdAt: createdAt,
      customData: custom,
      type: type,
      updatedAt: updatedAt,
      user: user.toModel(),
    );
  }
}

extension UserResponseMapper on api.UserResponse {
  UserData toModel() {
    return UserData(id: id, name: name, imageUrl: image);
  }
}

extension ReactionGroupResponseMapper on api.ReactionGroupResponse {
  ReactionGroupData toModel() {
    return ReactionGroupData(
      count: count,
      firstReactionAt: firstReactionAt,
      lastReactionAt: lastReactionAt,
    );
  }
}

extension GetOrCreateFeedResponseMapper on api.GetOrCreateFeedResponse {
  PaginationResult<ActivityData> toPaginatedActivityData() {
    return PaginationResult(
      items: activities.map(
        (e) {
          return ActivityData(
            id: e.id,
            user: e.user.toModel(),
            text: e.text,
            reactionCount: e.reactionCount,
            latestReactions: e.latestReactions.map((e) => e.toModel()).toList(),
            ownReactions: e.ownReactions.map((e) => e.toModel()).toList(),
            reactionGroups: e.reactionGroups.map<String, ReactionGroupData>(
              (key, value) => MapEntry(key, value.toModel()),
            ),
          );
        },
      ).toList(),
      pagination: PaginationData(next: next, previous: prev),
    );
  }
}
