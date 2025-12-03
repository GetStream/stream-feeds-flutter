import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart';
import 'user_data.dart';

part 'feeds_reaction_data.freezed.dart';

/// A reaction to an activity in the Stream Feeds system.
///
/// Contains the user who reacted, reaction type, activity reference,
/// and timestamp information.
@freezed
class FeedsReactionData with _$FeedsReactionData {
  /// Creates a new [FeedsReactionData] instance.
  const FeedsReactionData({
    required this.activityId,
    this.commentId,
    required this.createdAt,
    required this.type,
    required this.updatedAt,
    required this.user,
    this.custom,
  });

  /// The ID of the activity this reaction is associated with.
  @override
  final String activityId;

  /// The ID of the comment this reaction is associated with.
  @override
  final String? commentId;

  /// The date and time when the reaction was created.
  @override
  final DateTime createdAt;

  /// The type of the reaction.
  @override
  final String type;

  /// The date and time when the reaction was last updated.
  @override
  final DateTime updatedAt;

  /// The user who made the reaction.
  @override
  final UserData user;

  /// Optional custom data as a map.
  @override
  final Map<String, Object?>? custom;

  /// Unique identifier for the reaction.
  ///
  /// Combines the reaction type and user reactions group ID.
  String get id => '$type-$userReactionsGroupId';

  /// Identifier for grouping a user's reactions.
  String get userReactionsGroupId {
    if (commentId case final id?) return '${user.id}-$id-$activityId';
    return '${user.id}-$activityId';
  }
}

/// Extension functions for managing reactions in a list.
extension FeedsReactionListMutation on List<FeedsReactionData> {
  static int _alwaysEqualComparator<T>(T a, T b) => 0;

  /// Adds or updates a reaction in this list with unique enforcement.
  ///
  /// Updates this list by adding or updating [reaction]. When unique enforcement is enabled,
  /// replaces any existing reaction from the same user reactions group. Uses [compare] to
  /// determine the order when inserting.
  ///
  /// Returns a new list with the updated reactions.
  List<FeedsReactionData> upsertUniqueReaction(
    FeedsReactionData reaction, {
    Comparator<FeedsReactionData> compare = _alwaysEqualComparator,
  }) {
    return upsertReaction(
      reaction,
      enforceUnique: true,
      compare: compare,
    );
  }

  /// Adds or updates a reaction in this list.
  ///
  /// Updates this list by adding or updating [reaction]. When [enforceUnique] is true,
  /// replaces any existing reaction from the same user reactions group; otherwise,
  /// allows multiple reactions. Uses [compare] to determine the order when inserting.
  ///
  /// Returns a new list with the updated reactions.
  List<FeedsReactionData> upsertReaction(
    FeedsReactionData reaction, {
    bool enforceUnique = false,
    Comparator<FeedsReactionData> compare = _alwaysEqualComparator,
  }) {
    if (enforceUnique) {
      return insertUnique(
        reaction,
        key: (r) => r.userReactionsGroupId,
        compare: compare,
      );
    }

    return sortedUpsert(
      reaction,
      key: (r) => r.id,
      compare: compare,
    );
  }
}

/// Extension function to convert a [FeedsReactionResponse] to a [FeedsReactionData] model.
extension FeedsReactionResponseMapper on FeedsReactionResponse {
  /// Converts this API feeds reaction response to a domain [FeedsReactionData] instance.
  FeedsReactionData toModel() {
    return FeedsReactionData(
      activityId: activityId,
      commentId: commentId,
      createdAt: createdAt,
      type: type,
      updatedAt: updatedAt,
      user: user.toModel(),
      custom: custom,
    );
  }
}
