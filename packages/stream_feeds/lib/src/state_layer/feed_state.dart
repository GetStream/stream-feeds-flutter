import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../stream_feeds.dart';
import '../repositories/feeds_repository.dart';

class FeedStateNotifier extends StateNotifier<FeedState> {
  FeedStateNotifier({
    required FeedId fid,
    required FeedQuery query,
    required String currentUserId,
  }) : super(
          FeedState(
            fid: fid,
            query: query,
            currentUserId: currentUserId,
          ),
        );

  void didQueryFeed(GetOrCreateFeedData response) {
    state = state.copyWith(
      activities: List.unmodifiable(response.activities.items),
      pagination: response.activities.pagination,
    );
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
