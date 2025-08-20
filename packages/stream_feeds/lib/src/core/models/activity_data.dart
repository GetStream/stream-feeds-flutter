import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import 'bookmark_data.dart';
import 'comment_data.dart';
import 'feed_data.dart';
import 'feeds_reaction_data.dart';
import 'moderation.dart';
import 'poll_data.dart';
import 'reaction_group_data.dart';
import 'user_data.dart';

part 'activity_data.freezed.dart';

/// An activity in the Stream Feeds system.
///
/// The core content unit that flows through feeds, containing actor, verb,
/// object, and target components. Supports social interactions like reactions
/// and comments, hierarchical relationships, embedded content, and real-time
/// interaction tracking.
@freezed
class ActivityData with _$ActivityData {
  /// Creates a new [ActivityData] instance.
  const ActivityData({
    this.attachments = const [],
    this.bookmarkCount = 0,
    this.commentCount = 0,
    this.comments = const [],
    required this.createdAt,
    this.currentFeed,
    this.deletedAt,
    this.editedAt,
    this.expiresAt,
    this.feeds = const [],
    this.filterTags = const [],
    required this.id,
    this.interestTags = const [],
    this.latestReactions = const [],
    this.location,
    this.mentionedUsers = const [],
    this.moderation,
    this.notificationContext,
    this.ownBookmarks = const [],
    this.ownReactions = const [],
    this.parent,
    this.poll,
    this.popularity = 0,
    this.reactionCount = 0,
    this.reactionGroups = const {},
    this.score = 0.0,
    this.searchData = const {},
    this.shareCount = 0,
    this.text,
    required this.type,
    required this.updatedAt,
    required this.user,
    this.visibility = ActivityDataVisibility.public,
    this.visibilityTag,
    this.custom,
  });

  /// File attachments associated with the activity.
  @override
  final List<api.Attachment> attachments;

  /// The number of bookmarks this activity has received.
  @override
  final int bookmarkCount;

  /// The total number of comments on this activity.
  @override
  final int commentCount;

  /// The comments associated with this activity.
  @override
  final List<CommentData> comments;

  /// The date and time when the activity was created.
  @override
  final DateTime createdAt;

  /// The current feed context for this activity.
  @override
  final FeedData? currentFeed;

  /// The date and time when the activity was deleted, if applicable.
  @override
  final DateTime? deletedAt;

  /// The date and time when the activity was last edited, if applicable.
  @override
  final DateTime? editedAt;

  /// The date and time when the activity expires, if applicable.
  @override
  final DateTime? expiresAt;

  /// The list of feed IDs where this activity appears.
  @override
  final List<String> feeds;

  /// Tags used for content filtering and categorization.
  @override
  final List<String> filterTags;

  /// The unique identifier of the activity.
  @override
  final String id;

  /// Tags indicating user interests or content categories.
  @override
  final List<String> interestTags;

  /// The most recent reactions added to the activity.
  @override
  final List<FeedsReactionData> latestReactions;

  /// Geographic location data associated with the activity, if any.
  @override
  final api.ActivityLocation? location;

  /// Users mentioned in the activity.
  @override
  final List<UserData> mentionedUsers;

  /// Moderation state and data for the activity.
  @override
  final Moderation? moderation;

  /// Contextual data for notifications related to this activity.
  @override
  final Map<String, Object>? notificationContext;

  /// All the bookmarks from the current user for this activity.
  @override
  final List<BookmarkData> ownBookmarks;

  /// All the reactions from the current user for this activity.
  @override
  final List<FeedsReactionData> ownReactions;

  /// The parent activity, if this is a child activity.
  @override
  final ActivityData? parent;

  /// Poll data if this activity contains a poll.
  @override
  final PollData? poll;

  /// A popularity score for the activity, typically based on engagement metrics.
  @override
  final int popularity;

  /// The total number of reactions on the activity across all reaction types.
  @override
  final int reactionCount;

  /// Groups of reactions by type.
  @override
  final Map<String, ReactionGroupData> reactionGroups;

  /// A relevance or quality score assigned to the activity.
  @override
  final double score;

  /// Additional data used for search indexing and retrieval.
  @override
  final Map<String, Object> searchData;

  /// The number of times this activity has been shared.
  @override
  final int shareCount;

  /// The text content of the activity.
  @override
  final String? text;

  /// The type or category of the activity (e.g., "post", "share", "like").
  @override
  final String type;

  /// The date and time when the activity was last updated.
  @override
  final DateTime updatedAt;

