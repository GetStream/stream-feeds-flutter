// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_poll_partial_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePollPartialRequest {
  Map<String, Object?>? get set;
  List<String>? get unset;

  /// Create a copy of UpdatePollPartialRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePollPartialRequestCopyWith<UpdatePollPartialRequest> get copyWith =>
      _$UpdatePollPartialRequestCopyWithImpl<UpdatePollPartialRequest>(
          this as UpdatePollPartialRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePollPartialRequest &&
            const DeepCollectionEquality().equals(other.set, set) &&
            const DeepCollectionEquality().equals(other.unset, unset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(set),
      const DeepCollectionEquality().hash(unset));

  @override
  String toString() {
    return 'UpdatePollPartialRequest(set: $set, unset: $unset)';
  }
}

/// @nodoc
abstract mixin class $UpdatePollPartialRequestCopyWith<$Res> {
  factory $UpdatePollPartialRequestCopyWith(UpdatePollPartialRequest value,
          $Res Function(UpdatePollPartialRequest) _then) =
      _$UpdatePollPartialRequestCopyWithImpl;
  @useResult
  $Res call({Map<String, Object?>? set, List<String>? unset});
}

/// @nodoc
class _$UpdatePollPartialRequestCopyWithImpl<$Res>
    implements $UpdatePollPartialRequestCopyWith<$Res> {
  _$UpdatePollPartialRequestCopyWithImpl(this._self, this._then);

  final UpdatePollPartialRequest _self;
  final $Res Function(UpdatePollPartialRequest) _then;

  /// Create a copy of UpdatePollPartialRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? set = freezed,
    Object? unset = freezed,
  }) {
    return _then(UpdatePollPartialRequest(
      set: freezed == set
          ? _self.set
          : set // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      unset: freezed == unset
          ? _self.unset
          : unset // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
