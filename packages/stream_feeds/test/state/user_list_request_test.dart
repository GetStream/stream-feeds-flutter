import 'dart:convert';

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
      '{"duration":"0ms","users":[]}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// Runs [query] through `userList(...).get()` and returns the query
/// parameters of the request that would have gone over the wire.
Future<Map<String, List<String>>> _sendAndCaptureQuery(UsersQuery query) async {
  final client = StreamFeedsClientImpl(
    apiKey: 'test-api-key',
    user: const User.anonymous(),
  );
  addTearDown(client.disconnect);

  final adapter = _CapturingAdapter();
  client.httpClient.httpClientAdapter = adapter;

  await client.userList(query).get();

  return adapter.captured!.uri.queryParametersAll;
}

void main() {
  test('userList.get sends the query as one JSON payload value', () async {
    final query = await _sendAndCaptureQuery(
      UsersQuery(
        filter: Filter.equal(UsersFilterField.id, 'user-1'),
        limit: 10,
      ),
    );

    expect(query.keys.where((key) => key.startsWith('payload')), ['payload']);
    expect(query['payload'], hasLength(1));

    final payload = jsonDecode(query['payload']!.single) as Map<String, Object?>;
    expect(payload['filter_conditions'], {
      'id': {r'$eq': 'user-1'},
    });
    expect(payload['limit'], 10);
  });

  test('userList.get sends a local DateTime in the filter in UTC', () async {
    final createdAt = DateTime.utc(2026, 10, 14, 12, 30).toLocal();

    final query = await _sendAndCaptureQuery(
      UsersQuery(
        filter: Filter.greater(UsersFilterField.createdAt, createdAt),
      ),
    );

    final payload = jsonDecode(query['payload']!.single) as Map<String, Object?>;
    expect(payload['filter_conditions'], {
      'created_at': {r'$gt': '2026-10-14T12:30:00.000Z'},
    });
  });
}
