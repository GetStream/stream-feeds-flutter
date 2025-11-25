import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart' as api;
import 'package:web_socket_channel/web_socket_channel.dart';

class MockDefaultApi extends Mock implements api.DefaultApi {}

class MockWebSocketChannel extends Mock implements WebSocketChannel {}

api.UserToken generateTestUserToken(String userId) {
  String b64UrlNoPad(Object jsonObj) {
    final bytes = utf8.encode(jsonEncode(jsonObj));
    return base64Url.encode(bytes).replaceAll('=', '');
  }

  final header = {'alg': 'none', 'typ': 'JWT'};
  final payload = {'user_id': userId};

  final jwt = '${b64UrlNoPad(header)}.${b64UrlNoPad(payload)}.';
  // trailing dot = empty signature (valid for alg=none)

  return api.UserToken(jwt);
}
