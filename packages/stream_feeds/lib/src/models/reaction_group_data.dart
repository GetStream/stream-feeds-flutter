class ReactionGroupData {
  const ReactionGroupData({
    required this.count,
    required this.firstReactionAt,
    required this.lastReactionAt,
  });

  bool get isEmpty => count <= 0;
  final int count;
  final DateTime firstReactionAt;
  final DateTime lastReactionAt;

  ReactionGroupData increment(DateTime reactionCreatedAt) {
    if (!reactionCreatedAt.isAfter(lastReactionAt)) return this;

    return ReactionGroupData(
      count: count + 1,
      firstReactionAt: firstReactionAt,
      lastReactionAt: reactionCreatedAt,
    );
  }

  ReactionGroupData decrement(DateTime reactionCreatedAt) {
    if (reactionCreatedAt.isBefore(firstReactionAt) ||
        reactionCreatedAt.isAfter(lastReactionAt) ||
        count == 0) {
      return this;
    }

    return ReactionGroupData(
      count: count - 1,
      firstReactionAt: firstReactionAt,
      lastReactionAt: lastReactionAt,
    );
  }
}
