import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

/// Adapter that captures the outgoing request and short-circuits the network.
class _CapturingAdapter implements HttpClientAdapter {
  RequestOptions? captured;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    captured = options;
    return ResponseBody.fromString(
      '{"duration":"0ms"}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// Sends one request through the client's real interceptor chain and returns
/// the headers that would have gone over the wire.
Future<Map<String, dynamic>> _sendAndCaptureHeaders({
  Map<String, String>? customHeaders,
}) async {
  final client = StreamFeedsClientImpl(
    apiKey: 'test-api-key',
    user: const User.anonymous(),
    config: FeedsConfig(customHeaders: customHeaders),
  );
  addTearDown(client.disconnect);

  final adapter = _CapturingAdapter();
  client.httpClient.httpClientAdapter = adapter;

  await client.httpClient.get<dynamic>('/api/v2/app');

  return adapter.captured!.headers;
}

void main() {
  group('FeedsConfig.customHeaders', () {
    test('are sent on API requests', () async {
      final headers = await _sendAndCaptureHeaders(
        customHeaders: {
          'x-stream-ext': 'my-value',
          'x-tenant-id': 'tenant-1',
        },
      );

      expect(headers['x-stream-ext'], 'my-value');
      expect(headers['x-tenant-id'], 'tenant-1');
    });

    test('do not disturb the SDK managed headers', () async {
      final headers = await _sendAndCaptureHeaders(
        customHeaders: {'x-stream-ext': 'my-value'},
      );

      expect(headers['api_key'], 'test-api-key');
      expect(headers['Authorization'], isNotNull);
      expect(headers['stream-auth-type'], isNotNull);
      expect(headers['X-Stream-Client'], isNotNull);
    });

    test('cannot overwrite the SDK managed headers', () async {
      final baseline = await _sendAndCaptureHeaders();

      final headers = await _sendAndCaptureHeaders(
        customHeaders: {
          'api_key': 'hijacked',
          'Authorization': 'hijacked',
          'stream-auth-type': 'hijacked',
          'X-Stream-Client': 'hijacked',
        },
      );

      expect(headers['api_key'], baseline['api_key']);
      expect(headers['Authorization'], baseline['Authorization']);
      expect(headers['stream-auth-type'], baseline['stream-auth-type']);
      expect(headers['X-Stream-Client'], baseline['X-Stream-Client']);
      expect(headers.values, isNot(contains('hijacked')));
    });

    test('cannot overwrite the SDK managed headers in a different case', () async {
      final baseline = await _sendAndCaptureHeaders();

      final headers = await _sendAndCaptureHeaders(
        customHeaders: {
          'API_KEY': 'hijacked',
          'authorization': 'hijacked',
          'Stream-Auth-Type': 'hijacked',
          'x-stream-client': 'hijacked',
        },
      );

      expect(headers['api_key'], baseline['api_key']);
      expect(headers['Authorization'], baseline['Authorization']);
      expect(headers['stream-auth-type'], baseline['stream-auth-type']);
      expect(headers['X-Stream-Client'], baseline['X-Stream-Client']);
      expect(headers.values, isNot(contains('hijacked')));
    });

    test('are optional', () async {
      final headers = await _sendAndCaptureHeaders();

      expect(headers['api_key'], 'test-api-key');
    });
  });
}
