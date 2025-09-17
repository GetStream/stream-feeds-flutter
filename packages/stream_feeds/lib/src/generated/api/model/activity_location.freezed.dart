// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityLocation {
  double get lat;
  double get lng;

  /// Create a copy of ActivityLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityLocationCopyWith<ActivityLocation> get copyWith =>
      _$ActivityLocationCopyWithImpl<ActivityLocation>(
          this as ActivityLocation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityLocation &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @override
  String toString() {
    return 'ActivityLocation(lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class $ActivityLocationCopyWith<$Res> {
  factory $ActivityLocationCopyWith(
          ActivityLocation value, $Res Function(ActivityLocation) _then) =
      _$ActivityLocationCopyWithImpl;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$ActivityLocationCopyWithImpl<$Res>
    implements $ActivityLocationCopyWith<$Res> {
  _$ActivityLocationCopyWithImpl(this._self, this._then);

  final ActivityLocation _self;
  final $Res Function(ActivityLocation) _then;

  /// Create a copy of ActivityLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(ActivityLocation(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
