import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
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

  /// Optional filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which polls
  /// are included in the query results based on field values and comparison operators.
  /// Use this to narrow down results based on specific criteria.
  ///
  /// Use [PollsFilterField] for type-safe field references.
  @override
  final PollsFilter? filter;

  /// Array of sorting criteria for this query.
  ///
  /// Specifies how polls should be ordered in the response.
  /// If not provided, the API will use its default sorting (typically by
  /// creation time, newest first). Multiple sort fields can be specified.
  @override
  final List<PollsSort>? sort;

  /// The maximum number of polls to return.
  /// If not specified, the API will use its default limit.
  @override
  final int? limit;

  /// The next page cursor for pagination.
  @override
  final String? next;

  /// The previous page cursor for pagination.
  @override
  final String? previous;
}

// region Filter

/// Represents filtering options for polls.
///
/// See [PollsFilterField] for available fields.
typedef PollsFilter = Filter<PollData>;

/// Represents a field that can be used in polls filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for polls queries.
class PollsFilterField extends FilterField<PollData> {
  /// Creates a new polls filter field.
  PollsFilterField(super.remote, super.value);

  /// Filter by whether the poll allows answers.
  ///
  /// **Supported operators:** `.equal`
  static final allowAnswers = PollsFilterField(
    'allow_answers',
    (data) => data.allowAnswers,
  );

  /// Filter by whether the poll allows user-suggested options.
  ///
  /// **Supported operators:** `.equal`
  static final allowUserSuggestedOptions = PollsFilterField(
    'allow_user_suggested_options',
    (data) => data.allowUserSuggestedOptions,
  );

  /// Filter by the creation timestamp of the poll.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final createdAt = PollsFilterField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Filter by the ID of the user who created the poll.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final createdById = PollsFilterField(
    'created_by_id',
    (data) => data.createdById,
  );

  /// Filter by the unique identifier of the poll.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final id = PollsFilterField(
    'id',
    (data) => data.id,
  );

  /// Filter by whether the poll is closed.
  ///
  /// **Supported operators:** `.equal`
  static final isClosed = PollsFilterField(
    'is_closed',
    (data) => data.isClosed,
  );

  /// Filter by the maximum number of votes allowed per user.
  ///
  /// **Supported operators:** `.equal`, `.notEqual`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final maxVotesAllowed = PollsFilterField(
    'max_votes_allowed',
    (data) => data.maxVotesAllowed,
  );

  /// Filter by the name of the poll.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final name = PollsFilterField(
    'name',
    (data) => data.name,
  );

  /// Filter by the last update timestamp of the poll.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final updatedAt = PollsFilterField(
    'updated_at',
    (data) => data.updatedAt,
  );

  /// Filter by the voting visibility setting of the poll.
  ///
  /// **Supported operators:** `.equal`
  static final votingVisibility = PollsFilterField(
    'voting_visibility',
    (data) => data.votingVisibility,
  );
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
class PollsSortField extends SortField<PollData> {
  /// Creates a new polls sort field.
  PollsSortField(super.remote, super.localValue);

  /// Sort by the creation timestamp of the poll.
  /// This field allows sorting polls by when they were created (newest/oldest first).
  static final createdAt = PollsSortField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Sort by the last update timestamp of the poll.
  /// This field allows sorting polls by when they were last updated (newest/oldest first).
  static final updatedAt = PollsSortField(
    'updated_at',
    (data) => data.updatedAt,
  );

  /// Sort by the number of votes the poll has received.
  /// This field allows sorting polls by popularity (most/least voted).
  static final voteCount = PollsSortField(
    'vote_count',
    (data) => data.voteCount,
  );

  /// Sort by the name of the poll.
  /// This field allows sorting polls alphabetically by name.
  static final name = PollsSortField(
    'name',
    (data) => data.name,
  );

  /// Sort by the unique identifier of the poll.
  /// This field allows sorting polls by their unique ID.
  static final id = PollsSortField(
    'id',
    (data) => data.id,
  );

  /// Sort by whether the poll is closed.
  /// This field allows sorting polls by their closed status.
  static final isClosed = PollsSortField(
    'is_closed',
    (data) => data.isClosed,
  );
}

// endregion

/// Extension for converting a [PollsQuery] to a [api.QueryPollsRequest].
extension PollsQueryRequest on PollsQuery {
  /// Converts this query to an API request format.
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
