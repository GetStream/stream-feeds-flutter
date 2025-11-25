import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  test('Create a feeds client', () {
    const user = User(id: 'userId');
    final token = generateTestUserToken(user.id);

    final client = StreamFeedsClient(
      apiKey: 'apiKey',
      user: user,
      tokenProvider: TokenProvider.static(token),
    );

    expect(client, isA<StreamFeedsClientImpl>());
  });
}
