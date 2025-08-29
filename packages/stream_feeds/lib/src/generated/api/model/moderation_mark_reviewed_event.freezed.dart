// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderation_mark_reviewed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModerationMarkReviewedEvent {
  DateTime get createdAt;
  ReviewQueueItem? get item;
  Message? get message;
  String get type;
  User? get user;

  /// Create a copy of ModerationMarkReviewedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModerationMarkReviewedEventCopyWith<ModerationMarkReviewedEvent>
      get copyWith => _$ModerationMarkReviewedEventCopyWithImpl<
              ModerationMarkReviewedEvent>(
          this as ModerationMarkReviewedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModerationMarkReviewedEvent &&
            super == other &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, super.hashCode, createdAt, item, message, type, user);

  @override
  String toString() {
    return 'ModerationMarkReviewedEvent(createdAt: $createdAt, item: $item, message: $message, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ModerationMarkReviewedEventCopyWith<$Res> {
  factory $ModerationMarkReviewedEventCopyWith(
          ModerationMarkReviewedEvent value,
          $Res Function(ModerationMarkReviewedEvent) _then) =
      _$ModerationMarkReviewedEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      ReviewQueueItem? item,
      Message? message,
      String type,
      User? user});
}

/// @nodoc
class _$ModerationMarkReviewedEventCopyWithImpl<$Res>
    implements $ModerationMarkReviewedEventCopyWith<$Res> {
  _$ModerationMarkReviewedEventCopyWithImpl(this._self, this._then);

  final ModerationMarkReviewedEvent _self;
  final $Res Function(ModerationMarkReviewedEvent) _then;

  /// Create a copy of ModerationMarkReviewedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? item = freezed,
    Object? message = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(ModerationMarkReviewedEvent(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as ReviewQueueItem?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

// dart format on
