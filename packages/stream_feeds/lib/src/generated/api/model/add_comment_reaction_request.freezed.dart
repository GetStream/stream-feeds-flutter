// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_comment_reaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCommentReactionRequest {
  bool? get copyCustomToNotification;
  bool? get createNotificationActivity;
  Map<String, Object?>? get custom;
  bool? get enforceUnique;
  bool? get skipPush;
  List<String>? get targetFeeds;
  String get type;

  /// Create a copy of AddCommentReactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddCommentReactionRequestCopyWith<AddCommentReactionRequest> get copyWith =>
      _$AddCommentReactionRequestCopyWithImpl<AddCommentReactionRequest>(
        this as AddCommentReactionRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCommentReactionRequest &&
            (identical(
                  other.copyCustomToNotification,
                  copyCustomToNotification,
                ) ||
                other.copyCustomToNotification == copyCustomToNotification) &&
            (identical(
                  other.createNotificationActivity,
                  createNotificationActivity,
                ) ||
                other.createNotificationActivity == createNotificationActivity) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.enforceUnique, enforceUnique) || other.enforceUnique == enforceUnique) &&
            (identical(other.skipPush, skipPush) || other.skipPush == skipPush) &&
            const DeepCollectionEquality().equals(
              other.targetFeeds,
              targetFeeds,
            ) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    copyCustomToNotification,
    createNotificationActivity,
    const DeepCollectionEquality().hash(custom),
    enforceUnique,
    skipPush,
    const DeepCollectionEquality().hash(targetFeeds),
    type,
  );

  @override
  String toString() {
    return 'AddCommentReactionRequest(copyCustomToNotification: $copyCustomToNotification, createNotificationActivity: $createNotificationActivity, custom: $custom, enforceUnique: $enforceUnique, skipPush: $skipPush, targetFeeds: $targetFeeds, type: $type)';
  }
}

/// @nodoc
abstract mixin class $AddCommentReactionRequestCopyWith<$Res> {
  factory $AddCommentReactionRequestCopyWith(
    AddCommentReactionRequest value,
    $Res Function(AddCommentReactionRequest) _then,
  ) = _$AddCommentReactionRequestCopyWithImpl;
  @useResult
  $Res call({
    bool? copyCustomToNotification,
    bool? createNotificationActivity,
    Map<String, Object?>? custom,
    bool? enforceUnique,
    bool? skipPush,
    List<String>? targetFeeds,
    String type,
  });
}

/// @nodoc
class _$AddCommentReactionRequestCopyWithImpl<$Res> implements $AddCommentReactionRequestCopyWith<$Res> {
  _$AddCommentReactionRequestCopyWithImpl(this._self, this._then);

  final AddCommentReactionRequest _self;
  final $Res Function(AddCommentReactionRequest) _then;

  /// Create a copy of AddCommentReactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copyCustomToNotification = freezed,
    Object? createNotificationActivity = freezed,
    Object? custom = freezed,
    Object? enforceUnique = freezed,
    Object? skipPush = freezed,
    Object? targetFeeds = freezed,
    Object? type = null,
  }) {
    return _then(
      AddCommentReactionRequest(
        copyCustomToNotification: freezed == copyCustomToNotification
            ? _self.copyCustomToNotification
            : copyCustomToNotification // ignore: cast_nullable_to_non_nullable
                  as bool?,
        createNotificationActivity: freezed == createNotificationActivity
            ? _self.createNotificationActivity
            : createNotificationActivity // ignore: cast_nullable_to_non_nullable
                  as bool?,
        custom: freezed == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>?,
        enforceUnique: freezed == enforceUnique
            ? _self.enforceUnique
            : enforceUnique // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipPush: freezed == skipPush
            ? _self.skipPush
            : skipPush // ignore: cast_nullable_to_non_nullable
                  as bool?,
        targetFeeds: freezed == targetFeeds
            ? _self.targetFeeds
            : targetFeeds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
