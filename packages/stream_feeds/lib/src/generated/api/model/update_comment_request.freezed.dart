// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCommentRequest {
  List<Attachment>? get attachments;
  String? get comment;
  bool? get copyCustomToNotification;
  Map<String, Object?>? get custom;
  bool? get handleMentionNotifications;
  List<String>? get mentionedUserIds;
  bool? get skipEnrichUrl;
  bool? get skipPush;

  /// Create a copy of UpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCommentRequestCopyWith<UpdateCommentRequest> get copyWith =>
      _$UpdateCommentRequestCopyWithImpl<UpdateCommentRequest>(
        this as UpdateCommentRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCommentRequest &&
            const DeepCollectionEquality().equals(
              other.attachments,
              attachments,
            ) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(
                  other.copyCustomToNotification,
                  copyCustomToNotification,
                ) ||
                other.copyCustomToNotification == copyCustomToNotification) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(
                  other.handleMentionNotifications,
                  handleMentionNotifications,
                ) ||
                other.handleMentionNotifications == handleMentionNotifications) &&
            const DeepCollectionEquality().equals(
              other.mentionedUserIds,
              mentionedUserIds,
            ) &&
            (identical(other.skipEnrichUrl, skipEnrichUrl) || other.skipEnrichUrl == skipEnrichUrl) &&
            (identical(other.skipPush, skipPush) || other.skipPush == skipPush));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(attachments),
    comment,
    copyCustomToNotification,
    const DeepCollectionEquality().hash(custom),
    handleMentionNotifications,
    const DeepCollectionEquality().hash(mentionedUserIds),
    skipEnrichUrl,
    skipPush,
  );

  @override
  String toString() {
    return 'UpdateCommentRequest(attachments: $attachments, comment: $comment, copyCustomToNotification: $copyCustomToNotification, custom: $custom, handleMentionNotifications: $handleMentionNotifications, mentionedUserIds: $mentionedUserIds, skipEnrichUrl: $skipEnrichUrl, skipPush: $skipPush)';
  }
}

/// @nodoc
abstract mixin class $UpdateCommentRequestCopyWith<$Res> {
  factory $UpdateCommentRequestCopyWith(
    UpdateCommentRequest value,
    $Res Function(UpdateCommentRequest) _then,
  ) = _$UpdateCommentRequestCopyWithImpl;
  @useResult
  $Res call({
    List<Attachment>? attachments,
    String? comment,
    bool? copyCustomToNotification,
    Map<String, Object?>? custom,
    bool? handleMentionNotifications,
    List<String>? mentionedUserIds,
    bool? skipEnrichUrl,
    bool? skipPush,
  });
}

/// @nodoc
class _$UpdateCommentRequestCopyWithImpl<$Res> implements $UpdateCommentRequestCopyWith<$Res> {
  _$UpdateCommentRequestCopyWithImpl(this._self, this._then);

  final UpdateCommentRequest _self;
  final $Res Function(UpdateCommentRequest) _then;

  /// Create a copy of UpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = freezed,
    Object? comment = freezed,
    Object? copyCustomToNotification = freezed,
    Object? custom = freezed,
    Object? handleMentionNotifications = freezed,
    Object? mentionedUserIds = freezed,
    Object? skipEnrichUrl = freezed,
    Object? skipPush = freezed,
  }) {
    return _then(
      UpdateCommentRequest(
        attachments: freezed == attachments
            ? _self.attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<Attachment>?,
        comment: freezed == comment
            ? _self.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        copyCustomToNotification: freezed == copyCustomToNotification
            ? _self.copyCustomToNotification
            : copyCustomToNotification // ignore: cast_nullable_to_non_nullable
                  as bool?,
        custom: freezed == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>?,
        handleMentionNotifications: freezed == handleMentionNotifications
            ? _self.handleMentionNotifications
            : handleMentionNotifications // ignore: cast_nullable_to_non_nullable
                  as bool?,
        mentionedUserIds: freezed == mentionedUserIds
            ? _self.mentionedUserIds
            : mentionedUserIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        skipEnrichUrl: freezed == skipEnrichUrl
            ? _self.skipEnrichUrl
            : skipEnrichUrl // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipPush: freezed == skipPush
            ? _self.skipPush
            : skipPush // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}
