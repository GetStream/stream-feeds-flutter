import 'package:stream_core/stream_core.dart';

import '../../../models/feed_member_data.dart';
import '../../../models/model_updates.dart';
import '../../../utils/filter.dart';
import '../../member_list_state.dart';

import '../../query/members_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

class MemberListEventHandler implements StateEventHandler {
  const MemberListEventHandler({
    required this.query,
    required this.state,
  });

  final MembersQuery query;
  final MemberListStateNotifier state;

  @override
  void handleEvent(StateUpdateEvent event) {
    if (event is FeedMemberAdded) {
      if (event.fid != query.fid.rawValue) return;
      // Check if the new member matches the query filter
      if (!event.member.matches(query.filter)) return;

      return state.onMemberAdded(event.member);
    }

    if (event is FeedMemberUpdated) {
      if (event.fid != query.fid.rawValue) return;

      if (!event.member.matches(query.filter)) {
        // If the updated member no longer matches the filter, remove it
        return state.onMemberRemoved(event.member.id);
      }

      return state.onMemberUpdated(event.member);
    }

    if (event is FeedMemberRemoved) {
      if (event.fid != query.fid.rawValue) return;
      return state.onMemberRemoved(event.memberId);
    }

    if (event is FeedMemberBatchUpdate) {
      if (event.fid != query.fid.rawValue) return;

      // Filter added and updated members based on the query filter
      bool matchesFilter(FeedMemberData member) => member.matches(query.filter);

      final added = event.updates.added.where(matchesFilter).toList();
      // We remove elements that used to match the filter but no longer do
      final (updated, removed) = event.updates.updated.partition(matchesFilter);

      final removedIds = event.updates.removedIds;
      removedIds.addAll(removed.map((it) => it.id));

      return state.onMembersUpdated(
        ModelUpdates(added: added, updated: updated, removedIds: removedIds),
      );
    }

    // Handle other events if needed
  }
}