  /// The user who created the activity.
  @override
  final UserData user;

  /// The visibility settings for the activity.
  @override
  final ActivityDataVisibility visibility;

  /// Additional visibility classification tag, if applicable.
  @override
  final String? visibilityTag;

  /// Custom data associated with the activity.
  @override
  final Map<String, Object>? custom;
}

/// Extension type for activity visibility settings.
/// This represents the visibility state of an activity (public, private or tag).
///
/// By implementing String, it automatically handles any custom visibility values
/// returned from the API while providing type safety for common values.
extension type const ActivityDataVisibility(String value) implements String {
  /// Private visibility - only visible to the user who created it
  static const private = ActivityDataVisibility('private');

  /// Public visibility - visible to all users
  static const public = ActivityDataVisibility('public');

  /// Tag visibility - visible based on tag rules
  static const tag = ActivityDataVisibility('tag');

  /// Unknown visibility state
  static const unknown = ActivityDataVisibility('unknown');
}

/// Extension function to convert an [api.ActivityResponse] to an [ActivityData] model.
extension ActivityResponseMapper on api.ActivityResponse {
  /// Converts this API activity response to a domain [ActivityData] instance.
  ///
  /// This is a simplified implementation that works with the current project state.
  /// Some fields are simplified or use placeholders until all dependencies are implemented.
  ActivityData toModel() {
    return ActivityData(
      attachments: attachments,
      bookmarkCount: bookmarkCount,
      commentCount: commentCount,
      comments: [...comments.map((c) => c.toModel())],
      createdAt: createdAt,
      currentFeed: currentFeed?.toModel(),
      deletedAt: deletedAt,
      editedAt: editedAt,
      expiresAt: expiresAt,
      feeds: feeds,
      filterTags: filterTags,
      id: id,
      interestTags: interestTags,
      latestReactions: [...latestReactions.map((r) => r.toModel())],
      location: location,
      mentionedUsers: [...mentionedUsers.map((u) => u.toModel())],
      moderation: moderation?.toModel(),
      notificationContext: notificationContext,
      ownBookmarks: [...ownBookmarks.map((b) => b.toModel())],
      ownReactions: [...ownReactions.map((r) => r.toModel())],
      parent: parent?.toModel(),
      poll: poll?.toModel(),
      popularity: popularity,
      reactionCount: reactionCount,
      reactionGroups: {
        for (final entry in reactionGroups.entries)
          entry.key: entry.value.toModel(),
      },
      score: score,
      searchData: searchData,
      shareCount: shareCount,
      text: text,
      type: type,
      updatedAt: updatedAt,
      user: user.toModel(),
      visibility: visibility.toModel(),
      visibilityTag: visibilityTag,
      custom: custom,
    );
  }
}

/// Extension functions for [ActivityData] to handle common operations.
extension ActivityDataMutations on ActivityData {
  /// Adds a comment to the activity, updating the comment count and the list of comments.
  ///
  /// @param comment The comment to be added.
  /// @return A new [ActivityData] instance with the updated comments and comment count.
  ActivityData addComment(CommentData comment) {
    final updatedComments = comments.upsert(comment, key: (it) => it.id);

    return copyWith(
      comments: updatedComments,
      commentCount: math.max(0, commentCount + 1),
    );
  }

  /// Removes a comment from the activity, updating the comment count and the list of comments.
  ///
  /// @param comment The comment to be removed.
  /// @return A new [ActivityData] instance with the updated comments and comment count.
  ActivityData removeComment(CommentData comment) {
    final updatedComments = comments.where((it) {
      return it.id != comment.id;
    }).toList();

    return copyWith(
      comments: updatedComments,
      commentCount: math.max(0, commentCount - 1),
    );
  }

  /// Adds a bookmark to the activity, updating the own bookmarks and bookmark count.
  ///
  /// @param bookmark The bookmark to be added.
  /// @param currentUserId The ID of the current user, used to determine if the bookmark belongs to
  /// them.
  /// @return A new [ActivityData] instance with the updated own bookmarks and bookmark count.
  ActivityData addBookmark(
    BookmarkData bookmark,
    String currentUserId,
  ) {
    final updatedOwnBookmarks = switch (bookmark.user.id == currentUserId) {
      true => ownBookmarks.upsert(bookmark, key: (it) => it.id),
      false => ownBookmarks,
    };

    return copyWith(
      ownBookmarks: updatedOwnBookmarks,
      bookmarkCount: math.max(0, bookmarkCount + 1),
    );
  }

