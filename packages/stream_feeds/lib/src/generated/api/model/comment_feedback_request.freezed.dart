// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_feedback_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentFeedbackRequest {
  bool? get hide;

  /// Create a copy of CommentFeedbackRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentFeedbackRequestCopyWith<CommentFeedbackRequest> get copyWith =>
      _$CommentFeedbackRequestCopyWithImpl<CommentFeedbackRequest>(
        this as CommentFeedbackRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentFeedbackRequest &&
            (identical(other.hide, hide) || other.hide == hide));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hide);

  @override
  String toString() {
    return 'CommentFeedbackRequest(hide: $hide)';
  }
}

/// @nodoc
abstract mixin class $CommentFeedbackRequestCopyWith<$Res> {
  factory $CommentFeedbackRequestCopyWith(
    CommentFeedbackRequest value,
    $Res Function(CommentFeedbackRequest) _then,
  ) = _$CommentFeedbackRequestCopyWithImpl;
  @useResult
  $Res call({bool? hide});
}

/// @nodoc
class _$CommentFeedbackRequestCopyWithImpl<$Res> implements $CommentFeedbackRequestCopyWith<$Res> {
  _$CommentFeedbackRequestCopyWithImpl(this._self, this._then);

  final CommentFeedbackRequest _self;
  final $Res Function(CommentFeedbackRequest) _then;

  /// Create a copy of CommentFeedbackRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hide = freezed}) {
    return _then(
      CommentFeedbackRequest(
        hide: freezed == hide
            ? _self.hide
            : hide // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}
