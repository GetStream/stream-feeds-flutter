import 'package:freezed_annotation/freezed_annotation.dart';

import 'comments_query.dart';

part 'activity_comments_query.freezed.dart';

/// A query for retrieving comments for a specific activity.
///
/// Configures how activity comments should be fetched including pagination
/// settings, sorting options, and depth configuration for threaded comments.
///
/// ## Example
/// ```dart
/// final query = ActivityCommentsQuery(
///   objectId: "activity123",
///   objectType: "activity",
///   sort: CommentsSort.top,
///   depth: 3,
///   limit: 25,
/// );
/// ```
@freezed
class ActivityCommentsQuery with _$ActivityCommentsQuery {
  const ActivityCommentsQuery({
    required this.objectId,
    required this.objectType,
    this.sort,
    this.depth,
    this.limit,
    this.repliesLimit,
    this.next,
    this.previous,
  });

  /// The unique identifier of the activity to fetch comments for.
  @override
  final String objectId;

  /// The type of object (typically "activity" for activity comments).
  @override
  final String objectType;

  /// The sorting criteria for comments.
  ///
  /// Available options:
  /// - `.first` - Chronological order (oldest first)
  /// - `.last` - Reverse chronological order (newest first)
  /// - `.top` - By popularity (most upvotes first)
  /// - `.best` - By quality score (best quality first)
  /// - `.controversial` - By controversy level (most controversial first)
  @override
  final CommentsSort? sort;

  /// The maximum depth of threaded comments to fetch.
  ///
  /// This parameter controls how many levels of nested replies to include.
  /// For example, a depth of 2 will include comments and their direct replies,
  /// but not replies to replies.
  ///
  /// - `null`: No depth limit (fetch all levels)
  /// - `1`: Only top-level comments
  /// - `2`: Comments and their direct replies
  /// - `3`: Comments, replies, and replies to replies
  @override
  final int? depth;

  /// The maximum number of comments to fetch per request.
  ///
  /// This parameter controls the page size for pagination. Larger values
  /// reduce the number of API calls needed but may increase response time.
  ///
  /// - `null`: Use server default (typically 25)
  /// - `10-50`: Recommended range for most use cases
  /// - `>50`: May impact performance
  @override
  final int? limit;

  /// The maximum number of replies to fetch per comment.
  ///
  /// This parameter controls how many replies are included for each comment
  /// in the response. It's useful for limiting the size of threaded comments.
  ///
  /// - `null`: Fetch all replies (subject to depth limit)
  /// - `5-10`: Recommended for most use cases
  /// - `>20`: May impact performance
  @override
  final int? repliesLimit;

  /// The pagination cursor for fetching the next page of comments.
  ///
  /// This cursor is provided by the server in the pagination response and
  /// should be used to fetch the next page of results.
  @override
  final String? next;

  /// The pagination cursor for fetching the previous page of comments.
  ///
  /// This cursor is provided by the server in the pagination response and
  /// should be used to fetch the previous page of results.
  @override
  final String? previous;
}
