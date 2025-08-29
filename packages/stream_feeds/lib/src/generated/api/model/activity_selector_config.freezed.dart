// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_selector_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivitySelectorConfig {
  DateTime get cutoffTime;
  Map<String, Object?>? get filter;
  int? get minPopularity;
  List<SortParam>? get sort;
  String? get type;

  /// Create a copy of ActivitySelectorConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivitySelectorConfigCopyWith<ActivitySelectorConfig> get copyWith =>
      _$ActivitySelectorConfigCopyWithImpl<ActivitySelectorConfig>(
          this as ActivitySelectorConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivitySelectorConfig &&
            (identical(other.cutoffTime, cutoffTime) ||
                other.cutoffTime == cutoffTime) &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            (identical(other.minPopularity, minPopularity) ||
                other.minPopularity == minPopularity) &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cutoffTime,
      const DeepCollectionEquality().hash(filter),
      minPopularity,
      const DeepCollectionEquality().hash(sort),
      type);

  @override
  String toString() {
    return 'ActivitySelectorConfig(cutoffTime: $cutoffTime, filter: $filter, minPopularity: $minPopularity, sort: $sort, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ActivitySelectorConfigCopyWith<$Res> {
  factory $ActivitySelectorConfigCopyWith(ActivitySelectorConfig value,
          $Res Function(ActivitySelectorConfig) _then) =
      _$ActivitySelectorConfigCopyWithImpl;
  @useResult
  $Res call(
      {DateTime cutoffTime,
      Map<String, Object?>? filter,
      int? minPopularity,
      List<SortParam>? sort,
      String? type});
}

/// @nodoc
class _$ActivitySelectorConfigCopyWithImpl<$Res>
    implements $ActivitySelectorConfigCopyWith<$Res> {
  _$ActivitySelectorConfigCopyWithImpl(this._self, this._then);

  final ActivitySelectorConfig _self;
  final $Res Function(ActivitySelectorConfig) _then;

  /// Create a copy of ActivitySelectorConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cutoffTime = null,
    Object? filter = freezed,
    Object? minPopularity = freezed,
    Object? sort = freezed,
    Object? type = freezed,
  }) {
    return _then(ActivitySelectorConfig(
      cutoffTime: null == cutoffTime
          ? _self.cutoffTime
          : cutoffTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      minPopularity: freezed == minPopularity
          ? _self.minPopularity
          : minPopularity // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<SortParam>?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
