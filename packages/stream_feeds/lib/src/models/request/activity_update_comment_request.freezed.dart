// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_update_comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityUpdateCommentRequest {
  String? get comment;
  Map<String, Object?>? get custom;
  bool? get skipPush;

  /// Create a copy of ActivityUpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityUpdateCommentRequestCopyWith<ActivityUpdateCommentRequest>
      get copyWith => _$ActivityUpdateCommentRequestCopyWithImpl<
              ActivityUpdateCommentRequest>(
          this as ActivityUpdateCommentRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityUpdateCommentRequest &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.skipPush, skipPush) ||
                other.skipPush == skipPush));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment,
      const DeepCollectionEquality().hash(custom), skipPush);

  @override
  String toString() {
    return 'ActivityUpdateCommentRequest(comment: $comment, custom: $custom, skipPush: $skipPush)';
  }
}

/// @nodoc
abstract mixin class $ActivityUpdateCommentRequestCopyWith<$Res> {
  factory $ActivityUpdateCommentRequestCopyWith(
          ActivityUpdateCommentRequest value,
          $Res Function(ActivityUpdateCommentRequest) _then) =
      _$ActivityUpdateCommentRequestCopyWithImpl;
  @useResult
  $Res call({String? comment, Map<String, Object?>? custom, bool? skipPush});
}

/// @nodoc
class _$ActivityUpdateCommentRequestCopyWithImpl<$Res>
    implements $ActivityUpdateCommentRequestCopyWith<$Res> {
  _$ActivityUpdateCommentRequestCopyWithImpl(this._self, this._then);

  final ActivityUpdateCommentRequest _self;
  final $Res Function(ActivityUpdateCommentRequest) _then;

  /// Create a copy of ActivityUpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
    Object? custom = freezed,
    Object? skipPush = freezed,
  }) {
    return _then(ActivityUpdateCommentRequest(
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      skipPush: freezed == skipPush
          ? _self.skipPush
          : skipPush // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
