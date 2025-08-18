// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_reviewed_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarkReviewedRequest {
  int? get contentToMarkAsReviewedLimit;
  bool? get disableMarkingContentAsReviewed;

  /// Create a copy of MarkReviewedRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MarkReviewedRequestCopyWith<MarkReviewedRequest> get copyWith =>
      _$MarkReviewedRequestCopyWithImpl<MarkReviewedRequest>(
          this as MarkReviewedRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkReviewedRequest &&
            (identical(other.contentToMarkAsReviewedLimit,
                    contentToMarkAsReviewedLimit) ||
                other.contentToMarkAsReviewedLimit ==
                    contentToMarkAsReviewedLimit) &&
            (identical(other.disableMarkingContentAsReviewed,
                    disableMarkingContentAsReviewed) ||
                other.disableMarkingContentAsReviewed ==
                    disableMarkingContentAsReviewed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentToMarkAsReviewedLimit,
      disableMarkingContentAsReviewed);

  @override
  String toString() {
    return 'MarkReviewedRequest(contentToMarkAsReviewedLimit: $contentToMarkAsReviewedLimit, disableMarkingContentAsReviewed: $disableMarkingContentAsReviewed)';
  }
}

/// @nodoc
abstract mixin class $MarkReviewedRequestCopyWith<$Res> {
  factory $MarkReviewedRequestCopyWith(
          MarkReviewedRequest value, $Res Function(MarkReviewedRequest) _then) =
      _$MarkReviewedRequestCopyWithImpl;
  @useResult
  $Res call(
      {int? contentToMarkAsReviewedLimit,
      bool? disableMarkingContentAsReviewed});
}

/// @nodoc
class _$MarkReviewedRequestCopyWithImpl<$Res>
    implements $MarkReviewedRequestCopyWith<$Res> {
  _$MarkReviewedRequestCopyWithImpl(this._self, this._then);

  final MarkReviewedRequest _self;
  final $Res Function(MarkReviewedRequest) _then;

  /// Create a copy of MarkReviewedRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentToMarkAsReviewedLimit = freezed,
    Object? disableMarkingContentAsReviewed = freezed,
  }) {
    return _then(MarkReviewedRequest(
      contentToMarkAsReviewedLimit: freezed == contentToMarkAsReviewedLimit
          ? _self.contentToMarkAsReviewedLimit
          : contentToMarkAsReviewedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      disableMarkingContentAsReviewed: freezed ==
              disableMarkingContentAsReviewed
          ? _self.disableMarkingContentAsReviewed
          : disableMarkingContentAsReviewed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
