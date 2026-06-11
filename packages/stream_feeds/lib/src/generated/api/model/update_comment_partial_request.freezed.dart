// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_comment_partial_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCommentPartialRequest {
  bool? get copyCustomToNotification;
  bool? get handleMentionNotifications;
  Map<String, Object?>? get set;
  bool? get skipEnrichUrl;
  bool? get skipPush;
  List<String>? get unset;

  /// Create a copy of UpdateCommentPartialRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCommentPartialRequestCopyWith<UpdateCommentPartialRequest>
      get copyWith => _$UpdateCommentPartialRequestCopyWithImpl<
              UpdateCommentPartialRequest>(
          this as UpdateCommentPartialRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCommentPartialRequest &&
            (identical(
                    other.copyCustomToNotification, copyCustomToNotification) ||
                other.copyCustomToNotification == copyCustomToNotification) &&
            (identical(other.handleMentionNotifications,
                    handleMentionNotifications) ||
                other.handleMentionNotifications ==
                    handleMentionNotifications) &&
            const DeepCollectionEquality().equals(other.set, set) &&
            (identical(other.skipEnrichUrl, skipEnrichUrl) ||
                other.skipEnrichUrl == skipEnrichUrl) &&
            (identical(other.skipPush, skipPush) ||
                other.skipPush == skipPush) &&
            const DeepCollectionEquality().equals(other.unset, unset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      copyCustomToNotification,
      handleMentionNotifications,
      const DeepCollectionEquality().hash(set),
      skipEnrichUrl,
      skipPush,
      const DeepCollectionEquality().hash(unset));

  @override
  String toString() {
    return 'UpdateCommentPartialRequest(copyCustomToNotification: $copyCustomToNotification, handleMentionNotifications: $handleMentionNotifications, set: $set, skipEnrichUrl: $skipEnrichUrl, skipPush: $skipPush, unset: $unset)';
  }
}

/// @nodoc
abstract mixin class $UpdateCommentPartialRequestCopyWith<$Res> {
  factory $UpdateCommentPartialRequestCopyWith(
          UpdateCommentPartialRequest value,
          $Res Function(UpdateCommentPartialRequest) _then) =
      _$UpdateCommentPartialRequestCopyWithImpl;
  @useResult
  $Res call(
      {bool? copyCustomToNotification,
      bool? handleMentionNotifications,
      Map<String, Object?>? set,
      bool? skipEnrichUrl,
      bool? skipPush,
      List<String>? unset});
}

/// @nodoc
class _$UpdateCommentPartialRequestCopyWithImpl<$Res>
    implements $UpdateCommentPartialRequestCopyWith<$Res> {
  _$UpdateCommentPartialRequestCopyWithImpl(this._self, this._then);

  final UpdateCommentPartialRequest _self;
  final $Res Function(UpdateCommentPartialRequest) _then;

  /// Create a copy of UpdateCommentPartialRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copyCustomToNotification = freezed,
    Object? handleMentionNotifications = freezed,
    Object? set = freezed,
    Object? skipEnrichUrl = freezed,
    Object? skipPush = freezed,
    Object? unset = freezed,
  }) {
    return _then(UpdateCommentPartialRequest(
      copyCustomToNotification: freezed == copyCustomToNotification
          ? _self.copyCustomToNotification
          : copyCustomToNotification // ignore: cast_nullable_to_non_nullable
              as bool?,
      handleMentionNotifications: freezed == handleMentionNotifications
          ? _self.handleMentionNotifications
          : handleMentionNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
      set: freezed == set
          ? _self.set
          : set // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      skipEnrichUrl: freezed == skipEnrichUrl
          ? _self.skipEnrichUrl
          : skipEnrichUrl // ignore: cast_nullable_to_non_nullable
              as bool?,
      skipPush: freezed == skipPush
          ? _self.skipPush
          : skipPush // ignore: cast_nullable_to_non_nullable
              as bool?,
      unset: freezed == unset
          ? _self.unset
          : unset // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
