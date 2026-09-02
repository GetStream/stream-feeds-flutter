// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_feed_counts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetFeedCountsResponse {
  int get activityCount;
  int get commentCount;
  String get duration;
  int get totalCount;

  /// Create a copy of GetFeedCountsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetFeedCountsResponseCopyWith<GetFeedCountsResponse> get copyWith =>
      _$GetFeedCountsResponseCopyWithImpl<GetFeedCountsResponse>(
        this as GetFeedCountsResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetFeedCountsResponse &&
            (identical(other.activityCount, activityCount) || other.activityCount == activityCount) &&
            (identical(other.commentCount, commentCount) || other.commentCount == commentCount) &&
            (identical(other.duration, duration) || other.duration == duration) &&
            (identical(other.totalCount, totalCount) || other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activityCount,
    commentCount,
    duration,
    totalCount,
  );

  @override
  String toString() {
    return 'GetFeedCountsResponse(activityCount: $activityCount, commentCount: $commentCount, duration: $duration, totalCount: $totalCount)';
  }
}

/// @nodoc
abstract mixin class $GetFeedCountsResponseCopyWith<$Res> {
  factory $GetFeedCountsResponseCopyWith(
    GetFeedCountsResponse value,
    $Res Function(GetFeedCountsResponse) _then,
  ) = _$GetFeedCountsResponseCopyWithImpl;
  @useResult
  $Res call({
    int activityCount,
    int commentCount,
    String duration,
    int totalCount,
  });
}

/// @nodoc
class _$GetFeedCountsResponseCopyWithImpl<$Res> implements $GetFeedCountsResponseCopyWith<$Res> {
  _$GetFeedCountsResponseCopyWithImpl(this._self, this._then);

  final GetFeedCountsResponse _self;
  final $Res Function(GetFeedCountsResponse) _then;

  /// Create a copy of GetFeedCountsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityCount = null,
    Object? commentCount = null,
    Object? duration = null,
    Object? totalCount = null,
  }) {
    return _then(
      GetFeedCountsResponse(
        activityCount: null == activityCount
            ? _self.activityCount
            : activityCount // ignore: cast_nullable_to_non_nullable
                  as int,
        commentCount: null == commentCount
            ? _self.commentCount
            : commentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        totalCount: null == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
