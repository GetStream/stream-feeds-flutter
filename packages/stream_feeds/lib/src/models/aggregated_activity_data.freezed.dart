// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aggregated_activity_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AggregatedActivityData {
  List<ActivityData> get activities;
  int get activityCount;
  DateTime get createdAt;
  String get group;
  double get score;
  DateTime get updatedAt;
  int get userCount;

  /// Create a copy of AggregatedActivityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AggregatedActivityDataCopyWith<AggregatedActivityData> get copyWith =>
      _$AggregatedActivityDataCopyWithImpl<AggregatedActivityData>(
          this as AggregatedActivityData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AggregatedActivityData &&
            const DeepCollectionEquality()
                .equals(other.activities, activities) &&
            (identical(other.activityCount, activityCount) ||
                other.activityCount == activityCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activities),
      activityCount,
      createdAt,
      group,
      score,
      updatedAt,
      userCount);

  @override
  String toString() {
    return 'AggregatedActivityData(activities: $activities, activityCount: $activityCount, createdAt: $createdAt, group: $group, score: $score, updatedAt: $updatedAt, userCount: $userCount)';
  }
}

/// @nodoc
abstract mixin class $AggregatedActivityDataCopyWith<$Res> {
  factory $AggregatedActivityDataCopyWith(AggregatedActivityData value,
          $Res Function(AggregatedActivityData) _then) =
      _$AggregatedActivityDataCopyWithImpl;
  @useResult
  $Res call(
      {List<ActivityData> activities,
      int activityCount,
      DateTime createdAt,
      String group,
      double score,
      DateTime updatedAt,
      int userCount});
}

/// @nodoc
class _$AggregatedActivityDataCopyWithImpl<$Res>
    implements $AggregatedActivityDataCopyWith<$Res> {
  _$AggregatedActivityDataCopyWithImpl(this._self, this._then);

  final AggregatedActivityData _self;
  final $Res Function(AggregatedActivityData) _then;

  /// Create a copy of AggregatedActivityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
    Object? activityCount = null,
    Object? createdAt = null,
    Object? group = null,
    Object? score = null,
    Object? updatedAt = null,
    Object? userCount = null,
  }) {
    return _then(AggregatedActivityData(
      activities: null == activities
          ? _self.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<ActivityData>,
      activityCount: null == activityCount
          ? _self.activityCount
          : activityCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      group: null == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userCount: null == userCount
          ? _self.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
