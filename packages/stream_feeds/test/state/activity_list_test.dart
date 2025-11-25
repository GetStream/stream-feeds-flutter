import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('Local filtering with real-time events', () {
    final defaultActivities = [
      createDefaultActivityResponse(id: 'activity-1'),
      createDefaultActivityResponse(id: 'activity-2'),
      createDefaultActivityResponse(id: 'activity-3'),
    ];

    activityListTest(
      'ActivityUpdatedEvent - should remove activity when updated to non-matching type',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.type, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(id: 'activity-1')
                .copyWith(type: 'comment'),
          ),
        );

        await tester.pump();
        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'ActivityReactionAddedEvent - should remove activity when reaction causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.type, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityReactionAddedEvent(
            type: EventTypes.activityReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(id: 'activity-2')
                .copyWith(type: 'comment'),
            reaction: FeedsReactionResponse(
              activityId: 'activity-2',
              type: 'like',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(),
            ),
          ),
        );

        await tester.pump();
        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'ActivityReactionDeletedEvent - should remove activity when reaction deletion causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.type, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityReactionDeletedEvent(
            type: EventTypes.activityReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(id: 'activity-3')
                .copyWith(type: 'share'),
            reaction: FeedsReactionResponse(
              activityId: 'activity-3',
              type: 'like',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(),
            ),
          ),
        );

        await tester.pump();
        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'BookmarkAddedEvent - should remove activity when bookmark causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.type, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          BookmarkAddedEvent(
            type: EventTypes.bookmarkAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              activityId: 'activity-1',
            ).copyWith(
              activity: createDefaultActivityResponse(id: 'activity-1')
                  .copyWith(type: 'comment'),
            ),
          ),
        );

        await tester.pump();
        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'BookmarkDeletedEvent - should remove activity when bookmark deletion causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.type, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          BookmarkDeletedEvent(
            type: EventTypes.bookmarkDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              activityId: 'activity-2',
            ).copyWith(
              activity: createDefaultActivityResponse(id: 'activity-2')
                  .copyWith(type: 'share'),
            ),
          ),
        );

        await tester.pump();
        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'CommentAddedEvent - should remove activity when comment causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.type, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(id: 'activity-3')
                .copyWith(type: 'comment'),
            comment: createDefaultCommentResponse(
              objectId: 'activity-3',
            ),
          ),
        );

        await tester.pump();
        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'Complex filter with AND - should filter correctly',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.and([
            Filter.equal(ActivitiesFilterField.type, 'post'),
            Filter.equal(ActivitiesFilterField.filterTags, ['featured']),
          ]),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(id: 'activity-1').copyWith(
              type: 'post', // Matches first condition
              filterTags: ['general'], // Doesn't match second condition
            ),
          ),
        );

        await tester.pump();
        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'Complex filter with OR - should only keep activities matching any condition',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.or([
            Filter.equal(ActivitiesFilterField.type, 'post'),
            Filter.equal(ActivitiesFilterField.filterTags, ['featured']),
          ]),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(id: 'activity-1').copyWith(
              type: 'post', // Matches first condition
              filterTags: ['general'], // Doesn't match second condition
            ),
          ),
        );

        await tester.pump();
        expect(tester.activityListState.activities, hasLength(3));

        final updatedActivity = tester.activityListState.activities.firstWhere(
          (activity) => activity.id == 'activity-1',
        );

        expect(updatedActivity.filterTags, ['general']);
      },
    );

    activityListTest(
      'No filter - filtering is disabled when no filter specified',
      build: (client) => client.activityList(const ActivitiesQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(id: 'activity-1')
                .copyWith(type: 'share'),
          ),
        );

        await tester.pump();
        expect(tester.activityListState.activities, hasLength(3));
      },
    );
  });

  // ============================================================
  // FEATURE: Activity Feedback
  // ============================================================

  group('Activity feedback', () {
    const activityId = 'activity-1';

    activityListTest(
      'marks activity hidden on ActivityFeedbackEvent',
      build: (client) => client.activityList(const ActivitiesQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId),
          ],
        ),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.hidden, false);

        await tester.emitEvent(
          ActivityFeedbackEvent(
            type: EventTypes.activityFeedback,
            createdAt: DateTime.timestamp(),
            custom: const {},
            activityFeedback: ActivityFeedbackEventPayload(
              activityId: activityId,
              action: ActivityFeedbackEventPayloadAction.hide,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: 'luke_skywalker'),
              value: 'true',
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.hidden, true);
      },
    );

    activityListTest(
      'marks activity unhidden on ActivityFeedbackEvent',
      build: (client) => client.activityList(const ActivitiesQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId, hidden: true),
          ],
        ),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.hidden, true);

        await tester.emitEvent(
          ActivityFeedbackEvent(
            type: EventTypes.activityFeedback,
            createdAt: DateTime.timestamp(),
            custom: const {},
            activityFeedback: ActivityFeedbackEventPayload(
              activityId: activityId,
              action: ActivityFeedbackEventPayloadAction.hide,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: 'luke_skywalker'),
              value: 'false',
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.hidden, false);
      },
    );
  });
}
