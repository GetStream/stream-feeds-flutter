import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../stream_feeds.dart';
import '../repositories/feeds_repository.dart';
import '../utils/list_extensions.dart';
import '../ws/feeds_ws_event.dart';
import 'feed_ws_handler.dart';

class FeedStateNotifier extends StateNotifier<FeedState> {
  FeedStateNotifier({
    required FeedId fid,
    required FeedQuery query,
    required String currentUserId,
    required FeedsClient client,
  }) : super(
          FeedState(
            fid: fid,
            query: query,
            currentUserId: currentUserId,
          ),
        ) {
    wsHandler = FeedWsHandler(client: client, stateNotifier: this);
  }

  late final FeedWsHandler wsHandler;

  void didQueryFeed(GetOrCreateFeedData response) {
    state = state.copyWith(
      activities: List.unmodifiable(response.activities.items),
      pagination: response.activities.pagination,
    );
  }

  void onReactionAdded(FeedsReactionData reaction) {
    final activities = state.activities.updateFirstElement(
      (activity) => activity.id == reaction.activityId,
      (activity) => activity.addReaction(
        reaction,
        currentUserId: wsHandler.currentUserId,
      ),
    );
    state = state.copyWith(activities: activities);
  }

  void onReactionRemoved(FeedsReactionData reaction) {
    final activities = state.activities.updateFirstElement(
      (activity) => activity.id == reaction.activityId,
      (activity) => activity.removeReaction(
        reaction,
        currentUserId: wsHandler.currentUserId,
      ),
    );
    state = state.copyWith(activities: activities);
  }

  @override
  void dispose() {
    wsHandler.dispose();
    super.dispose();
  }
}

class FeedState extends Equatable {
  const FeedState({
    required this.fid,
    required this.query,
    required this.currentUserId,
    this.activities = const [],
    this.pagination,
  });

  final FeedId fid;
  final FeedQuery query;
  final String currentUserId;
  final List<ActivityData> activities;
  final PaginationData? pagination;

  @override
  List<Object?> get props => [];

  FeedState copyWith({
    List<ActivityData>? activities,
    PaginationData? pagination,
  }) {
    return FeedState(
      fid: fid,
      query: query,
      currentUserId: currentUserId,
      activities: activities ?? this.activities,
      pagination: pagination ?? this.pagination,
    );
  }
}
