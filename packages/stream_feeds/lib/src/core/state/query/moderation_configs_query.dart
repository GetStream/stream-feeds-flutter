import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
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

  /// Optional filter to apply to the moderation configs query.
  /// Use this to narrow down results based on specific criteria.
  ///
  /// Use [ModerationConfigsFilterField] for type-safe field references.
  @override
  final Filter? filter;

  /// Array of sorting criteria to apply to the moderation configs.
  @override
  final List<ModerationConfigsSort>? sort;

  /// The maximum number of moderation configs to return.
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

/// Represents a field that can be used in moderation configs filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for moderation configs queries.
extension type const ModerationConfigsFilterField(String field)
    implements String {
  /// Filter by the unique identifier of the moderation config.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const id = ModerationConfigsFilterField('id');

  /// Filter by the name of the moderation config.
  ///
  /// **Supported operators:** `.equal`, `.in`, `.q`, `.autocomplete`
  static const name = ModerationConfigsFilterField('name');

  /// Filter by whether the moderation config is active.
  ///
  /// **Supported operators:** `.equal`
  static const isActive = ModerationConfigsFilterField('is_active');

  /// Filter by the creation timestamp of the moderation config.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const createdAt = ModerationConfigsFilterField('created_at');

  /// Filter by the last update timestamp of the moderation config.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const updatedAt = ModerationConfigsFilterField('updated_at');

  /// Filter by the type of moderation config.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const type = ModerationConfigsFilterField('type');
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
extension type const ModerationConfigsSortField(
        SortField<ModerationConfigData> field)
    implements SortField<ModerationConfigData> {
  /// Sort by the unique key of the moderation config.
  ///
  /// Allows sorting configs by their key (alphabetical order).
  static final key = ModerationConfigsSortField(
    SortField('id', (data) => data.key),
  );

  /// Sort by the creation timestamp of the moderation config.
  ///
  /// Allows sorting configs by when they were created (newest/oldest first).
  static final createdAt = ModerationConfigsSortField(
    SortField('created_at', (data) => data.createdAt),
  );

  /// Sort by the update timestamp of the moderation config.
  ///
  /// Allows sorting configs by when they were last updated (newest/oldest first).
  static final updatedAt = ModerationConfigsSortField(
    SortField('updated_at', (data) => data.updatedAt),
  );
}

/// Extension for converting a [ModerationConfigsQuery] to a [api.QueryModerationConfigsRequest].
extension ModerationConfigsQueryRequest on ModerationConfigsQuery {
  /// Converts this moderation configs query to an API request format.
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
