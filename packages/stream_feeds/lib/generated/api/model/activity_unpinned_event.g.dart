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
class ActivityUnpinnedEvent {
  const ActivityUnpinnedEvent({
    required this.createdAt,
    required this.custom,
    required this.fid,
    required this.pinnedActivity,
    this.receivedAt,
    required this.type,
    this.user,
  });

  final DateTime createdAt;

  final Map<String, Object> custom;

  final String fid;

  final PinActivityResponse pinnedActivity;

  final DateTime? receivedAt;

  final String type;

  final UserResponseCommonFields? user;

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'custom': custom,
      'fid': fid,
      'pinned_activity': pinnedActivity,
      'received_at': receivedAt,
      'type': type,
      'user': user,
    };
  }

  static ActivityUnpinnedEvent? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return ActivityUnpinnedEvent(
        createdAt: mapValueOfType<DateTime>(json, r'created_at')!,
        custom: mapCastOfType<String, Object>(json, r'custom')!,
        fid: mapValueOfType<String>(json, r'fid')!,
        pinnedActivity: PinActivityResponse.fromJson(json[r'pinned_activity'])!,
        receivedAt: mapValueOfType<DateTime>(json, r'received_at', null),
        type: mapValueOfType<String>(json, r'type', "feeds.activity.unpinned")!,
        user: UserResponseCommonFields.fromJson(json[r'user'] ?? null),
      );
    }
    return null;
  }

  static List<ActivityUnpinnedEvent> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ActivityUnpinnedEvent>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ActivityUnpinnedEvent.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  @override
  String toString() {
    return 'ActivityUnpinnedEvent('
        'createdAt: $createdAt, '
        'custom: $custom, '
        'fid: $fid, '
        'pinnedActivity: $pinnedActivity, '
        'receivedAt: $receivedAt, '
        'type: $type, '
        'user: $user, '
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityUnpinnedEvent &&
        other.createdAt == createdAt &&
        other.custom == custom &&
        other.fid == fid &&
        other.pinnedActivity == pinnedActivity &&
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
      pinnedActivity,
      receivedAt,
      type,
      user,
    ]);
  }
}
