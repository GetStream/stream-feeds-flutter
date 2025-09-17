import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

part 'query_configuration.freezed.dart';

/// Query configuration with filter and sort operations.
///
/// Contains a [Filter] and list of [Sort] operations for constructing
/// database queries in the Stream Feeds system.
@freezed
@internal
class QueryConfiguration<S extends Sort, F extends FilterField>
    with _$QueryConfiguration {
  /// Creates a new [QueryConfiguration] instance.
  const QueryConfiguration({
    this.filter,
    this.sort,
  });

  /// The filter for the query.
  @override
  final Filter<F>? filter;

  /// The list of sorting operations for the query.
  @override
  final List<S>? sort;
}
