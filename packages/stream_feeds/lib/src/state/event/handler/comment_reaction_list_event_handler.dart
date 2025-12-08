import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/feeds_reaction_data.dart';
import '../../comment_reaction_list_state.dart';
import 'state_event_handler.dart';

/// Event handler for comment reaction list real-time updates.
///
/// Processes WebSocket events related to reactions on a specific comment
/// and updates the comment reaction list state accordingly.
class CommentReactionListEventHandler implements StateEventHandler {
  const CommentReactionListEventHandler({
    required this.state,
  });

  final CommentReactionListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.CommentReactionDeletedEvent) {
      return state.onReactionRemoved(event.reaction.toModel());
    }

    // Handle other comment reaction list events here as needed
  }
}
