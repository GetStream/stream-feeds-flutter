import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart';
import 'bookmark_data.dart';
import 'collection_data.dart';
import 'comment_data.dart';
import 'feed_data.dart';
import 'feeds_reaction_data.dart';
import 'moderation.dart';
import 'poll_data.dart';
import 'reaction_group_data.dart';
import 'share_data.dart';
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
    this.collections = const {},
    this.commentCount = 0,
    this.comments = const [],
    required this.createdAt,
    this.currentFeed,
    this.deletedAt,
    this.editedAt,
    this.expiresAt,
    this.feeds = const [],
    this.filterTags = const [],
    this.friendReactionCount,
    this.friendReactions = const [],
    this.i18n,
    required this.id,
    this.interestTags = const [],
    this.isRead,
    this.isSeen,
    this.isWatched,
    this.latestReactions = const [],
    this.location,
    this.mentionedUsers = const [],
    this.metrics = const {},
    this.moderation,
    this.notificationContext,
    this.ownBookmarks = const [],
    this.ownReactions = const [],
    this.parent,
    this.poll,
    this.popularity = 0,
    this.hidden = false,
    this.preview = false,
    this.reactionCount = 0,
    this.reactionGroups = const {},
    this.restrictReplies = ActivityRestrictReplies.everyone,
    this.score = 0.0,
    this.searchData = const {},
    this.latestShares = const [],
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
  final List<Attachment> attachments;

  /// The number of bookmarks this activity has received.
  @override
  final int bookmarkCount;

  /// Collections attached to this activity.
  ///
  /// A map of collection references to their enriched data. Collection references
  /// are in the format "collection_name:collection_id".
  @override
  final Map<String, CollectionData> collections;

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

  /// The number of reactions from friends on this activity.
  @override
  final int? friendReactionCount;

  /// The reactions from friends on this activity.
  @override
  final List<FeedsReactionData> friendReactions;

  /// Translations of the activity's text, keyed by language code.
  @override
  final Map<String, String>? i18n;

  /// The unique identifier of the activity.
  @override
  final String id;

  /// Tags indicating user interests or content categories.
  @override
  final List<String> interestTags;

  /// Whether this activity has been read by the current user.
  ///
  /// Relevant for notification feeds — `true` once the user has opened or
  /// acknowledged the activity.
  @override
  final bool? isRead;

  /// Whether this activity has been seen by the current user.
  ///
  /// Relevant for notification feeds — `true` once the activity has
  /// appeared in the user's feed view.
  @override
  final bool? isSeen;

  /// Whether the activity was watched by the current user. Relevant for stories.
  @override
  final bool? isWatched;

  /// The most recent reactions added to the activity.
  @override
  final List<FeedsReactionData> latestReactions;

  /// Geographic location data associated with the activity, if any.
  @override
  final LocationCoordinate? location;

  /// Users mentioned in the activity.
  @override
  final List<UserData> mentionedUsers;

  /// Activity metrics such as click counts, impression counts, etc.
  ///
  /// Keys are metric names (e.g. `"click_count"`, `"impression_count"`) and
  /// values are their integer counts.
  @override
  final Map<String, int> metrics;

  /// Moderation state and data for the activity.
  @override
  final Moderation? moderation;

  /// Contextual data for notifications related to this activity.
  @override
  final NotificationContext? notificationContext;

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

  /// Whether the activity has been hidden by the current user.
  ///
  /// Hidden activities may be filtered from feed views depending on
  /// application logic.
  @override
  final bool hidden;

  /// Whether this activity is obfuscated for the current user.
  ///
  /// Used for premium content where you want to show a preview without
  /// revealing full details.
  @override
  final bool preview;

  /// The total number of reactions on the activity across all reaction types.
  @override
  final int reactionCount;

  /// Groups of reactions by type.
  @override
  final Map<String, ReactionGroupData> reactionGroups;

  /// Who is allowed to add comments/replies to this activity.
  ///
  /// Controls the comment restriction setting for this activity:
  /// - [ActivityRestrictReplies.everyone] (default) — anyone can comment.
  /// - [ActivityRestrictReplies.nobody] — comments are disabled.
  /// - [ActivityRestrictReplies.peopleIFollow] — only users followed by the
  ///   activity author may comment. Use [FeedData.ownFollowings] from the
  ///   current feed to decide whether to show the comment input.
  @override
  final ActivityRestrictReplies restrictReplies;

  /// A relevance or quality score assigned to the activity.
  @override
  final double score;

  /// Additional data used for search indexing and retrieval.
  @override
  final Map<String, Object?> searchData;

  /// The most recent shares of this activity.
  @override
  final List<ShareData> latestShares;

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
  final Map<String, Object?>? custom;

  /// Creates a new [ActivityData] instance with the updated ownCapabilities on [currentFeed].
  ActivityData copyWithCurrentFeedCapabilities({
    required List<FeedOwnCapability> capabilities,
  }) {
    return copyWith(
      currentFeed: currentFeed?.copyWith(
        ownCapabilities: capabilities,
      ),
    );
  }
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
}

