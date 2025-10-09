import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  test('Create a feeds client', () {
    final client = StreamFeedsClient(
      apiKey: 'apiKey',
      user: const User(id: 'userId'),
      tokenProvider: TokenProvider.static(UserToken(testToken)),
    );

    expect(client, isA<StreamFeedsClientImpl>());
  });
}
