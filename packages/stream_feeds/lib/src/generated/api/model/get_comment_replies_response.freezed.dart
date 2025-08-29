// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_comment_replies_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetCommentRepliesResponse {
  List<ThreadedCommentResponse> get comments;
  String get duration;
  String? get next;
  String? get prev;

  /// Create a copy of GetCommentRepliesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetCommentRepliesResponseCopyWith<GetCommentRepliesResponse> get copyWith =>
      _$GetCommentRepliesResponseCopyWithImpl<GetCommentRepliesResponse>(
          this as GetCommentRepliesResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetCommentRepliesResponse &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(comments), duration, next, prev);

  @override
  String toString() {
    return 'GetCommentRepliesResponse(comments: $comments, duration: $duration, next: $next, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $GetCommentRepliesResponseCopyWith<$Res> {
  factory $GetCommentRepliesResponseCopyWith(GetCommentRepliesResponse value,
          $Res Function(GetCommentRepliesResponse) _then) =
      _$GetCommentRepliesResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<ThreadedCommentResponse> comments,
      String duration,
      String? next,
      String? prev});
}

/// @nodoc
class _$GetCommentRepliesResponseCopyWithImpl<$Res>
    implements $GetCommentRepliesResponseCopyWith<$Res> {
  _$GetCommentRepliesResponseCopyWithImpl(this._self, this._then);

  final GetCommentRepliesResponse _self;
  final $Res Function(GetCommentRepliesResponse) _then;

  /// Create a copy of GetCommentRepliesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? duration = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(GetCommentRepliesResponse(
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ThreadedCommentResponse>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
