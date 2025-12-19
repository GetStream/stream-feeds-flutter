import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';

part 'mark_activity_data.freezed.dart';

/// Data representing an activity mark operation in the Stream Feeds system.
///
/// This model contains information about what activities or feeds have been
/// marked as read, seen, or watched by a user.
@freezed
class MarkActivityData with _$MarkActivityData {
  /// Creates a new [MarkActivityData] instance.
  const MarkActivityData({
    required this.fid,
    this.markAllRead,
    this.markAllSeen,
    this.markRead,
    this.markSeen,
    this.markWatched,
  });

  /// The feed identifier where the mark operation was performed.
  @override
  final String fid;

  /// Whether all activities in the feed should be marked as read.
  @override
  final bool? markAllRead;

  /// Whether all activities in the feed should be marked as seen.
  @override
  final bool? markAllSeen;

  /// List of specific activity IDs that should be marked as read.
  @override
  final List<String>? markRead;

  /// List of specific activity IDs that should be marked as seen.
  @override
  final List<String>? markSeen;

  /// List of specific activity IDs that should be marked as watched.
  @override
  final List<String>? markWatched;
}

extension MarkActivityDataHandler on MarkActivityData {
  R handle<R>({
    R Function()? markAllRead,
    R Function()? markAllSeen,
    R Function(Set<String> read)? markRead,
    R Function(Set<String> seen)? markSeen,
    R Function(Set<String> watched)? markWatched,
    required R Function(MarkActivityData data) orElse,
  }) {
    if (this.markAllRead case true) {
      return markAllRead?.call() ?? orElse(this);
    }

    if (this.markAllSeen case true) {
      return markAllSeen?.call() ?? orElse(this);
    }

    if (this.markRead case final read?) {
      return markRead?.call(read.toSet()) ?? orElse(this);
    }

    if (this.markSeen case final seen?) {
      return markSeen?.call(seen.toSet()) ?? orElse(this);
    }

    if (this.markWatched case final watched?) {
      return markWatched?.call(watched.toSet()) ?? orElse(this);
    }

    return orElse(this);
  }
}

/// Extension function to convert an [ActivityMarkEvent] to a [MarkActivityData] model.
extension ActivityMarkEventMapper on ActivityMarkEvent {
  /// Converts this API activity mark event to a domain [MarkActivityData] instance.
  ///
  /// This conversion is used when receiving WebSocket events about activity mark
  /// operations, transforming the API event format into the application's domain model.
  MarkActivityData toModel() {
    return MarkActivityData(
      fid: fid,
      markAllRead: markAllRead,
      markAllSeen: markAllSeen,
      markRead: markRead,
      markSeen: markSeen,
      markWatched: markWatched,
    );
  }
}
