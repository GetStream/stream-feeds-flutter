import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import 'query/comment_reactions_query.dart';

part 'comment_reaction_list_state.freezed.dart';

/// Manages the state of a comment reaction list and handles state updates.
///
/// Provides methods to update the comment reaction list state in response to data changes
/// and real-time events from the Stream Feeds API.
class CommentReactionListStateNotifier
    extends StateNotifier<CommentReactionListState> {
  CommentReactionListStateNotifier({
    required CommentReactionListState initialState,
  }) : super(initialState);

  QueryConfiguration<FeedsReactionData>? _queryConfig;
  List<Sort<FeedsReactionData>> get reactionSort {
    return _queryConfig?.sort ?? CommentReactionsSort.defaultSort;
  }

  /// Handles the result of a query for more reactions.
  void onQueryMoreReactions(
    PaginationResult<FeedsReactionData> result,
    QueryConfiguration<FeedsReactionData> queryConfig,
  ) {
    _queryConfig = queryConfig;

    // Merge the new reactions with the existing ones (keeping the sort order)
    final updatedReactions = state.reactions.merge(
      result.items,
      key: (it) => it.id,
      compare: reactionSort.compare,
    );

    state = state.copyWith(
      reactions: updatedReactions,
      pagination: result.pagination,
    );
  }

  /// Handles the deletion of the comment.
  void onCommentDeleted() {
    state = state.copyWith(
      reactions: [], // Clear all reactions when the comment is deleted
      pagination: null,
    );
  }

  /// Handles the addition or update of a reaction.
  void onReactionUpserted(
    FeedsReactionData reaction, {
    bool enforceUnique = false,
  }) {
    final updatedReactions = state.reactions.upsertReaction(
      reaction,
      enforceUnique: enforceUnique,
      compare: reactionSort.compare,
    );

    state = state.copyWith(reactions: updatedReactions);
  }

  /// Handles the removal of a reaction.
  void onReactionRemoved(FeedsReactionData reaction) {
    final updatedReactions = state.reactions.where((it) {
      return it.id != reaction.id;
    }).toList();

    state = state.copyWith(reactions: updatedReactions);
  }
}

/// An observable state object that manages the current state of a comment reaction list.
///
/// Maintains the current list of comment reactions and pagination information for
/// efficient loading and navigation through comment reaction collections.
@freezed
class CommentReactionListState with _$CommentReactionListState {
  const CommentReactionListState({
    this.reactions = const [],
    this.pagination,
  });

  /// All the paginated comment reactions currently loaded.
  ///
  /// This list contains all reactions that have been fetched across multiple
  /// pagination requests. The reactions are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<FeedsReactionData> reactions;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of comment reactions.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more reactions available to load.
  bool get canLoadMore => pagination?.next != null;
}
