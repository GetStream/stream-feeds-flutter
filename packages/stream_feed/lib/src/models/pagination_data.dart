import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';

part 'pagination_data.freezed.dart';

/// Pagination information for a paginated response.
///
/// Contains next and previous page cursors for navigating through
/// paginated results from the Stream Feeds API.
@freezed
class PaginationData with _$PaginationData {
  /// Creates a new [PaginationData] instance.
  const PaginationData({
    this.next,
    this.previous,
  });

  /// An empty pagination data instance, indicating no next or previous pages.
  static const empty = PaginationData();

  /// The cursor for the next page, if available (more results available).
  @override
  final String? next;

  /// The cursor for the previous page, if available (more results available).
  @override
  final String? previous;
}

/// Data class representing a paginated result containing a list of items and pagination data.
///
/// This generic class wraps a list of items along with pagination information,
/// providing a complete paginated response structure for API results.
///
/// The [T] parameter represents the type of items in the paginated list.
@freezed
class PaginationResult<T> with _$PaginationResult<T> {
  const PaginationResult({
    required this.items,
    required this.pagination,
  });

  /// The list of items in the paginated result.
  @override
  final List<T> items;

  /// The pagination data for the result.
  @override
  final PaginationData pagination;
}

/// Extension function to convert a [PagerResponse] to a [PaginationData] model.
extension PagerResponseMapper on PagerResponse {
  /// Converts this API pager response to a domain [PaginationData] instance.
  ///
  /// Returns a [PaginationData] instance containing the next and previous cursors
  /// from the API response.
  PaginationData toModel() => PaginationData(next: next, previous: prev);
}
