import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../models/poll_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'polls_query.freezed.dart';

/// A query for retrieving polls with filtering, sorting, and pagination.
///
/// Configures how polls should be fetched from the Stream Feeds API
/// including filters, sorting options, and pagination parameters.
///
/// ## Example
/// ```dart
/// final query = PollsQuery(
///   filter: Filter.equal(PollsFilterField.isClosed, false),
///   sort: [PollsSort.desc(PollsSortFielddAt)],
///   limit: 20,
/// );
/// ```
@freezed
class PollsQuery with _$PollsQuery {
  const PollsQuery({
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// Optional filter to apply to the polls query.
  /// Use this to narrow down results based on specific criteria.
  ///
  /// Use [PollsFilterField] for type-safe field references.
  @override
  final Filter? filter;

  /// Array of sorting criteria to apply to the polls.
  /// If not specified, the API will use its default sorting.
  @override
  final List<PollsSort>? sort;

  /// The maximum number of polls to return.
  /// If not specified, the API will use its default limit.
  @override
  final int? limit;

  /// The next page cursor for pagination.
  /// This is typically provided in the response of a previous request.
  @override
  final String? next;

  /// The previous page cursor for pagination.
  /// This is typically provided in the response of a previous request.
  @override
  final String? previous;
}

// region Filter

/// Represents a field that can be used in polls filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for polls queries.
extension type const PollsFilterField(String field) implements String {
  /// Filter by whether the poll allows answers.
  ///
  /// **Supported operators:** `.equal`
  static const allowAnswers = PollsFilterField('allow_answers');

  /// Filter by whether the poll allows user-suggested options.
  ///
  /// **Supported operators:** `.equal`
  static const allowUserSuggestedOptions =
      PollsFilterField('allow_user_suggested_options');

  /// Filter by the creation timestamp of the poll.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const createdAt = PollsFilterField('created_at');

  /// Filter by the ID of the user who created the poll.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const createdById = PollsFilterField('created_by_id');

  /// Filter by the unique identifier of the poll.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const id = PollsFilterField('id');

  /// Filter by whether the poll is closed.
  ///
  /// **Supported operators:** `.equal`
  static const isClosed = PollsFilterField('is_closed');

  /// Filter by the maximum number of votes allowed per user.
  ///
  /// **Supported operators:** `.equal`, `.notEqual`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const maxVotesAllowed = PollsFilterField('max_votes_allowed');

  /// Filter by the name of the poll.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const name = PollsFilterField('name');

  /// Filter by the last update timestamp of the poll.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const updatedAt = PollsFilterField('updated_at');

  /// Filter by the voting visibility setting of the poll.
  ///
  /// **Supported operators:** `.equal`
  static const votingVisibility = PollsFilterField('voting_visibility');
}

// endregion

// region Sort

/// Represents a sorting operation for polls.
class PollsSort extends Sort<PollData> {
  const PollsSort.asc(
    PollsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  const PollsSort.desc(
    PollsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// The default sorting criteria for polls queries.
  /// Sorts by creation date in descending order (newest first).
  static final List<PollsSort> defaultSort = [
    PollsSort.desc(PollsSortField.createdAt),
  ];
}

/// Defines the fields by which polls can be sorted.
///
/// This extension type provides specific fields for sorting poll data.
extension type const PollsSortField(SortField<PollData> field)
    implements SortField<PollData> {
  /// Sort by the creation timestamp of the poll.
  /// This field allows sorting polls by when they were created (newest/oldest first).
  static final createdAt = PollsSortField(
    SortField('created_at', (data) => data.createdAt),
  );

  /// Sort by the last update timestamp of the poll.
  /// This field allows sorting polls by when they were last updated (newest/oldest first).
  static final updatedAt = PollsSortField(
    SortField('updated_at', (data) => data.updatedAt),
  );

  /// Sort by the number of votes the poll has received.
  /// This field allows sorting polls by popularity (most/least voted).
  static final voteCount = PollsSortField(
    SortField('vote_count', (data) => data.voteCount),
  );

  /// Sort by the name of the poll.
  /// This field allows sorting polls alphabetically by name.
  static final name = PollsSortField(
    SortField('name', (data) => data.name),
  );

  /// Sort by the unique identifier of the poll.
  /// This field allows sorting polls by their unique ID.
  static final id = PollsSortField(
    SortField('id', (data) => data.id),
  );

  /// Sort by whether the poll is closed.
  /// This field allows sorting polls by their closed status.
  static final isClosed = PollsSortField(
    SortField('is_closed', (data) => data.isClosed ? 1 : 0),
  );
}

// endregion

/// Extension for converting a [PollsQuery] to a [api.QueryPollsRequest].
extension PollsQueryRequest on PollsQuery {
  /// Converts this polls query to an API request format.
  ///
  /// Returns a [api.QueryPollsRequest] suitable for making API calls to retrieve polls.
  api.QueryPollsRequest toRequest() {
    return api.QueryPollsRequest(
      filter: filter?.toRequest(),
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
