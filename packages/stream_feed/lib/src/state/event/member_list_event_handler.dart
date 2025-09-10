import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/feed_id.dart';
import '../../models/feed_member_data.dart';
import '../member_list_state.dart';

import 'state_event_handler.dart';

class MemberListEventHandler implements StateEventHandler {
  const MemberListEventHandler({
    required this.fid,
    required this.state,
  });

  final FeedId fid;
  final MemberListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.FeedMemberRemovedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onMemberRemoved(event.memberId);
    }

    if (event is api.FeedMemberUpdatedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onMemberUpdated(event.member.toModel());
    }

    // Handle other events if needed
  }
}
