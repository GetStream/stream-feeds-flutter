// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aggregated_activity_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AggregatedActivityResponse {
  List<ActivityResponse> get activities;
  int get activityCount;
  DateTime get createdAt;
  String get group;
  bool? get isWatched;
  double get score;
  DateTime get updatedAt;
  int get userCount;
  bool get userCountTruncated;

  /// Create a copy of AggregatedActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AggregatedActivityResponseCopyWith<AggregatedActivityResponse>
      get copyWith =>
          _$AggregatedActivityResponseCopyWithImpl<AggregatedActivityResponse>(
              this as AggregatedActivityResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AggregatedActivityResponse &&
            const DeepCollectionEquality()
                .equals(other.activities, activities) &&
            (identical(other.activityCount, activityCount) ||
                other.activityCount == activityCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.isWatched, isWatched) ||
                other.isWatched == isWatched) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount) &&
            (identical(other.userCountTruncated, userCountTruncated) ||
                other.userCountTruncated == userCountTruncated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activities),
      activityCount,
      createdAt,
      group,
      isWatched,
      score,
      updatedAt,
      userCount,
      userCountTruncated);

  @override
  String toString() {
    return 'AggregatedActivityResponse(activities: $activities, activityCount: $activityCount, createdAt: $createdAt, group: $group, isWatched: $isWatched, score: $score, updatedAt: $updatedAt, userCount: $userCount, userCountTruncated: $userCountTruncated)';
  }
}

/// @nodoc
abstract mixin class $AggregatedActivityResponseCopyWith<$Res> {
  factory $AggregatedActivityResponseCopyWith(AggregatedActivityResponse value,
          $Res Function(AggregatedActivityResponse) _then) =
      _$AggregatedActivityResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<ActivityResponse> activities,
      int activityCount,
      DateTime createdAt,
      String group,
      bool? isWatched,
      double score,
      DateTime updatedAt,
      int userCount,
      bool userCountTruncated});
}

/// @nodoc
class _$AggregatedActivityResponseCopyWithImpl<$Res>
    implements $AggregatedActivityResponseCopyWith<$Res> {
  _$AggregatedActivityResponseCopyWithImpl(this._self, this._then);

  final AggregatedActivityResponse _self;
  final $Res Function(AggregatedActivityResponse) _then;

  /// Create a copy of AggregatedActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
    Object? activityCount = null,
    Object? createdAt = null,
    Object? group = null,
    Object? isWatched = freezed,
    Object? score = null,
    Object? updatedAt = null,
    Object? userCount = null,
    Object? userCountTruncated = null,
  }) {
    return _then(AggregatedActivityResponse(
      activities: null == activities
          ? _self.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<ActivityResponse>,
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
      isWatched: freezed == isWatched
          ? _self.isWatched
          : isWatched // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      userCountTruncated: null == userCountTruncated
          ? _self.userCountTruncated
          : userCountTruncated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
