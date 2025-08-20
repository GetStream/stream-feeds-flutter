import 'package:stream_core/stream_core.dart';

import '../../../ws/feeds_ws_event.dart';

/// An interface for handling state events in the Stream Feeds SDK.
///
/// Implementations of this interface should define how to process different types of events.
abstract interface class StateEventHandler {
  /// Handles a given [FeedsWsEvent].
  void handleEvent(WsEvent event);
}
