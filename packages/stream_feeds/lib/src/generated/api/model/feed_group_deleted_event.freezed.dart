// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_group_deleted_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedGroupDeletedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  String? get feedVisibility;
  String get fid;
  String get groupId;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of FeedGroupDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedGroupDeletedEventCopyWith<FeedGroupDeletedEvent> get copyWith =>
      _$FeedGroupDeletedEventCopyWithImpl<FeedGroupDeletedEvent>(
          this as FeedGroupDeletedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedGroupDeletedEvent &&
            super == other &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) ||
                other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
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
      groupId,
      receivedAt,
      type);

  @override
  String toString() {
    return 'FeedGroupDeletedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, groupId: $groupId, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $FeedGroupDeletedEventCopyWith<$Res> {
  factory $FeedGroupDeletedEventCopyWith(FeedGroupDeletedEvent value,
          $Res Function(FeedGroupDeletedEvent) _then) =
      _$FeedGroupDeletedEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object?> custom,
      String? feedVisibility,
      String fid,
      String groupId,
      DateTime? receivedAt,
      String type});
}

/// @nodoc
class _$FeedGroupDeletedEventCopyWithImpl<$Res>
    implements $FeedGroupDeletedEventCopyWith<$Res> {
  _$FeedGroupDeletedEventCopyWithImpl(this._self, this._then);

  final FeedGroupDeletedEvent _self;
  final $Res Function(FeedGroupDeletedEvent) _then;

  /// Create a copy of FeedGroupDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? groupId = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(FeedGroupDeletedEvent(
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
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
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
