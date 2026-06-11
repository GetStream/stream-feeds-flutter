// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_filter_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityFilterConfig {
  bool get excludeOwnerActivities;

  /// Create a copy of ActivityFilterConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityFilterConfigCopyWith<ActivityFilterConfig> get copyWith =>
      _$ActivityFilterConfigCopyWithImpl<ActivityFilterConfig>(
        this as ActivityFilterConfig,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityFilterConfig &&
            (identical(other.excludeOwnerActivities, excludeOwnerActivities) ||
                other.excludeOwnerActivities == excludeOwnerActivities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, excludeOwnerActivities);

  @override
  String toString() {
    return 'ActivityFilterConfig(excludeOwnerActivities: $excludeOwnerActivities)';
  }
}

/// @nodoc
abstract mixin class $ActivityFilterConfigCopyWith<$Res> {
  factory $ActivityFilterConfigCopyWith(
    ActivityFilterConfig value,
    $Res Function(ActivityFilterConfig) _then,
  ) = _$ActivityFilterConfigCopyWithImpl;
  @useResult
  $Res call({bool excludeOwnerActivities});
}

/// @nodoc
class _$ActivityFilterConfigCopyWithImpl<$Res> implements $ActivityFilterConfigCopyWith<$Res> {
  _$ActivityFilterConfigCopyWithImpl(this._self, this._then);

  final ActivityFilterConfig _self;
  final $Res Function(ActivityFilterConfig) _then;

  /// Create a copy of ActivityFilterConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? excludeOwnerActivities = null}) {
    return _then(
      ActivityFilterConfig(
        excludeOwnerActivities: null == excludeOwnerActivities
            ? _self.excludeOwnerActivities
            : excludeOwnerActivities // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
