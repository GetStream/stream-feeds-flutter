// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_action_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitActionRequest {
  SubmitActionRequestActionType get actionType;
  BanActionRequest? get ban;
  CustomActionRequest? get custom;
  DeleteActivityRequest? get deleteActivity;
  DeleteMessageRequest? get deleteMessage;
  DeleteReactionRequest? get deleteReaction;
  DeleteUserRequest? get deleteUser;
  String get itemId;
  MarkReviewedRequest? get markReviewed;

  /// Create a copy of SubmitActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmitActionRequestCopyWith<SubmitActionRequest> get copyWith =>
      _$SubmitActionRequestCopyWithImpl<SubmitActionRequest>(
          this as SubmitActionRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubmitActionRequest &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.ban, ban) || other.ban == ban) &&
            (identical(other.custom, custom) || other.custom == custom) &&
            (identical(other.deleteActivity, deleteActivity) ||
                other.deleteActivity == deleteActivity) &&
            (identical(other.deleteMessage, deleteMessage) ||
                other.deleteMessage == deleteMessage) &&
            (identical(other.deleteReaction, deleteReaction) ||
                other.deleteReaction == deleteReaction) &&
            (identical(other.deleteUser, deleteUser) ||
                other.deleteUser == deleteUser) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.markReviewed, markReviewed) ||
                other.markReviewed == markReviewed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      actionType,
      ban,
      custom,
      deleteActivity,
      deleteMessage,
      deleteReaction,
      deleteUser,
      itemId,
      markReviewed);

  @override
  String toString() {
    return 'SubmitActionRequest(actionType: $actionType, ban: $ban, custom: $custom, deleteActivity: $deleteActivity, deleteMessage: $deleteMessage, deleteReaction: $deleteReaction, deleteUser: $deleteUser, itemId: $itemId, markReviewed: $markReviewed)';
  }
}

/// @nodoc
abstract mixin class $SubmitActionRequestCopyWith<$Res> {
  factory $SubmitActionRequestCopyWith(
          SubmitActionRequest value, $Res Function(SubmitActionRequest) _then) =
      _$SubmitActionRequestCopyWithImpl;
  @useResult
  $Res call(
      {SubmitActionRequestActionType actionType,
      BanActionRequest? ban,
      CustomActionRequest? custom,
      DeleteActivityRequest? deleteActivity,
      DeleteMessageRequest? deleteMessage,
      DeleteReactionRequest? deleteReaction,
      DeleteUserRequest? deleteUser,
      String itemId,
      MarkReviewedRequest? markReviewed});
}

/// @nodoc
class _$SubmitActionRequestCopyWithImpl<$Res>
    implements $SubmitActionRequestCopyWith<$Res> {
  _$SubmitActionRequestCopyWithImpl(this._self, this._then);

  final SubmitActionRequest _self;
  final $Res Function(SubmitActionRequest) _then;

  /// Create a copy of SubmitActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionType = null,
    Object? ban = freezed,
    Object? custom = freezed,
    Object? deleteActivity = freezed,
    Object? deleteMessage = freezed,
    Object? deleteReaction = freezed,
    Object? deleteUser = freezed,
    Object? itemId = null,
    Object? markReviewed = freezed,
  }) {
    return _then(SubmitActionRequest(
      actionType: null == actionType
          ? _self.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as SubmitActionRequestActionType,
      ban: freezed == ban
          ? _self.ban
          : ban // ignore: cast_nullable_to_non_nullable
              as BanActionRequest?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as CustomActionRequest?,
      deleteActivity: freezed == deleteActivity
          ? _self.deleteActivity
          : deleteActivity // ignore: cast_nullable_to_non_nullable
              as DeleteActivityRequest?,
      deleteMessage: freezed == deleteMessage
          ? _self.deleteMessage
          : deleteMessage // ignore: cast_nullable_to_non_nullable
              as DeleteMessageRequest?,
      deleteReaction: freezed == deleteReaction
          ? _self.deleteReaction
          : deleteReaction // ignore: cast_nullable_to_non_nullable
              as DeleteReactionRequest?,
      deleteUser: freezed == deleteUser
          ? _self.deleteUser
          : deleteUser // ignore: cast_nullable_to_non_nullable
              as DeleteUserRequest?,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      markReviewed: freezed == markReviewed
          ? _self.markReviewed
          : markReviewed // ignore: cast_nullable_to_non_nullable
              as MarkReviewedRequest?,
    ));
  }
}

// dart format on
