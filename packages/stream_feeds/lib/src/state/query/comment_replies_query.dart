import 'package:freezed_annotation/freezed_annotation.dart';

import 'comments_query.dart';

part 'comment_replies_query.freezed.dart';

/// A query for retrieving replies to a specific comment.
///
/// Configures how comment replies should be fetched including pagination
/// settings, sorting options, and depth configuration for nested reply structures.
///
/// ## Example
/// ```dart
/// final query = CommentRepliesQuery(
///   commentId: "comment123",
///   sort: CommentsSort.first,
///   depth: 2,
///   limit: 25,
/// );
/// ```
@freezed
class CommentRepliesQuery with _$CommentRepliesQuery {
  const CommentRepliesQuery({
    required this.commentId,
    this.sort,
    this.depth,
    this.limit,
    this.repliesLimit,
    this.next,
    this.previous,
  });

  /// The unique identifier of the comment to fetch replies for.
  @override
  final String commentId;

  /// The sorting criteria for replies.
  ///
  /// Available options:
  /// - `.first` - Chronological order (oldest first)
  /// - `.last` - Reverse chronological order (newest first)
  /// - `.top` - By popularity (most upvotes first)
  /// - `.best` - By quality score (best quality first)
  /// - `.controversial` - By controversy level (most controversial first)
  @override
  final CommentsSort? sort;

  /// The maximum depth of nested replies to fetch.
  ///
  /// This parameter controls how many levels of nested replies to include.
  /// For example, a depth of 2 will include replies and their direct replies,
  /// but not replies to replies to replies.
  ///
  /// - `null`: No depth limit
  /// - `1`: Only direct replies to the comment
  /// - `2`: Replies and their direct replies
  /// - `3`: Replies, replies to replies, and replies to replies to replies
  @override
  final int? depth;

  /// The maximum number of replies to fetch per request.
  ///
  /// This parameter controls the page size for pagination. Larger values
  /// reduce the number of API calls needed but may increase response time.
  ///
  /// - `null`: Use server default
  @override
  final int? limit;

  /// The maximum number of nested replies to fetch per reply.
  ///
  /// This parameter controls how many nested replies are included for each
  /// reply in the response. It's useful for limiting the size of deeply
  /// threaded reply structures.
  @override
  final int? repliesLimit;

  /// The pagination cursor for fetching the next page of replies.
  ///
  /// This cursor is provided by the server in the pagination response and
  /// should be used to fetch the next page of results.
  @override
  final String? next;

  /// The pagination cursor for fetching the previous page of replies.
  ///
  /// This cursor is provided by the server in the pagination response and
  /// should be used to fetch the previous page of results.
  @override
  final String? previous;
}
