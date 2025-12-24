import 'state_update_event.dart';

/// An interface for handling state events in the Stream Feeds SDK.
///
/// Implementations of this interface should define how to process different types of events.
abstract interface class StateEventHandler {
  /// Handles a given [StateUpdateEvent].
  void handleEvent(StateUpdateEvent event);
}
