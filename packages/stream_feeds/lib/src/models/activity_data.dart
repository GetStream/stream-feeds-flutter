import '../models.dart';
import '../utils/list_extensions.dart';

// TODO: incomplete
class ActivityData implements Identifiable {
  const ActivityData({
    required this.id,
    required this.user,
    required this.text,
    required this.reactionCount,
    required this.latestReactions,
    required this.ownReactions,
    required this.reactionGroups,
  });

  @override
  final String id;
  final UserData user;
  final String? text;
  final int reactionCount;
  final List<FeedsReactionData> latestReactions;
  final List<FeedsReactionData> ownReactions;
  final Map<String, ReactionGroupData> reactionGroups;

  ActivityData copyWith({
    String? text,
    int? reactionCount,
    List<FeedsReactionData>? latestReactions,
    List<FeedsReactionData>? ownReactions,
    Map<String, ReactionGroupData>? reactionGroups,
  }) {
    return ActivityData(
      id: id,
      user: user,
      text: text ?? this.text,
      reactionCount: reactionCount ?? this.reactionCount,
      latestReactions: latestReactions ?? this.latestReactions,
      ownReactions: ownReactions ?? this.ownReactions,
      reactionGroups: reactionGroups ?? this.reactionGroups,
    );
  }

  ActivityData addReaction(FeedsReactionData reaction,
      {required String currentUserId}) {
    final newLatestReactions = [...latestReactions];
    final newReactionGroups =
        Map<String, ReactionGroupData>.from(reactionGroups);
    var newOwnReactions = [...ownReactions];

    reaction.updateByAdding(
      to: newLatestReactions,
      reactionGroups: newReactionGroups,
    );
    if (reaction.user.id == currentUserId) {
      newOwnReactions = newOwnReactions.insertById(reaction);
    }

    return copyWith(
      reactionCount: reactionGroups.totalCount,
      latestReactions: List.unmodifiable(newLatestReactions),
      ownReactions: List.unmodifiable(newOwnReactions),
      reactionGroups: Map.unmodifiable(newReactionGroups),
    );
  }

  ActivityData removeReaction(FeedsReactionData reaction,
      {required String currentUserId}) {
    final newLatestReactions = [...latestReactions];
    final newReactionGroups =
        Map<String, ReactionGroupData>.from(reactionGroups);
    var newOwnReactions = [...ownReactions];

    reaction.updateByRemoving(
      to: newLatestReactions,
      reactionGroups: newReactionGroups,
    );
    if (reaction.user.id == currentUserId) {
      newOwnReactions = newOwnReactions.removeById(reaction);
    }

    return copyWith(
      reactionCount: reactionGroups.totalCount,
      latestReactions: List.unmodifiable(newLatestReactions),
      ownReactions: List.unmodifiable(newOwnReactions),
      reactionGroups: Map.unmodifiable(newReactionGroups),
    );
  }
}

extension on FeedsReactionData {
  void updateByAdding({
    required List<FeedsReactionData> to,
    required Map<String, ReactionGroupData> reactionGroups,
  }) {
    to.insertById(this, createNewList: false);

    final reactionGroup = reactionGroups[type]?.increment(createdAt) ??
        ReactionGroupData(
          count: 1,
          firstReactionAt: createdAt,
          lastReactionAt: createdAt,
        );
    reactionGroups[type] = reactionGroup;
  }

  void updateByRemoving({
    required List<FeedsReactionData> to,
    required Map<String, ReactionGroupData> reactionGroups,
  }) {
    to.removeById(this, createNewList: false);
    var reactionGroup = reactionGroups[type];
    if (reactionGroup != null) {
      reactionGroup = reactionGroup.decrement(createdAt);
      if (reactionGroup.isEmpty) {
        reactionGroups.remove(type);
      } else {
        reactionGroups[type] = reactionGroup;
      }
    }
  }
}

extension on Map<String, ReactionGroupData> {
  int get totalCount =>
      values.fold(0, (sum, reactionGroup) => sum + reactionGroup.count);
}
