// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCommentRequest {
  List<Attachment>? get attachments;
  String? get comment;
  bool? get createNotificationActivity;
  Map<String, Object?>? get custom;
  String? get id;
  List<String>? get mentionedUserIds;
  String? get objectId;
  String? get objectType;
  String? get parentId;
  bool? get skipEnrichUrl;
  bool? get skipPush;

  /// Create a copy of AddCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddCommentRequestCopyWith<AddCommentRequest> get copyWith =>
      _$AddCommentRequestCopyWithImpl<AddCommentRequest>(
          this as AddCommentRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCommentRequest &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createNotificationActivity,
                    createNotificationActivity) ||
                other.createNotificationActivity ==
                    createNotificationActivity) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.mentionedUserIds, mentionedUserIds) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.skipEnrichUrl, skipEnrichUrl) ||
                other.skipEnrichUrl == skipEnrichUrl) &&
            (identical(other.skipPush, skipPush) ||
                other.skipPush == skipPush));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(attachments),
      comment,
      createNotificationActivity,
      const DeepCollectionEquality().hash(custom),
      id,
      const DeepCollectionEquality().hash(mentionedUserIds),
      objectId,
      objectType,
      parentId,
      skipEnrichUrl,
      skipPush);

  @override
  String toString() {
    return 'AddCommentRequest(attachments: $attachments, comment: $comment, createNotificationActivity: $createNotificationActivity, custom: $custom, id: $id, mentionedUserIds: $mentionedUserIds, objectId: $objectId, objectType: $objectType, parentId: $parentId, skipEnrichUrl: $skipEnrichUrl, skipPush: $skipPush)';
  }
}

/// @nodoc
abstract mixin class $AddCommentRequestCopyWith<$Res> {
  factory $AddCommentRequestCopyWith(
          AddCommentRequest value, $Res Function(AddCommentRequest) _then) =
      _$AddCommentRequestCopyWithImpl;
  @useResult
  $Res call(
      {List<Attachment>? attachments,
      String? comment,
      bool? createNotificationActivity,
      Map<String, Object?>? custom,
      String? id,
      List<String>? mentionedUserIds,
      String? objectId,
      String? objectType,
      String? parentId,
      bool? skipEnrichUrl,
      bool? skipPush});
}

/// @nodoc
class _$AddCommentRequestCopyWithImpl<$Res>
    implements $AddCommentRequestCopyWith<$Res> {
  _$AddCommentRequestCopyWithImpl(this._self, this._then);

  final AddCommentRequest _self;
  final $Res Function(AddCommentRequest) _then;

  /// Create a copy of AddCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = freezed,
    Object? comment = freezed,
    Object? createNotificationActivity = freezed,
    Object? custom = freezed,
    Object? id = freezed,
    Object? mentionedUserIds = freezed,
    Object? objectId = freezed,
    Object? objectType = freezed,
    Object? parentId = freezed,
    Object? skipEnrichUrl = freezed,
    Object? skipPush = freezed,
  }) {
    return _then(AddCommentRequest(
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createNotificationActivity: freezed == createNotificationActivity
          ? _self.createNotificationActivity
          : createNotificationActivity // ignore: cast_nullable_to_non_nullable
              as bool?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      mentionedUserIds: freezed == mentionedUserIds
          ? _self.mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      objectId: freezed == objectId
          ? _self.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      objectType: freezed == objectType
          ? _self.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      skipEnrichUrl: freezed == skipEnrichUrl
          ? _self.skipEnrichUrl
          : skipEnrichUrl // ignore: cast_nullable_to_non_nullable
              as bool?,
      skipPush: freezed == skipPush
          ? _self.skipPush
          : skipPush // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
