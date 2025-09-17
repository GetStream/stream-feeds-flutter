import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/poll_vote_data.dart';
import '../poll_vote_list_state.dart';
import 'state_event_handler.dart';

/// Event handler for poll vote list real-time updates.
///
/// Processes WebSocket events related to poll votes on a specific poll
/// and updates the poll vote list state accordingly.
class PollVoteListEventHandler implements StateEventHandler {
  const PollVoteListEventHandler({
    required this.pollId,
    required this.state,
  });

  final String pollId;
  final PollVoteListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.PollVoteChangedFeedEvent) {
      // Only handle votes for this specific poll
      if (event.poll.id != pollId) return;
      return state.pollVoteUpdated(event.pollVote.toModel());
    }

    if (event is api.PollVoteRemovedFeedEvent) {
      // Only handle votes for this specific poll
      if (event.poll.id != pollId) return;
      return state.pollVoteRemoved(event.pollVote.id);
    }

    // Handle other poll vote list events here as needed
  }
}
