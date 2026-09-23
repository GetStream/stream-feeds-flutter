// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsert_user_interests_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpsertUserInterestsRequest {
  List<UserInterestRequest> get interests;

  /// Create a copy of UpsertUserInterestsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpsertUserInterestsRequestCopyWith<UpsertUserInterestsRequest> get copyWith =>
      _$UpsertUserInterestsRequestCopyWithImpl<UpsertUserInterestsRequest>(
        this as UpsertUserInterestsRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpsertUserInterestsRequest &&
            const DeepCollectionEquality().equals(other.interests, interests));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(interests));

  @override
  String toString() {
    return 'UpsertUserInterestsRequest(interests: $interests)';
  }
}

/// @nodoc
abstract mixin class $UpsertUserInterestsRequestCopyWith<$Res> {
  factory $UpsertUserInterestsRequestCopyWith(
    UpsertUserInterestsRequest value,
    $Res Function(UpsertUserInterestsRequest) _then,
  ) = _$UpsertUserInterestsRequestCopyWithImpl;
  @useResult
  $Res call({List<UserInterestRequest> interests});
}

/// @nodoc
class _$UpsertUserInterestsRequestCopyWithImpl<$Res> implements $UpsertUserInterestsRequestCopyWith<$Res> {
  _$UpsertUserInterestsRequestCopyWithImpl(this._self, this._then);

  final UpsertUserInterestsRequest _self;
  final $Res Function(UpsertUserInterestsRequest) _then;

  /// Create a copy of UpsertUserInterestsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? interests = null}) {
    return _then(
      UpsertUserInterestsRequest(
        interests: null == interests
            ? _self.interests
            : interests // ignore: cast_nullable_to_non_nullable
                  as List<UserInterestRequest>,
      ),
    );
  }
}
