// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aggregation_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AggregationConfig {
  String? get activitiesSort;
  String? get format;
  int? get groupSize;
  String? get scoreStrategy;

  /// Create a copy of AggregationConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AggregationConfigCopyWith<AggregationConfig> get copyWith => _$AggregationConfigCopyWithImpl<AggregationConfig>(
    this as AggregationConfig,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AggregationConfig &&
            (identical(other.activitiesSort, activitiesSort) || other.activitiesSort == activitiesSort) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.groupSize, groupSize) || other.groupSize == groupSize) &&
            (identical(other.scoreStrategy, scoreStrategy) || other.scoreStrategy == scoreStrategy));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activitiesSort,
    format,
    groupSize,
    scoreStrategy,
  );

  @override
  String toString() {
    return 'AggregationConfig(activitiesSort: $activitiesSort, format: $format, groupSize: $groupSize, scoreStrategy: $scoreStrategy)';
  }
}

/// @nodoc
abstract mixin class $AggregationConfigCopyWith<$Res> {
  factory $AggregationConfigCopyWith(
    AggregationConfig value,
    $Res Function(AggregationConfig) _then,
  ) = _$AggregationConfigCopyWithImpl;
  @useResult
  $Res call({
    String? activitiesSort,
    String? format,
    int? groupSize,
    String? scoreStrategy,
  });
}

/// @nodoc
class _$AggregationConfigCopyWithImpl<$Res> implements $AggregationConfigCopyWith<$Res> {
  _$AggregationConfigCopyWithImpl(this._self, this._then);

  final AggregationConfig _self;
  final $Res Function(AggregationConfig) _then;

  /// Create a copy of AggregationConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activitiesSort = freezed,
    Object? format = freezed,
    Object? groupSize = freezed,
    Object? scoreStrategy = freezed,
  }) {
    return _then(
      AggregationConfig(
        activitiesSort: freezed == activitiesSort
            ? _self.activitiesSort
            : activitiesSort // ignore: cast_nullable_to_non_nullable
                  as String?,
        format: freezed == format
            ? _self.format
            : format // ignore: cast_nullable_to_non_nullable
                  as String?,
        groupSize: freezed == groupSize
            ? _self.groupSize
            : groupSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        scoreStrategy: freezed == scoreStrategy
            ? _self.scoreStrategy
            : scoreStrategy // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
