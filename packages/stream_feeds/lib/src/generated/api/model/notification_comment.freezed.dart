// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationComment {
  List<Attachment>? get attachments;
  String get comment;
  String get id;
  String get userId;

  /// Create a copy of NotificationComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationCommentCopyWith<NotificationComment> get copyWith =>
      _$NotificationCommentCopyWithImpl<NotificationComment>(
          this as NotificationComment, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationComment &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(attachments), comment, id, userId);

  @override
  String toString() {
    return 'NotificationComment(attachments: $attachments, comment: $comment, id: $id, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $NotificationCommentCopyWith<$Res> {
  factory $NotificationCommentCopyWith(
          NotificationComment value, $Res Function(NotificationComment) _then) =
      _$NotificationCommentCopyWithImpl;
  @useResult
  $Res call(
      {List<Attachment>? attachments,
      String comment,
      String id,
      String userId});
}

/// @nodoc
class _$NotificationCommentCopyWithImpl<$Res>
    implements $NotificationCommentCopyWith<$Res> {
  _$NotificationCommentCopyWithImpl(this._self, this._then);

  final NotificationComment _self;
  final $Res Function(NotificationComment) _then;

  /// Create a copy of NotificationComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = freezed,
    Object? comment = null,
    Object? id = null,
    Object? userId = null,
  }) {
    return _then(NotificationComment(
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
