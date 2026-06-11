// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unfollow_batch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnfollowBatchResponse {
  String get duration;
  List<FollowResponse> get follows;

  /// Create a copy of UnfollowBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnfollowBatchResponseCopyWith<UnfollowBatchResponse> get copyWith =>
      _$UnfollowBatchResponseCopyWithImpl<UnfollowBatchResponse>(
        this as UnfollowBatchResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnfollowBatchResponse &&
            (identical(other.duration, duration) || other.duration == duration) &&
            const DeepCollectionEquality().equals(other.follows, follows));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    duration,
    const DeepCollectionEquality().hash(follows),
  );

  @override
  String toString() {
    return 'UnfollowBatchResponse(duration: $duration, follows: $follows)';
  }
}

/// @nodoc
abstract mixin class $UnfollowBatchResponseCopyWith<$Res> {
  factory $UnfollowBatchResponseCopyWith(
    UnfollowBatchResponse value,
    $Res Function(UnfollowBatchResponse) _then,
  ) = _$UnfollowBatchResponseCopyWithImpl;
  @useResult
  $Res call({String duration, List<FollowResponse> follows});
}

/// @nodoc
class _$UnfollowBatchResponseCopyWithImpl<$Res> implements $UnfollowBatchResponseCopyWith<$Res> {
  _$UnfollowBatchResponseCopyWithImpl(this._self, this._then);

  final UnfollowBatchResponse _self;
  final $Res Function(UnfollowBatchResponse) _then;

  /// Create a copy of UnfollowBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? duration = null, Object? follows = null}) {
    return _then(
      UnfollowBatchResponse(
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        follows: null == follows
            ? _self.follows
            : follows // ignore: cast_nullable_to_non_nullable
                  as List<FollowResponse>,
      ),
    );
  }
}
