// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FCM {
  Map<String, Object?>? get data;

  /// Create a copy of FCM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FCMCopyWith<FCM> get copyWith =>
      _$FCMCopyWithImpl<FCM>(this as FCM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FCM &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'FCM(data: $data)';
  }
}

/// @nodoc
abstract mixin class $FCMCopyWith<$Res> {
  factory $FCMCopyWith(FCM value, $Res Function(FCM) _then) = _$FCMCopyWithImpl;
  @useResult
  $Res call({Map<String, Object?>? data});
}

/// @nodoc
class _$FCMCopyWithImpl<$Res> implements $FCMCopyWith<$Res> {
  _$FCMCopyWithImpl(this._self, this._then);

  final FCM _self;
  final $Res Function(FCM) _then;

  /// Create a copy of FCM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(FCM(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

// dart format on
