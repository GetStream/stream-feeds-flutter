// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_feedback_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentFeedbackResponse {
  String get commentId;
  String get duration;
  bool get hide;

  /// Create a copy of CommentFeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentFeedbackResponseCopyWith<CommentFeedbackResponse> get copyWith =>
      _$CommentFeedbackResponseCopyWithImpl<CommentFeedbackResponse>(
        this as CommentFeedbackResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentFeedbackResponse &&
            (identical(other.commentId, commentId) || other.commentId == commentId) &&
            (identical(other.duration, duration) || other.duration == duration) &&
            (identical(other.hide, hide) || other.hide == hide));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentId, duration, hide);

  @override
  String toString() {
    return 'CommentFeedbackResponse(commentId: $commentId, duration: $duration, hide: $hide)';
  }
}

/// @nodoc
abstract mixin class $CommentFeedbackResponseCopyWith<$Res> {
  factory $CommentFeedbackResponseCopyWith(
    CommentFeedbackResponse value,
    $Res Function(CommentFeedbackResponse) _then,
  ) = _$CommentFeedbackResponseCopyWithImpl;
  @useResult
  $Res call({String commentId, String duration, bool hide});
}

/// @nodoc
class _$CommentFeedbackResponseCopyWithImpl<$Res> implements $CommentFeedbackResponseCopyWith<$Res> {
  _$CommentFeedbackResponseCopyWithImpl(this._self, this._then);

  final CommentFeedbackResponse _self;
  final $Res Function(CommentFeedbackResponse) _then;

  /// Create a copy of CommentFeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? duration = null,
    Object? hide = null,
  }) {
    return _then(
      CommentFeedbackResponse(
        commentId: null == commentId
            ? _self.commentId
            : commentId // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        hide: null == hide
            ? _self.hide
            : hide // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
