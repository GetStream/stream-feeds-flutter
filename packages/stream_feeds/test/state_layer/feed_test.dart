import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  late MockFeedsRepository repository;

  setUp(() {
    repository = MockFeedsRepository();
  });

  test('Feed getOrCreate should call repository', () async {
    final query = FeedQuery(group: 'group', id: 'id');
    const responseData = GetOrCreateFeedData(
      activities: PaginationResult(
        items: [],
        pagination: PaginationData(next: 'next', previous: 'previous'),
      ),
    );

    when(() => repository.getOrCreateFeed(query))
        .thenAnswer((_) async => responseData);

    final feed = Feed(
      query: query,
      client: FakeFeedsClient(feedsRepository: repository),
    );
    await feed.getOrCreate();

    verify(() => repository.getOrCreateFeed(feed.query)).called(1);
    expect(feed.stateNotifier.state.activities, responseData.activities.items);
  });
}
