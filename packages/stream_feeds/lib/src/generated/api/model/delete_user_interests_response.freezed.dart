// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user_interests_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteUserInterestsResponse {
  String get duration;
  List<InterestTagResponse> get interests;

  /// Create a copy of DeleteUserInterestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteUserInterestsResponseCopyWith<DeleteUserInterestsResponse> get copyWith =>
      _$DeleteUserInterestsResponseCopyWithImpl<DeleteUserInterestsResponse>(
        this as DeleteUserInterestsResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteUserInterestsResponse &&
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
    return 'DeleteUserInterestsResponse(duration: $duration, interests: $interests)';
  }
}

/// @nodoc
abstract mixin class $DeleteUserInterestsResponseCopyWith<$Res> {
  factory $DeleteUserInterestsResponseCopyWith(
    DeleteUserInterestsResponse value,
    $Res Function(DeleteUserInterestsResponse) _then,
  ) = _$DeleteUserInterestsResponseCopyWithImpl;
  @useResult
  $Res call({String duration, List<InterestTagResponse> interests});
}

/// @nodoc
class _$DeleteUserInterestsResponseCopyWithImpl<$Res> implements $DeleteUserInterestsResponseCopyWith<$Res> {
  _$DeleteUserInterestsResponseCopyWithImpl(this._self, this._then);

  final DeleteUserInterestsResponse _self;
  final $Res Function(DeleteUserInterestsResponse) _then;

  /// Create a copy of DeleteUserInterestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? duration = null, Object? interests = null}) {
    return _then(
      DeleteUserInterestsResponse(
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