/// Extension function to convert an [ActivityResponse] to an [ActivityData] model.
extension ActivityResponseMapper on ActivityResponse {
  /// Converts this API activity response to a domain [ActivityData] instance.
  ///
  /// This is a simplified implementation that works with the current project state.
  /// Some fields are simplified or use placeholders until all dependencies are implemented.
  ActivityData toModel() {
    return ActivityData(
      attachments: attachments,
      bookmarkCount: bookmarkCount,
      collections: {
        for (final entry in collections.entries) entry.key: entry.value.toModel(),
      },
      commentCount: commentCount,
      comments: [...comments.map((c) => c.toModel())],
      createdAt: createdAt,
      currentFeed: currentFeed?.toModel(),
      deletedAt: deletedAt,
      editedAt: editedAt,
      expiresAt: expiresAt,
      feeds: feeds,
      filterTags: filterTags,
      friendReactionCount: friendReactionCount,
      friendReactions: [...?friendReactions?.map((r) => r.toModel())],
      i18n: i18n,
      id: id,
      interestTags: interestTags,
      isRead: isRead,
      isSeen: isSeen,
      isWatched: isWatched,
      latestReactions: [...latestReactions.map((r) => r.toModel())],
      location: location?.let(
        (it) => LocationCoordinate(
          latitude: it.lat,
          longitude: it.lng,
        ),
      ),
      mentionedUsers: [...mentionedUsers.map((u) => u.toModel())],
      metrics: metrics ?? const {},
      moderation: moderation?.toModel(),
      notificationContext: notificationContext,
      ownBookmarks: [...ownBookmarks.map((b) => b.toModel())],
      ownReactions: [...ownReactions.map((r) => r.toModel())],
      parent: parent?.toModel(),
      poll: poll?.toModel(),
      popularity: popularity,
      hidden: hidden,
      preview: preview,
      reactionCount: reactionCount,
      reactionGroups: {
        for (final entry in reactionGroups.entries) entry.key: entry.value.toModel(),
      },
      restrictReplies: ActivityRestrictReplies(restrictReplies),
      score: score,
      searchData: searchData,
      latestShares: [...?latestShares?.map((s) => s.toModel())],
      shareCount: shareCount,
      text: text,
      type: type,
      updatedAt: updatedAt,
      user: user.toModel(),
      visibility: ActivityDataVisibility(visibility),
      visibilityTag: visibilityTag,
      custom: custom,
    );
  }
}

/// Extension functions for [ActivityData] to handle common operations.
extension ActivityDataMutations on ActivityData {
  /// Updates this activity with new data while preserving own data.
  ///
  /// Merges [updated] activity data with this instance. If [ownBookmarks]/[ownReactions] are
  /// explicitly passed, they take precedence (used by callers that just computed a locally
  /// up-to-date value, e.g. [upsertBookmark]). Otherwise, they're taken from [updated] only when
  /// [hasOwnFields] is `true`; if `false`, they're preserved from this instance. This matters
  /// because these `own_*` fields are only reliably populated when the request that produced
  /// [updated] set `enrichOwnFields: true` (or came from a WS event, which never carries them) —
  /// an omitted field there means "not fetched", not "empty", so blindly taking it would wipe out
  /// state we already know to be correct. [hasOwnFields] is forwarded to [currentFeed]'s own
  /// merge for the same reason.
  ///
  /// Returns a new [ActivityData] instance with the merged data.
  ActivityData updateWith(
    ActivityData updated, {
    List<BookmarkData>? ownBookmarks,
    List<FeedsReactionData>? ownReactions,
    bool hasOwnFields = false,
  }) {
    return updated.copyWith(
      ownBookmarks: ownBookmarks ?? (hasOwnFields ? updated.ownBookmarks : this.ownBookmarks),
      ownReactions: ownReactions ?? (hasOwnFields ? updated.ownReactions : this.ownReactions),
      poll: updated.poll?.let((it) => poll?.updateWith(it) ?? it),
      // Workaround until the backend fixes the issue with missing currentFeed
      // in some WS events
      currentFeed: switch (updated.currentFeed) {
        final it? => currentFeed?.updateWith(it, hasOwnFields: hasOwnFields) ?? it,
        _ => currentFeed,
      },
    );
  }

