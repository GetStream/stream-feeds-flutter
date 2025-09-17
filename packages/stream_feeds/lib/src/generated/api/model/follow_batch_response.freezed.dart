// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_batch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowBatchResponse {
  String get duration;
  List<FollowResponse> get follows;

  /// Create a copy of FollowBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowBatchResponseCopyWith<FollowBatchResponse> get copyWith =>
      _$FollowBatchResponseCopyWithImpl<FollowBatchResponse>(
          this as FollowBatchResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowBatchResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other.follows, follows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, duration, const DeepCollectionEquality().hash(follows));

  @override
  String toString() {
    return 'FollowBatchResponse(duration: $duration, follows: $follows)';
  }
}

/// @nodoc
abstract mixin class $FollowBatchResponseCopyWith<$Res> {
  factory $FollowBatchResponseCopyWith(
          FollowBatchResponse value, $Res Function(FollowBatchResponse) _then) =
      _$FollowBatchResponseCopyWithImpl;
  @useResult
  $Res call({String duration, List<FollowResponse> follows});
}

/// @nodoc
class _$FollowBatchResponseCopyWithImpl<$Res>
    implements $FollowBatchResponseCopyWith<$Res> {
  _$FollowBatchResponseCopyWithImpl(this._self, this._then);

  final FollowBatchResponse _self;
  final $Res Function(FollowBatchResponse) _then;

  /// Create a copy of FollowBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? follows = null,
  }) {
    return _then(FollowBatchResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      follows: null == follows
          ? _self.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<FollowResponse>,
    ));
  }
}

// dart format on