  /// Removes a bookmark from the activity, updating the own bookmarks and bookmark count.
  ///
  /// @param bookmark The bookmark to be deleted.
  /// @param currentUserId The ID of the current user, used to determine if the bookmark belongs to
  /// them.
  /// @return A new [ActivityData] instance with the updated own bookmarks and bookmark count.
  ActivityData removeBookmark(
    BookmarkData bookmark,
    String currentUserId,
  ) {
    final updatedOwnBookmarks = switch (bookmark.user.id == currentUserId) {
      true => ownBookmarks.where((it) => it.id != bookmark.id).toList(),
      false => ownBookmarks,
    };

    return copyWith(
      ownBookmarks: updatedOwnBookmarks,
      bookmarkCount: math.max(0, bookmarkCount - 1),
    );
  }

  /// Adds a reaction to the activity, updating the latest reactions, reaction groups,
  /// reaction count, and own reactions.
  ///
  /// @param reaction The reaction to be added.
  /// @param currentUserId The ID of the current user, used to determine if the reaction belongs to.
  /// @return A new [ActivityData] instance with the updated reactions and counts.
  ActivityData addReaction(
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    final updatedOwnReactions = switch (reaction.user.id == currentUserId) {
      true => ownReactions.upsert(reaction, key: (it) => it.id),
      false => ownReactions,
    };

    final updatedLatestReactions = latestReactions.upsert(
      reaction,
      key: (reaction) => reaction.id,
    );

    final reactionGroup = switch (reactionGroups[reaction.type]) {
      final existingGroup? => existingGroup,
      _ => ReactionGroupData(
          count: 1,
          firstReactionAt: reaction.createdAt,
          lastReactionAt: reaction.createdAt,
        ),
    };

    final updatedReactionGroups = {
      ...reactionGroups,
      reaction.type: reactionGroup.increment(reaction.createdAt),
    };

    final updatedReactionCount = updatedReactionGroups.values.sumOf(
      (group) => group.count,
    );

    return copyWith(
      ownReactions: updatedOwnReactions,
      latestReactions: updatedLatestReactions,
      reactionGroups: updatedReactionGroups,
      reactionCount: updatedReactionCount,
    );
  }

  /// Removes a reaction from the activity, updating the latest reactions, reaction groups,
  /// reaction count, and own reactions.
  ///
  /// @param reaction The reaction to be removed.
  /// @param currentUserId The ID of the current user, used to determine if the reaction belongs to.
  /// @return A new [ActivityData] instance with the updated reactions and counts.
  ActivityData removeReaction(
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    final updatedOwnReactions = switch (reaction.user.id == currentUserId) {
      true => ownReactions.where((it) => it.id != reaction.id).toList(),
      false => ownReactions,
    };

    final updatedLatestReactions = latestReactions.where((it) {
      return it.id != reaction.id;
    }).toList();

    final updatedReactionGroups = {...reactionGroups};
    final reactionGroup = updatedReactionGroups.remove(reaction.type);

    if (reactionGroup == null) {
      // If there is no reaction group for this type, just update latest and own reactions.
      // Note: This is only a hypothetical case, as we should always have a reaction group.
      return copyWith(
        latestReactions: updatedLatestReactions,
        ownReactions: updatedOwnReactions,
      );
    }

    final updatedReactionGroup = reactionGroup.decrement(reaction.createdAt);
    if (updatedReactionGroup.count > 0) {
      updatedReactionGroups[reaction.type] = updatedReactionGroup;
    }

    final updatedReactionCount = updatedReactionGroups.values.sumOf(
      (group) => group.count,
    );

    return copyWith(
      ownReactions: updatedOwnReactions,
      latestReactions: updatedLatestReactions,
      reactionGroups: updatedReactionGroups,
      reactionCount: updatedReactionCount,
    );
  }
}

/// Extension function to convert an [api.ActivityResponseVisibility] to an [ActivityDataVisibility].
extension ActivityResponseVisibilityMapper on api.ActivityResponseVisibility {
  /// Converts this API visibility enum to a domain [ActivityDataVisibility] extension type.
  ///
  /// Uses explicit mapping for type safety and proper handling of unknown values.
  ActivityDataVisibility toModel() {
    return switch (this) {
      api.ActivityResponseVisibility.private => ActivityDataVisibility.private,
      api.ActivityResponseVisibility.public => ActivityDataVisibility.public,
      api.ActivityResponseVisibility.tag => ActivityDataVisibility.tag,
      api.ActivityResponseVisibility.unknown => ActivityDataVisibility.unknown,
    };
  }
}