  /// Conditionally updates this activity based on a filter.
  ///
  /// If [filter] returns true for this activity, applies the [update] function
  /// to produce a new updated activity. Otherwise, returns this activity unchanged.
  ///
  /// This is useful for applying updates only when certain conditions are met.
  ///
  /// Returns a new [ActivityData] instance, either updated or unchanged.
  ActivityData updateIf({
    required bool Function(ActivityData) filter,
    required ActivityData Function(ActivityData) update,
  }) {
    if (!filter(this)) return this;
    return update(this);
  }

  /// Adds or updates a comment in this activity.
  ///
  /// Updates the comments list by adding or updating [comment]. If the comment already
  /// exists, it will be updated. The comment count is automatically recalculated.
  ///
  /// Returns a new [ActivityData] instance with the updated comments and comment count.
  ActivityData upsertComment(CommentData comment) {
    final currentComments = [...comments];
    final updatedComments = currentComments.upsert(comment, key: (it) => it.id);

    final difference = updatedComments.length - currentComments.length;
    final updatedCommentCount = math.max(0, commentCount + difference);

    return copyWith(
      comments: updatedComments,
      commentCount: updatedCommentCount,
    );
  }

  /// Removes a comment from this activity.
  ///
  /// Updates the comments list by removing [comment]. The comment count is automatically
  /// recalculated.
  ///
  /// Returns a new [ActivityData] instance with the updated comments and comment count.
  ActivityData removeComment(CommentData comment) {
    final currentComments = [...comments];
    final updatedComments = currentComments.where((it) {
      return it.id != comment.id;
    }).toList();

    final difference = updatedComments.length - currentComments.length;
    final updatedCommentCount = math.max(0, commentCount + difference);

    return copyWith(
      comments: updatedComments,
      commentCount: updatedCommentCount,
    );
  }

  /// Adds or updates a reaction in a comment within this activity with unique enforcement.
  ///
  /// Updates the own reactions list of the comment by adding or updating [reaction]. Only adds reactions
  /// that belong to [currentUserId]. When unique enforcement is enabled, replaces any
  /// existing reaction from the same user.
  ///
  /// Returns a new [ActivityData] instance with the updated comment reactions.
  ActivityData upsertUniqueCommentReaction(
    CommentData updatedComment,
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    return upsertCommentReaction(
      updatedComment,
      reaction,
      currentUserId,
      enforceUnique: true,
    );
  }

  /// Adds or updates a reaction in a comment within this activity.
  ///
  /// Updates the own reactions list of the comment by adding or updating [reaction]. Only adds reactions
  /// that belong to [currentUserId]. When [enforceUnique] is true, replaces any existing
  /// reaction from the same user; otherwise, allows multiple reactions from the same user.
  ///
  /// Returns a new [ActivityData] instance with the updated comment reactions.
  ActivityData upsertCommentReaction(
    CommentData updatedComment,
    FeedsReactionData reaction,
    String currentUserId, {
    bool enforceUnique = false,
  }) {
    final updatedComments = comments.updateWhere(
      (it) => it.id == updatedComment.id,
      update: (it) => it.upsertReaction(
        updatedComment,
        reaction,
        currentUserId,
        enforceUnique: enforceUnique,
      ),
    );

    return copyWith(comments: updatedComments);
  }

