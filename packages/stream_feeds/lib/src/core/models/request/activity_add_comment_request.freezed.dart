// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_add_comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityAddCommentRequest {
  List<api.Attachment>? get attachments;
  String get comment;
  bool? get createNotificationActivity;
  List<String>? get mentionedUserIds;
  String? get parentId;
  Map<String, Object>? get custom;

  /// Create a copy of ActivityAddCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityAddCommentRequestCopyWith<ActivityAddCommentRequest> get copyWith =>
      _$ActivityAddCommentRequestCopyWithImpl<ActivityAddCommentRequest>(
          this as ActivityAddCommentRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityAddCommentRequest &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createNotificationActivity,
                    createNotificationActivity) ||
                other.createNotificationActivity ==
                    createNotificationActivity) &&
            const DeepCollectionEquality()
                .equals(other.mentionedUserIds, mentionedUserIds) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(attachments),
      comment,
      createNotificationActivity,
      const DeepCollectionEquality().hash(mentionedUserIds),
      parentId,
      const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'ActivityAddCommentRequest(attachments: $attachments, comment: $comment, createNotificationActivity: $createNotificationActivity, mentionedUserIds: $mentionedUserIds, parentId: $parentId, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $ActivityAddCommentRequestCopyWith<$Res> {
  factory $ActivityAddCommentRequestCopyWith(ActivityAddCommentRequest value,
          $Res Function(ActivityAddCommentRequest) _then) =
      _$ActivityAddCommentRequestCopyWithImpl;
  @useResult
  $Res call(
      {String comment,
      List<Attachment>? attachments,
      bool? createNotificationActivity,
      List<String>? mentionedUserIds,
      String? parentId,
      Map<String, Object>? custom});
}

/// @nodoc
class _$ActivityAddCommentRequestCopyWithImpl<$Res>
    implements $ActivityAddCommentRequestCopyWith<$Res> {
  _$ActivityAddCommentRequestCopyWithImpl(this._self, this._then);

  final ActivityAddCommentRequest _self;
  final $Res Function(ActivityAddCommentRequest) _then;

  /// Create a copy of ActivityAddCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? attachments = freezed,
    Object? createNotificationActivity = freezed,
    Object? mentionedUserIds = freezed,
    Object? parentId = freezed,
    Object? custom = freezed,
  }) {
    return _then(ActivityAddCommentRequest(
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      createNotificationActivity: freezed == createNotificationActivity
          ? _self.createNotificationActivity
          : createNotificationActivity // ignore: cast_nullable_to_non_nullable
              as bool?,
      mentionedUserIds: freezed == mentionedUserIds
          ? _self.mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
