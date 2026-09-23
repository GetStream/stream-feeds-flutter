// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_interest_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInterestRequest {
  String get tag;
  double? get weight;

  /// Create a copy of UserInterestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInterestRequestCopyWith<UserInterestRequest> get copyWith =>
      _$UserInterestRequestCopyWithImpl<UserInterestRequest>(
        this as UserInterestRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInterestRequest &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag, weight);

  @override
  String toString() {
    return 'UserInterestRequest(tag: $tag, weight: $weight)';
  }
}

/// @nodoc
abstract mixin class $UserInterestRequestCopyWith<$Res> {
  factory $UserInterestRequestCopyWith(
    UserInterestRequest value,
    $Res Function(UserInterestRequest) _then,
  ) = _$UserInterestRequestCopyWithImpl;
  @useResult
  $Res call({String tag, double? weight});
}

/// @nodoc
class _$UserInterestRequestCopyWithImpl<$Res> implements $UserInterestRequestCopyWith<$Res> {
  _$UserInterestRequestCopyWithImpl(this._self, this._then);

  final UserInterestRequest _self;
  final $Res Function(UserInterestRequest) _then;

  /// Create a copy of UserInterestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tag = null, Object? weight = freezed}) {
    return _then(
      UserInterestRequest(
        tag: null == tag
            ? _self.tag
            : tag // ignore: cast_nullable_to_non_nullable
                  as String,
        weight: freezed == weight
            ? _self.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}
