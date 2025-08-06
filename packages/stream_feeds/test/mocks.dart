import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/repositories/feeds_repository.dart';
import 'package:stream_feeds/src/ws/feeds_ws_event.dart';
import 'package:stream_feeds/stream_feeds.dart';

class MockFeedsRepository extends Mock implements FeedsRepository {}

class MockFeedsClient extends Mock implements FeedsClient {}

class FakeFeedsClient extends Fake implements FeedsClient {
  FakeFeedsClient({
    User? user,
    FeedsRepository? feedsRepository,
  })  : user = user ?? fakeUser,
        feedsRepository = feedsRepository ?? MockFeedsRepository();

  @override
  final User user;

  @override
  final FeedsRepository feedsRepository;

  @override
  final Stream<FeedsWsEvent> feedsEvents = const Stream.empty();
}

const fakeUser = User(
  id: 'user_id',
  name: 'user_name',
);
