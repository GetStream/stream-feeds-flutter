import 'package:flutter/foundation.dart';
import 'package:stream_feeds/stream_feeds.dart';

Future<void> seeWhatTheClientIsDoing() async {
  // Nothing is logged until you ask. A priority on its own writes to the console.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User(id: 'alice'),
    tokenProvider: TokenProvider.static(UserToken('<your_jwt_token>')),
    config: const FeedsConfig(
      logConfig: StreamLogConfig(priority: StreamLogPriority.debug),
    ),
  );
  await client.connect();

  // Terminal, and what a real app calls when it is done with the client for good. Use `disconnect`
  // to close the connection and keep the client.
  await client.dispose();
}

Future<void> sendRecordsSomewhereElse() async {
  // A handler of your own replaces the console.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User(id: 'alice'),
    tokenProvider: TokenProvider.static(UserToken('<your_jwt_token>')),
    config: const FeedsConfig(
      logConfig: StreamLogConfig(
        priority: StreamLogPriority.debug,
        handler: StreamLogHandler.from(reportToYourCrashReporter),
      ),
    ),
  );
  await client.connect();
  await client.dispose();
}

Future<void> keepTheConsoleAsWell() async {
  // Or compose with the one the client would have used. Naming it only under `kDebugMode` keeps a
  // console for whoever is developing without leaving one in the build your users run, while the
  // crash reporter goes on receiving records everywhere.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User(id: 'alice'),
    tokenProvider: TokenProvider.static(UserToken('<your_jwt_token>')),
    config: const FeedsConfig(
      logConfig: StreamLogConfig(
        priority: StreamLogPriority.debug,
        handler: StreamLogHandler.composite([
          if (kDebugMode) StreamLogConfig.defaultHandler,
          StreamLogHandler.from(reportToYourCrashReporter),
        ]),
      ),
    ),
  );
  await client.connect();
  await client.dispose();
}

Future<void> onlyWhileDeveloping() async {
  // `kDebugMode` is what leaves a console out of the build your users run.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User(id: 'alice'),
    tokenProvider: TokenProvider.static(UserToken('<your_jwt_token>')),
    config: const FeedsConfig(
      logConfig: StreamLogConfig(
        priority: StreamLogPriority.debug,
        handler: kDebugMode ? StreamLogConfig.defaultHandler : StreamLogHandler.silent,
      ),
    ),
  );
  await client.connect();
  await client.dispose();
}

Future<void> turnUpOneSubsystem() async {
  // Records are tagged `SF:Ws` for the connection, `SF:Http` for the requests it makes and
  // `SF:HttpAuth` for the tokens it signs them with. A filter picks out one of them, or tells this
  // SDK's records apart from another Stream SDK sharing the same handler.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User(id: 'alice'),
    tokenProvider: TokenProvider.static(UserToken('<your_jwt_token>')),
    config: const FeedsConfig(
      logConfig: StreamLogConfig(
        filter: StreamLogFilter.prefix(
          {'SF:Ws': StreamLogPriority.verbose},
          otherwise: StreamLogPriority.warning,
        ),
      ),
    ),
  );
  await client.connect();
  await client.dispose();
}

// Placeholder for wherever your app sends its diagnostics.
void reportToYourCrashReporter(StreamLogRecord record) {
  debugPrint('${record.time} ${record.priority.label}/${record.tag}: ${record.message}');
}
