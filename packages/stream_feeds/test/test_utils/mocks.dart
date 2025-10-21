import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/src/repository/feeds_repository.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds/stream_feeds.dart' as api;
import 'package:web_socket_channel/web_socket_channel.dart';

class MockFeedsRepository extends Mock implements FeedsRepository {}

class MockFeedsClient extends Mock implements StreamFeedsClient {}

class MockWebSocketClient extends Mock implements StreamWebSocketClient {}

class MockDefaultApi extends Mock implements api.DefaultApi {}

class MockWebSocketChannel extends Mock implements WebSocketChannel {}

class MockWebSocketSink extends Mock implements WebSocketSink {}

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

const testToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.hZ59SWtp_zLKVV9ShkqkTsCGi_jdPHly7XNCf5T_Ev0';
