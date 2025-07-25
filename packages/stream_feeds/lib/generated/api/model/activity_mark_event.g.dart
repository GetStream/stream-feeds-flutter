// Code generated by GetStream internal OpenAPI code generator. DO NOT EDIT.

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: use_string_in_part_of_directives
// ignore_for_file: unnecessary_raw_strings
// ignore_for_file: unnecessary_null_in_if_null_operators
// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_single_quotes
// ignore_for_file: require_trailing_commas

part of openapi.api;

@immutable
class ActivityMarkEvent {
  const ActivityMarkEvent({
    required this.createdAt,
    required this.custom,
    required this.fid,
    this.markAllRead,
    this.markAllSeen,
    this.markRead,
    this.markWatched,
    this.receivedAt,
    required this.type,
    this.user,
  });

  final DateTime createdAt;

  final Map<String, Object> custom;

  final String fid;

  final bool? markAllRead;

  final bool? markAllSeen;

  final List<String>? markRead;

  final List<String>? markWatched;

  final DateTime? receivedAt;

  final String type;

  final UserResponseCommonFields? user;

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'custom': custom,
      'fid': fid,
      'mark_all_read': markAllRead,
      'mark_all_seen': markAllSeen,
      'mark_read': markRead,
      'mark_watched': markWatched,
      'received_at': receivedAt,
      'type': type,
      'user': user,
    };
  }

  static ActivityMarkEvent? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return ActivityMarkEvent(
        createdAt: mapValueOfType<DateTime>(json, r'created_at')!,
        custom: mapCastOfType<String, Object>(json, r'custom')!,
        fid: mapValueOfType<String>(json, r'fid')!,
        markAllRead: mapValueOfType<bool>(json, r'mark_all_read', null),
        markAllSeen: mapValueOfType<bool>(json, r'mark_all_seen', null),
        markRead: json[r'mark_read'] is Iterable
            ? (json[r'mark_read'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        markWatched: json[r'mark_watched'] is Iterable
            ? (json[r'mark_watched'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        receivedAt: mapValueOfType<DateTime>(json, r'received_at', null),
        type: mapValueOfType<String>(json, r'type', "feeds.activity.marked")!,
        user: UserResponseCommonFields.fromJson(json[r'user'] ?? null),
      );
    }
    return null;
  }

  static List<ActivityMarkEvent> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ActivityMarkEvent>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ActivityMarkEvent.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  @override
  String toString() {
    return 'ActivityMarkEvent('
        'createdAt: $createdAt, '
        'custom: $custom, '
        'fid: $fid, '
        'markAllRead: $markAllRead, '
        'markAllSeen: $markAllSeen, '
        'markRead: $markRead, '
        'markWatched: $markWatched, '
        'receivedAt: $receivedAt, '
        'type: $type, '
        'user: $user, '
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityMarkEvent &&
        other.createdAt == createdAt &&
        other.custom == custom &&
        other.fid == fid &&
        other.markAllRead == markAllRead &&
        other.markAllSeen == markAllSeen &&
        other.markRead == markRead &&
        other.markWatched == markWatched &&
        other.receivedAt == receivedAt &&
        other.type == type &&
        other.user == user;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      createdAt,
      custom,
      fid,
      markAllRead,
      markAllSeen,
      markRead,
      markWatched,
      receivedAt,
      type,
      user,
    ]);
  }
}
