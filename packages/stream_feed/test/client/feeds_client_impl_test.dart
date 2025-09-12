import 'package:stream_feed/src/client/feeds_client_impl.dart';
import 'package:stream_feed/stream_feed.dart';
import 'package:test/test.dart';

const testToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.hZ59SWtp_zLKVV9ShkqkTsCGi_jdPHly7XNCf5T_Ev0';
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
