import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MockCdnApi extends Mock implements CdnApi {}

class MockDefaultApi extends Mock implements DefaultApi {}

class MockWebSocketSink extends Mock implements WebSocketSink {}

class MockWebSocketChannel extends Mock implements WebSocketChannel {}

UserToken generateTestUserToken(String userId) {
  String b64UrlNoPad(Object jsonObj) {
    final bytes = utf8.encode(jsonEncode(jsonObj));
    return base64Url.encode(bytes).replaceAll('=', '');
  }

  final header = {'alg': 'none', 'typ': 'JWT'};
  final payload = {'user_id': userId};

  final jwt = '${b64UrlNoPad(header)}.${b64UrlNoPad(payload)}.';
  // trailing dot = empty signature (valid for alg=none)

  return UserToken(jwt);
}
