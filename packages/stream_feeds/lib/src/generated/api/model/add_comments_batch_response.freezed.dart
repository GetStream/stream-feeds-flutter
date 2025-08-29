// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_comments_batch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCommentsBatchResponse {
  List<CommentResponse> get comments;
  String get duration;

  /// Create a copy of AddCommentsBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddCommentsBatchResponseCopyWith<AddCommentsBatchResponse> get copyWith =>
      _$AddCommentsBatchResponseCopyWithImpl<AddCommentsBatchResponse>(
          this as AddCommentsBatchResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCommentsBatchResponse &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(comments), duration);

  @override
  String toString() {
    return 'AddCommentsBatchResponse(comments: $comments, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $AddCommentsBatchResponseCopyWith<$Res> {
  factory $AddCommentsBatchResponseCopyWith(AddCommentsBatchResponse value,
          $Res Function(AddCommentsBatchResponse) _then) =
      _$AddCommentsBatchResponseCopyWithImpl;
  @useResult
  $Res call({List<CommentResponse> comments, String duration});
}

/// @nodoc
class _$AddCommentsBatchResponseCopyWithImpl<$Res>
    implements $AddCommentsBatchResponseCopyWith<$Res> {
  _$AddCommentsBatchResponseCopyWithImpl(this._self, this._then);

  final AddCommentsBatchResponse _self;
  final $Res Function(AddCommentsBatchResponse) _then;

  /// Create a copy of AddCommentsBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? duration = null,
  }) {
    return _then(AddCommentsBatchResponse(
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentResponse>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
