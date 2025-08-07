import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Add reaction to activityData should create a new instance with updated reaction count',
      () {
    final activityData = createActivityData();

    final updatedActivityData = activityData.addReaction(
      FeedsReactionData(
        activityId: '1',
        type: 'like',
        user: const UserData(id: 'testUser'),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        customData: const {},
      ),
      currentUserId: 'testUser',
    );

    expect(updatedActivityData.reactionCount, 1);
    expect(updatedActivityData, isNot(activityData));
  });

  test(
      'Remove reaction from activityData should create a new instance with updated reaction count',
      () {
    final activityData = createActivityData(
      reactionCount: 2,
      latestReactions: [
        FeedsReactionData(
          activityId: '1',
          type: 'like',
          user: const UserData(id: 'testUser'),
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          updatedAt: DateTime.now(),
          customData: const {},
        ),
        FeedsReactionData(
          activityId: '1',
          type: 'like',
          user: const UserData(id: 'testUser2'),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          customData: const {},
        ),
      ],
      reactionGroups: {
        'like': ReactionGroupData(
          count: 2,
          firstReactionAt: DateTime.now().subtract(const Duration(days: 7)),
          lastReactionAt: DateTime.now(),
        ),
      },
    );

    expect(activityData.reactionCount, 2);
    final updatedActivityData = activityData.removeReaction(
      FeedsReactionData(
        activityId: '1',
        type: 'like',
        user: const UserData(id: 'testUser'),
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
        customData: const {},
      ),
      currentUserId: 'testUser',
    );

    expect(updatedActivityData.reactionCount, 1);
    expect(updatedActivityData, isNot(activityData));
  });
}

ActivityData createActivityData({
  String? id,
  UserData? user,
  String? text,
  int? reactionCount,
  List<FeedsReactionData>? latestReactions,
  List<FeedsReactionData>? ownReactions,
  Map<String, ReactionGroupData>? reactionGroups,
}) =>
    ActivityData(
      id: id ?? '1',
      user: user ?? const UserData(id: 'testUser'),
      text: text ?? 'test message',
      reactionCount: reactionCount ?? 0,
      latestReactions: latestReactions ?? [],
      ownReactions: ownReactions ?? [],
      reactionGroups: reactionGroups ?? {},
    );
