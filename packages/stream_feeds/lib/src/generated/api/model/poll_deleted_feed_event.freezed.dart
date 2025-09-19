// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_deleted_feed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollDeletedFeedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  String? get feedVisibility;
  String get fid;
  PollResponseData get poll;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of PollDeletedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollDeletedFeedEventCopyWith<PollDeletedFeedEvent> get copyWith =>
      _$PollDeletedFeedEventCopyWithImpl<PollDeletedFeedEvent>(
          this as PollDeletedFeedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollDeletedFeedEvent &&
            super == other &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) ||
                other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      super.hashCode,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      feedVisibility,
      fid,
      poll,
      receivedAt,
      type);

  @override
  String toString() {
    return 'PollDeletedFeedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, poll: $poll, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $PollDeletedFeedEventCopyWith<$Res> {
  factory $PollDeletedFeedEventCopyWith(PollDeletedFeedEvent value,
          $Res Function(PollDeletedFeedEvent) _then) =
      _$PollDeletedFeedEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object?> custom,
      String? feedVisibility,
      String fid,
      PollResponseData poll,
      DateTime? receivedAt,
      String type});
}

/// @nodoc
class _$PollDeletedFeedEventCopyWithImpl<$Res>
    implements $PollDeletedFeedEventCopyWith<$Res> {
  _$PollDeletedFeedEventCopyWithImpl(this._self, this._then);

  final PollDeletedFeedEvent _self;
  final $Res Function(PollDeletedFeedEvent) _then;

  /// Create a copy of PollDeletedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? poll = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(PollDeletedFeedEvent(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      feedVisibility: freezed == feedVisibility
          ? _self.feedVisibility
          : feedVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as String,
      poll: null == poll
          ? _self.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PollResponseData,
      receivedAt: freezed == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
