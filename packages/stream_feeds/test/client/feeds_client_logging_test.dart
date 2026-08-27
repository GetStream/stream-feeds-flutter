import 'dart:async';

import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

/// Keeps every record, so a test can see what the client reported.
final class _RecordingLogHandler extends StreamLogHandler {
  final records = <StreamLogRecord>[];

  Iterable<String> get tags => records.map((it) => it.tag);

  Iterable<String> get messages => records.map((it) => it.message);

  @override
  void handle(StreamLogRecord record) => records.add(record);
}

StreamFeedsClient _client({StreamLogConfig? logConfig}) {
  return StreamFeedsClient(
    apiKey: 'apiKey',
    user: const User(id: 'luke_skywalker'),
    tokenProvider: TokenProvider.static(generateTestUserToken('luke_skywalker')),
    config: FeedsConfig(logConfig: logConfig),
  );
}

List<String> capturePrints(void Function() body) {
  final lines = <String>[];
  runZoned(body, zoneSpecification: ZoneSpecification(print: (_, _, _, String l) => lines.add(l)));
  return lines;
}

void main() {
  group('logging', () {
    final handler = _RecordingLogHandler();

    feedsClientTest(
      'reports what the client does under its own tags',
      connect: (tester) => tester.mockSuccessfulAuth(tester.user.id),
      setUp: (_) {
        handler.records.clear();
        StreamLogger.handler = handler;
        StreamLogger.priority = StreamLogPriority.verbose;
      },
      tearDown: (_) => StreamLogger.reset(),
      body: (tester) async {
        await tester.client.connect();
        addTearDown(tester.client.disconnect);

        // An app running two Stream SDKs shares one handler, so every record this client
        // produces has to say which SDK it came from.
        expect(handler.tags, isNotEmpty);
        expect(handler.tags, everyElement(startsWith('SF:')));
      },
    );

    feedsClientTest(
      'writes nothing when no handler is installed',
      connect: (tester) => tester.mockSuccessfulAuth(tester.user.id),
      body: (tester) async {
        final printed = <String>[];
        await runZoned(
          () async {
            await tester.client.connect();
            addTearDown(tester.client.disconnect);
          },
          zoneSpecification: ZoneSpecification(print: (_, _, _, String line) => printed.add(line)),
        );

        expect(printed, isEmpty);
      },
    );

    test('installs the handler and priority the app asked for', () {
      final mine = _RecordingLogHandler();
      addTearDown(StreamLogger.reset);

      addTearDown(
        _client(
          logConfig: StreamLogConfig(priority: StreamLogPriority.debug, handler: mine),
        ).dispose,
      );

      // What the client is answerable for is the installation; the records themselves come from
      // the components, which report under their own tags.
      const StreamLogger('SF:Probe').d(() => 'reached the handler the app passed');

      expect(mine.messages, ['reached the handler the app passed']);
    });

    test('leaves the logger alone when the app configured no logging', () {
      final installed = _RecordingLogHandler();
      StreamLogger.handler = installed;
      StreamLogger.priority = StreamLogPriority.verbose;
      addTearDown(StreamLogger.reset);

      addTearDown(_client().dispose);

      const StreamLogger('SV:Call').d(() => 'another SDK, still heard');

      // Constructing a client must not decide logging for the app, or for an SDK beside it.
      expect(installed.messages, ['another SDK, still heard']);
    });

    test('keeps writing to the console when an app composes with the default handler', () {
      final mine = _RecordingLogHandler();
      addTearDown(
        _client(
          logConfig: StreamLogConfig(
            priority: StreamLogPriority.debug,
            handler: StreamLogHandler.composite([
              StreamLogConfig.defaultHandler,
              mine,
            ]),
          ),
        ).dispose,
      );

      final printed = capturePrints(() => const StreamLogger('SF:Probe').d(() => 'to both'));

      // Naming a handler of your own should not cost you the one the client would have used.
      expect(printed.single, contains('to both'));
      expect(mine.messages, ['to both']);
    });
  });
}
