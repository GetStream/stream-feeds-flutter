// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_feedback_event_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentFeedbackEventPayload {
  String get commentId;
  DateTime get createdAt;
  bool get hide;
  DateTime get updatedAt;
  UserResponse get user;

  /// Create a copy of CommentFeedbackEventPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentFeedbackEventPayloadCopyWith<CommentFeedbackEventPayload> get copyWith =>
      _$CommentFeedbackEventPayloadCopyWithImpl<CommentFeedbackEventPayload>(
        this as CommentFeedbackEventPayload,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentFeedbackEventPayload &&
            (identical(other.commentId, commentId) || other.commentId == commentId) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.hide, hide) || other.hide == hide) &&
            (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentId, createdAt, hide, updatedAt, user);

  @override
  String toString() {
    return 'CommentFeedbackEventPayload(commentId: $commentId, createdAt: $createdAt, hide: $hide, updatedAt: $updatedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $CommentFeedbackEventPayloadCopyWith<$Res> {
  factory $CommentFeedbackEventPayloadCopyWith(
    CommentFeedbackEventPayload value,
    $Res Function(CommentFeedbackEventPayload) _then,
  ) = _$CommentFeedbackEventPayloadCopyWithImpl;
  @useResult
  $Res call({
    String commentId,
    DateTime createdAt,
    bool hide,
    DateTime updatedAt,
    UserResponse user,
  });
}

/// @nodoc
class _$CommentFeedbackEventPayloadCopyWithImpl<$Res> implements $CommentFeedbackEventPayloadCopyWith<$Res> {
  _$CommentFeedbackEventPayloadCopyWithImpl(this._self, this._then);

  final CommentFeedbackEventPayload _self;
  final $Res Function(CommentFeedbackEventPayload) _then;

  /// Create a copy of CommentFeedbackEventPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? createdAt = null,
    Object? hide = null,
    Object? updatedAt = null,
    Object? user = null,
  }) {
    return _then(
      CommentFeedbackEventPayload(
        commentId: null == commentId
            ? _self.commentId
            : commentId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        hide: null == hide
            ? _self.hide
            : hide // ignore: cast_nullable_to_non_nullable
                  as bool,
        updatedAt: null == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponse,
      ),
    );
  }
}
