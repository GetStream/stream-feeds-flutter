// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationStatusResponse {
  DateTime? get lastReadAt;
  DateTime? get lastSeenAt;
  List<String>? get readActivities;
  List<String>? get seenActivities;
  int get unread;
  int get unseen;

  /// Create a copy of NotificationStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationStatusResponseCopyWith<NotificationStatusResponse>
      get copyWith =>
          _$NotificationStatusResponseCopyWithImpl<NotificationStatusResponse>(
              this as NotificationStatusResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationStatusResponse &&
            (identical(other.lastReadAt, lastReadAt) ||
                other.lastReadAt == lastReadAt) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt) &&
            const DeepCollectionEquality()
                .equals(other.readActivities, readActivities) &&
            const DeepCollectionEquality()
                .equals(other.seenActivities, seenActivities) &&
            (identical(other.unread, unread) || other.unread == unread) &&
            (identical(other.unseen, unseen) || other.unseen == unseen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastReadAt,
      lastSeenAt,
      const DeepCollectionEquality().hash(readActivities),
      const DeepCollectionEquality().hash(seenActivities),
      unread,
      unseen);

  @override
  String toString() {
    return 'NotificationStatusResponse(lastReadAt: $lastReadAt, lastSeenAt: $lastSeenAt, readActivities: $readActivities, seenActivities: $seenActivities, unread: $unread, unseen: $unseen)';
  }
}

/// @nodoc
abstract mixin class $NotificationStatusResponseCopyWith<$Res> {
  factory $NotificationStatusResponseCopyWith(NotificationStatusResponse value,
          $Res Function(NotificationStatusResponse) _then) =
      _$NotificationStatusResponseCopyWithImpl;
  @useResult
  $Res call(
      {DateTime? lastReadAt,
      DateTime? lastSeenAt,
      List<String>? readActivities,
      List<String>? seenActivities,
      int unread,
      int unseen});
}

/// @nodoc
class _$NotificationStatusResponseCopyWithImpl<$Res>
    implements $NotificationStatusResponseCopyWith<$Res> {
  _$NotificationStatusResponseCopyWithImpl(this._self, this._then);

  final NotificationStatusResponse _self;
  final $Res Function(NotificationStatusResponse) _then;

  /// Create a copy of NotificationStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastReadAt = freezed,
    Object? lastSeenAt = freezed,
    Object? readActivities = freezed,
    Object? seenActivities = freezed,
    Object? unread = null,
    Object? unseen = null,
  }) {
    return _then(NotificationStatusResponse(
      lastReadAt: freezed == lastReadAt
          ? _self.lastReadAt
          : lastReadAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSeenAt: freezed == lastSeenAt
          ? _self.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readActivities: freezed == readActivities
          ? _self.readActivities
          : readActivities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      seenActivities: freezed == seenActivities
          ? _self.seenActivities
          : seenActivities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      unread: null == unread
          ? _self.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as int,
      unseen: null == unseen
          ? _self.unseen
          : unseen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
