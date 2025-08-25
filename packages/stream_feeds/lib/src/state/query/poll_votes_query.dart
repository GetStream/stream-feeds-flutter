import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/poll_vote_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'poll_votes_query.freezed.dart';

/// A query for retrieving poll votes with filtering, sorting, and pagination.
///
/// Configures how poll votes should be fetched from the Stream Feeds API
/// including filters, sorting options, and pagination parameters.
///
/// ## Example
/// ```dart
/// final query = PollVotesQuery(
///   pollId: "poll123",
///   filter: Filter.equal(PollVotesFilterField.userId, "user456"),
///   sort: [PollVotesSort.desc(PollVotesSortFielddAt)],
///   limit: 20,
/// );
/// ```
@freezed
class PollVotesQuery with _$PollVotesQuery {
  const PollVotesQuery({
    required this.pollId,
    this.userId,
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// The unique identifier of the poll to fetch votes for.
  @override
  final String pollId;

  /// Optional user ID used for authentication.
  @override
  final String? userId;

  /// Optional filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which poll votes
  /// are included in the query results based on field values and comparison operators.
  /// Use this to narrow down results based on specific criteria.
  ///
  /// Use [PollVotesFilterField] for type-safe field references.
  @override
  final Filter? filter;

  /// Array of sorting criteria for this query.
  ///
  /// Specifies how poll votes should be ordered in the response.
  /// If not provided, the API will use its default sorting (typically by
  /// creation time, newest first). Multiple sort fields can be specified.
  @override
  final List<PollVotesSort>? sort;

  /// The maximum number of poll votes to return.
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

/// Represents a field that can be used in poll votes filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for poll votes queries.
extension type const PollVotesFilterField(String field) implements String {
  /// Filter by the creation timestamp of the poll vote.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const createdAt = PollVotesFilterField('created_at');

  /// Filter by the unique identifier of the poll vote.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const id = PollVotesFilterField('id');

  /// Filter by whether the vote is an answer (true/false).
  ///
  /// **Supported operators:** `.equal`
  static const isAnswer = PollVotesFilterField('is_answer');

  /// Filter by the option ID that was voted for.
  ///
  /// **Supported operators:** `.equal`, `.in`, `.exists`
  static const optionId = PollVotesFilterField('option_id');

  /// Filter by the user ID who cast the vote.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const userId = PollVotesFilterField('user_id');

  /// Filter by the poll ID that the vote belongs to.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const pollId = PollVotesFilterField('poll_id');

  /// Filter by the last update timestamp of the poll vote.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const updatedAt = PollVotesFilterField('updated_at');
}

// endregion

// region Sort

/// Represents a sorting operation for poll votes.
class PollVotesSort extends Sort<PollVoteData> {
  const PollVotesSort.asc(
    PollVotesSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  const PollVotesSort.desc(
    PollVotesSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// The default sorting criteria for poll votes queries.
  /// Sorts by creation date in descending order (newest first).
  static final List<PollVotesSort> defaultSort = [
    PollVotesSort.desc(PollVotesSortField.createdAt),
  ];
}

/// Defines the fields by which poll votes can be sorted.
///
/// This extension type provides specific fields for sorting poll vote data.
extension type const PollVotesSortField(SortField<PollVoteData> field)
    implements SortField<PollVoteData> {
  /// Sort by the answer text of the poll option.
  /// This field allows sorting poll votes by the text content of the selected option.
  static final answerText = PollVotesSortField(
    SortField('answer_text', (data) => data.answerText ?? ''),
  );

  /// Sort by the unique identifier of the poll vote.
  /// This field allows sorting poll votes by their unique ID.
  static final id = PollVotesSortField(
    SortField('id', (data) => data.id),
  );

  /// Sort by the creation timestamp of the poll vote.
  /// This field allows sorting poll votes by when they were created (newest/oldest first).
  static final createdAt = PollVotesSortField(
    SortField('created_at', (data) => data.createdAt),
  );

  /// Sort by the last update timestamp of the poll vote.
  /// This field allows sorting poll votes by when they were last updated (newest/oldest first).
  static final updatedAt = PollVotesSortField(
    SortField('updated_at', (data) => data.updatedAt),
  );
}

// endregion

/// Extension for converting a [PollVotesQuery] to a [api.QueryPollVotesRequest].
extension PollVotesQueryRequest on PollVotesQuery {
  /// Converts this query to an API request format.
  ///
  /// Returns a [api.QueryPollVotesRequest] suitable for making API calls to retrieve poll votes.
  api.QueryPollVotesRequest toRequest() {
    return api.QueryPollVotesRequest(
      filter: filter?.toRequest(),
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
