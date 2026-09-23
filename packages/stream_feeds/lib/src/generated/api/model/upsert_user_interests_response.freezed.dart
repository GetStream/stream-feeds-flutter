// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsert_user_interests_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpsertUserInterestsResponse {
  String get duration;
  List<InterestTagResponse> get interests;

  /// Create a copy of UpsertUserInterestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpsertUserInterestsResponseCopyWith<UpsertUserInterestsResponse> get copyWith =>
      _$UpsertUserInterestsResponseCopyWithImpl<UpsertUserInterestsResponse>(
        this as UpsertUserInterestsResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpsertUserInterestsResponse &&
            (identical(other.duration, duration) || other.duration == duration) &&
            const DeepCollectionEquality().equals(other.interests, interests));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    duration,
    const DeepCollectionEquality().hash(interests),
  );

  @override
  String toString() {
    return 'UpsertUserInterestsResponse(duration: $duration, interests: $interests)';
  }
}

/// @nodoc
abstract mixin class $UpsertUserInterestsResponseCopyWith<$Res> {
  factory $UpsertUserInterestsResponseCopyWith(
    UpsertUserInterestsResponse value,
    $Res Function(UpsertUserInterestsResponse) _then,
  ) = _$UpsertUserInterestsResponseCopyWithImpl;
  @useResult
  $Res call({String duration, List<InterestTagResponse> interests});
}

/// @nodoc
class _$UpsertUserInterestsResponseCopyWithImpl<$Res> implements $UpsertUserInterestsResponseCopyWith<$Res> {
  _$UpsertUserInterestsResponseCopyWithImpl(this._self, this._then);

  final UpsertUserInterestsResponse _self;
  final $Res Function(UpsertUserInterestsResponse) _then;

  /// Create a copy of UpsertUserInterestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? duration = null, Object? interests = null}) {
    return _then(
      UpsertUserInterestsResponse(
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        interests: null == interests
            ? _self.interests
            : interests // ignore: cast_nullable_to_non_nullable
                  as List<InterestTagResponse>,
      ),
    );
  }
}
