import 'package:stream_core/stream_core.dart';

/// An interface for handling state events in the Stream Feeds SDK.
///
/// Implementations of this interface should define how to process different types of events.
abstract interface class StateEventHandler {
  /// Handles a given [WsEvent].
  void handleEvent(WsEvent event);
}
