import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/src/repository/feeds_repository.dart';
import 'package:stream_feeds/stream_feeds.dart';

class MockFeedsRepository extends Mock implements FeedsRepository {}

class MockFeedsClient extends Mock implements StreamFeedsClient {}

class MockWebSocketClient extends Mock implements StreamWebSocketClient {}

class FakeFeedsClient extends Fake implements StreamFeedsClientImpl {
  FakeFeedsClient({
    User? user,
  }) : user = user ?? fakeUser;

  @override
  final User user;

  @override
  final EventEmitter events = MutableEventEmitter();
}

const fakeUser = User(
  id: 'user_id',
  name: 'user_name',
);
