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
class FeedUpdatedEvent {
  const FeedUpdatedEvent({
    required this.createdAt,
    required this.custom,
    required this.feed,
    required this.fid,
    this.receivedAt,
    required this.type,
    this.user,
  });

  final DateTime createdAt;

  final Map<String, Object> custom;

  final FeedResponse feed;

  final String fid;

  final DateTime? receivedAt;

  final String type;

  final UserResponseCommonFields? user;

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'custom': custom,
      'feed': feed,
      'fid': fid,
      'received_at': receivedAt,
      'type': type,
      'user': user,
    };
  }

  static FeedUpdatedEvent? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return FeedUpdatedEvent(
        createdAt: mapValueOfType<DateTime>(json, r'created_at')!,
        custom: mapCastOfType<String, Object>(json, r'custom')!,
        feed: FeedResponse.fromJson(json[r'feed'])!,
        fid: mapValueOfType<String>(json, r'fid')!,
        receivedAt: mapValueOfType<DateTime>(json, r'received_at', null),
        type: mapValueOfType<String>(json, r'type', "feeds.feed.updated")!,
        user: UserResponseCommonFields.fromJson(json[r'user'] ?? null),
      );
    }
    return null;
  }

  static List<FeedUpdatedEvent> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FeedUpdatedEvent>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeedUpdatedEvent.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  @override
  String toString() {
    return 'FeedUpdatedEvent('
        'createdAt: $createdAt, '
        'custom: $custom, '
        'feed: $feed, '
        'fid: $fid, '
        'receivedAt: $receivedAt, '
        'type: $type, '
        'user: $user, '
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FeedUpdatedEvent &&
        other.createdAt == createdAt &&
        other.custom == custom &&
        other.feed == feed &&
        other.fid == fid &&
        other.receivedAt == receivedAt &&
        other.type == type &&
        other.user == user;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      createdAt,
      custom,
      feed,
      fid,
      receivedAt,
      type,
      user,
    ]);
  }
}
