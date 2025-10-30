import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/moderation_config_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'moderation_configs_query.freezed.dart';

/// A query for retrieving moderation configs with filtering, sorting, and pagination.
///
/// Configures how moderation configs should be fetched from the Stream Feeds API
/// including filters, sorting options, and pagination parameters.
///
/// ## Example
/// ```dart
/// final query = ModerationConfigsQuery(
///   filter: Filter.equal(ModerationConfigsFilterField.isActive, true),
///   limit: 20,
/// );
/// ```
@freezed
class ModerationConfigsQuery with _$ModerationConfigsQuery {
  const ModerationConfigsQuery({
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// Optional filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which moderation configs
  /// are included in the query results based on field values and comparison operators.
  /// Use this to narrow down results based on specific criteria.
  ///
  /// Use [ModerationConfigsFilterField] for type-safe field references.
  @override
  final ModerationConfigsFilter? filter;

  /// Array of sorting criteria for this query.
  ///
  /// Specifies how moderation configs should be ordered in the response.
  /// If not provided, the API will use its default sorting (typically by
  /// creation time, newest first). Multiple sort fields can be specified.
  @override
  final List<ModerationConfigsSort>? sort;

  /// The maximum number of moderation configs to return.
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

/// Represents filtering options for moderation configs.
///
/// See [ModerationConfigsFilterField] for available fields to filter on.
typedef ModerationConfigsFilter = Filter<ModerationConfigData>;

/// Represents a field that can be used in moderation configs filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for moderation configs queries.
class ModerationConfigsFilterField extends FilterField<ModerationConfigData> {
  /// Creates a new moderation configs filter field.
  ModerationConfigsFilterField(super.remote, super.value);

  /// Filter by the unique key of the moderation config.
  ///
  /// **Supported operators:** `.equal`, `.in`, `autocomplete`
  static final key = ModerationConfigsFilterField(
    'key',
    (data) => data.key,
  );

  /// Filter by the creation timestamp of the moderation config.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final createdAt = ModerationConfigsFilterField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Filter by the last update timestamp of the moderation config.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final updatedAt = ModerationConfigsFilterField(
    'updated_at',
    (data) => data.updatedAt,
  );

  /// Filter by the team associated with the configuration.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final team = ModerationConfigsFilterField(
    'team',
    (data) => data.team,
  );
}

// endregion

// region Sort

/// Represents a sorting operation for moderation configs.
class ModerationConfigsSort extends Sort<ModerationConfigData> {
  const ModerationConfigsSort.asc(
    ModerationConfigsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  const ModerationConfigsSort.desc(
    ModerationConfigsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// The default sorting criteria for moderation configs queries.
  ///
  /// Sorts feeds by creation date in descending order (newest first).
  static final List<ModerationConfigsSort> defaultSort = [
    ModerationConfigsSort.desc(ModerationConfigsSortField.createdAt),
  ];
}

/// Defines the fields by which moderation configs can be sorted.
///
/// This extension type implements [SortField] and provides specific fields for
/// sorting moderation configs data.
///
/// Each field corresponds to a property of the [ModerationConfigData] model, allowing for
/// flexible sorting options when querying moderation configs.
class ModerationConfigsSortField extends SortField<ModerationConfigData> {
  /// Creates a new moderation configs sort field.
  ModerationConfigsSortField(super.remote, super.localValue);

  /// Sort by the unique key of the moderation config.
  ///
  /// Allows sorting configs by their key (alphabetical order).
  static final key = ModerationConfigsSortField(
    'id',
    (data) => data.key,
  );

  /// Sort by the creation timestamp of the moderation config.
  ///
  /// Allows sorting configs by when they were created (newest/oldest first).
  static final createdAt = ModerationConfigsSortField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Sort by the update timestamp of the moderation config.
  ///
  /// Allows sorting configs by when they were last updated (newest/oldest first).
  static final updatedAt = ModerationConfigsSortField(
    'updated_at',
    (data) => data.updatedAt,
  );
}

/// Extension for converting a [ModerationConfigsQuery] to a [api.QueryModerationConfigsRequest].
extension ModerationConfigsQueryRequest on ModerationConfigsQuery {
  /// Converts this query to an API request format.
  ///
  /// Returns a [api.QueryModerationConfigsRequest] suitable for making API calls to retrieve moderation configs.
  api.QueryModerationConfigsRequest toRequest() {
    return api.QueryModerationConfigsRequest(
      filter: filter?.toRequest(),
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
