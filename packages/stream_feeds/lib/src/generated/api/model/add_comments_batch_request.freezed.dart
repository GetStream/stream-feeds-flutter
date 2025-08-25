// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_comments_batch_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCommentsBatchRequest {
  List<AddCommentRequest> get comments;

  /// Create a copy of AddCommentsBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddCommentsBatchRequestCopyWith<AddCommentsBatchRequest> get copyWith =>
      _$AddCommentsBatchRequestCopyWithImpl<AddCommentsBatchRequest>(
          this as AddCommentsBatchRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCommentsBatchRequest &&
            const DeepCollectionEquality().equals(other.comments, comments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(comments));

  @override
  String toString() {
    return 'AddCommentsBatchRequest(comments: $comments)';
  }
}

/// @nodoc
abstract mixin class $AddCommentsBatchRequestCopyWith<$Res> {
  factory $AddCommentsBatchRequestCopyWith(AddCommentsBatchRequest value,
          $Res Function(AddCommentsBatchRequest) _then) =
      _$AddCommentsBatchRequestCopyWithImpl;
  @useResult
  $Res call({List<AddCommentRequest> comments});
}

/// @nodoc
class _$AddCommentsBatchRequestCopyWithImpl<$Res>
    implements $AddCommentsBatchRequestCopyWith<$Res> {
  _$AddCommentsBatchRequestCopyWithImpl(this._self, this._then);

  final AddCommentsBatchRequest _self;
  final $Res Function(AddCommentsBatchRequest) _then;

  /// Create a copy of AddCommentsBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
  }) {
    return _then(AddCommentsBatchRequest(
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<AddCommentRequest>,
    ));
  }
}

// dart format on