  /// Removes a reaction from a comment within this activity.
  ///
  /// Updates the own reactions list of the comment by removing [reaction]. Only removes reactions
  /// that belong to [currentUserId].
  ///
  /// Returns a new [ActivityData] instance with the updated comment reactions.
  ActivityData removeCommentReaction(
    CommentData updatedComment,
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    final updatedComments = comments.updateWhere(
      (it) => it.id == updatedComment.id,
      update: (it) => it.removeReaction(
        updatedComment,
        reaction,
        currentUserId,
      ),
    );

    return copyWith(comments: updatedComments);
  }

  /// Adds or updates a bookmark in this activity.
  ///
  /// Updates the own bookmarks list by adding or updating [bookmark]. Only adds bookmarks
  /// that belong to [currentUserId]. If the bookmark already exists, it will be updated.
  ///
  /// Returns a new [ActivityData] instance with the updated own bookmarks and bookmark count.
  ActivityData upsertBookmark(
    BookmarkData bookmark,
    String currentUserId,
  ) {
    final updatedOwnBookmarks = ownBookmarks.let((it) {
      if (bookmark.user.id != currentUserId) return it;
      return it.upsert(bookmark, key: (it) => it.id);
    });

    return updateWith(bookmark.activity, ownBookmarks: updatedOwnBookmarks);
  }

  /// Removes a bookmark from this activity.
  ///
  /// Updates the own bookmarks list by removing [bookmark]. Only removes bookmarks
  /// that belong to [currentUserId].
  ///
  /// Returns a new [ActivityData] instance with the updated own bookmarks and bookmark count.
  ActivityData removeBookmark(
    BookmarkData bookmark,
    String currentUserId,
  ) {
    final updatedOwnBookmarks = ownBookmarks.let((it) {
      if (bookmark.user.id != currentUserId) return it;
      return it.where((it) => it.id != bookmark.id).toList();
    });

    return updateWith(bookmark.activity, ownBookmarks: updatedOwnBookmarks);
  }

  /// Adds or updates a reaction in this activity with unique enforcement.
  ///
  /// Updates the own reactions list by adding or updating [reaction]. Only adds reactions
  /// that belong to [currentUserId]. When unique enforcement is enabled, replaces any
  /// existing reaction from the same user.
  ///
  /// Returns a new [ActivityData] instance with the updated own reactions.
  ActivityData upsertUniqueReaction(
    ActivityData updatedActivity,
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    return upsertReaction(
      updatedActivity,
      reaction,
      currentUserId,
      enforceUnique: true,
    );
  }

  /// Adds or updates a reaction in this activity.
  ///
  /// Updates the own reactions list by adding or updating [reaction]. Only adds reactions
  /// that belong to [currentUserId]. When [enforceUnique] is true, replaces any existing
  /// reaction from the same user; otherwise, allows multiple reactions from the same user.
  ///
  /// Returns a new [ActivityData] instance with the updated own reactions.
  ActivityData upsertReaction(
    ActivityData updatedActivity,
    FeedsReactionData reaction,
    String currentUserId, {
    bool enforceUnique = false,
  }) {
    final updatedOwnReactions = ownReactions.let((it) {
      if (reaction.user.id != currentUserId) return it;
      return it.upsertReaction(reaction, enforceUnique: enforceUnique);
    });

    return updateWith(updatedActivity, ownReactions: updatedOwnReactions);
  }

  /// Removes a reaction from this activity.
  ///
  /// Updates the own reactions list by removing [reaction]. Only removes reactions
  /// that belong to [currentUserId].
  ///
  /// Returns a new [ActivityData] instance with the updated own reactions.
  ActivityData removeReaction(
    ActivityData updatedActivity,
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    final updatedOwnReactions = ownReactions.let((it) {
      if (reaction.user.id != currentUserId) return it;
      return it.where((it) => it.id != reaction.id).toList();
    });

    return updateWith(updatedActivity, ownReactions: updatedOwnReactions);
  }
}

/// Controls who can add comments/replies to an activity.
///
/// Implemented as an extension type so any future server-side values are
/// handled without requiring a client update.
extension type const ActivityRestrictReplies(String value) implements String {
  /// Anyone can comment on the activity (default).
  static const everyone = ActivityRestrictReplies('everyone');

  /// No one can comment on the activity.
  static const nobody = ActivityRestrictReplies('nobody');

  /// Only users followed by the activity author can comment.
  static const peopleIFollow = ActivityRestrictReplies('people_i_follow');
}
