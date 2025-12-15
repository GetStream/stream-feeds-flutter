import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/feed_member_data.dart';
import '../../../utils/filter.dart';
import '../../member_list_state.dart';

import '../../query/members_query.dart';
import 'state_event_handler.dart';

class MemberListEventHandler implements StateEventHandler {
  const MemberListEventHandler({
    required this.query,
    required this.state,
  });

  final MembersQuery query;
  final MemberListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    final fid = query.fid;

    if (event is api.FeedMemberAddedEvent) {
      if (event.fid != fid.rawValue) return;
      final member = event.member.toModel();
      // Check if the new member matches the query filter
      if (!member.matches(query.filter)) return;

      return state.onMemberAdded(member);
    }

    if (event is api.FeedMemberUpdatedEvent) {
      if (event.fid != fid.rawValue) return;

      final member = event.member.toModel();
      if (!member.matches(query.filter)) {
        // If the updated member no longer matches the filter, remove it
        return state.onMemberRemoved(member.id);
      }

      return state.onMemberUpdated(member);
    }

    if (event is api.FeedMemberRemovedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onMemberRemoved(event.memberId);
    }

    // Handle other events if needed
  }
}
