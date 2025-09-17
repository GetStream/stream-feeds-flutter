// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedQuery {
  FeedId get fid;
  Filter<ActivitiesFilterField>? get activityFilter;
  int? get activityLimit;
  String? get activityNext;
  String? get activityPrevious;
  Map<String, Object>? get activitySelectorOptions;
  FeedInputData? get data;
  Map<String, Object>? get externalRanking;
  int? get followerLimit;
  int? get followingLimit;
  Map<String, double>? get interestWeights;
  int? get memberLimit;
  String? get view;
  bool get watch;

  /// Create a copy of FeedQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedQueryCopyWith<FeedQuery> get copyWith =>
      _$FeedQueryCopyWithImpl<FeedQuery>(this as FeedQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedQuery &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.activityFilter, activityFilter) ||
                other.activityFilter == activityFilter) &&
            (identical(other.activityLimit, activityLimit) ||
                other.activityLimit == activityLimit) &&
            (identical(other.activityNext, activityNext) ||
                other.activityNext == activityNext) &&
            (identical(other.activityPrevious, activityPrevious) ||
                other.activityPrevious == activityPrevious) &&
            const DeepCollectionEquality().equals(
                other.activitySelectorOptions, activitySelectorOptions) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality()
                .equals(other.externalRanking, externalRanking) &&
            (identical(other.followerLimit, followerLimit) ||
                other.followerLimit == followerLimit) &&
            (identical(other.followingLimit, followingLimit) ||
                other.followingLimit == followingLimit) &&
            const DeepCollectionEquality()
                .equals(other.interestWeights, interestWeights) &&
            (identical(other.memberLimit, memberLimit) ||
                other.memberLimit == memberLimit) &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.watch, watch) || other.watch == watch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fid,
      activityFilter,
      activityLimit,
      activityNext,
      activityPrevious,
      const DeepCollectionEquality().hash(activitySelectorOptions),
      data,
      const DeepCollectionEquality().hash(externalRanking),
      followerLimit,
      followingLimit,
      const DeepCollectionEquality().hash(interestWeights),
      memberLimit,
      view,
      watch);

  @override
  String toString() {
    return 'FeedQuery(fid: $fid, activityFilter: $activityFilter, activityLimit: $activityLimit, activityNext: $activityNext, activityPrevious: $activityPrevious, activitySelectorOptions: $activitySelectorOptions, data: $data, externalRanking: $externalRanking, followerLimit: $followerLimit, followingLimit: $followingLimit, interestWeights: $interestWeights, memberLimit: $memberLimit, view: $view, watch: $watch)';
  }
}

/// @nodoc
abstract mixin class $FeedQueryCopyWith<$Res> {
  factory $FeedQueryCopyWith(FeedQuery value, $Res Function(FeedQuery) _then) =
      _$FeedQueryCopyWithImpl;
  @useResult
  $Res call(
      {FeedId fid,
      Filter<ActivitiesFilterField>? activityFilter,
      int? activityLimit,
      String? activityNext,
      String? activityPrevious,
      Map<String, Object>? activitySelectorOptions,
      FeedInputData? data,
      Map<String, Object>? externalRanking,
      int? followerLimit,
      int? followingLimit,
      Map<String, double>? interestWeights,
      int? memberLimit,
      String? view,
      bool watch});
}

/// @nodoc
class _$FeedQueryCopyWithImpl<$Res> implements $FeedQueryCopyWith<$Res> {
  _$FeedQueryCopyWithImpl(this._self, this._then);

  final FeedQuery _self;
  final $Res Function(FeedQuery) _then;

  /// Create a copy of FeedQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fid = null,
    Object? activityFilter = freezed,
    Object? activityLimit = freezed,
    Object? activityNext = freezed,
    Object? activityPrevious = freezed,
    Object? activitySelectorOptions = freezed,
    Object? data = freezed,
    Object? externalRanking = freezed,
    Object? followerLimit = freezed,
    Object? followingLimit = freezed,
    Object? interestWeights = freezed,
    Object? memberLimit = freezed,
    Object? view = freezed,
    Object? watch = null,
  }) {
    return _then(FeedQuery(
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as FeedId,
      activityFilter: freezed == activityFilter
          ? _self.activityFilter
          : activityFilter // ignore: cast_nullable_to_non_nullable
              as Filter<ActivitiesFilterField>?,
      activityLimit: freezed == activityLimit
          ? _self.activityLimit
          : activityLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      activityNext: freezed == activityNext
          ? _self.activityNext
          : activityNext // ignore: cast_nullable_to_non_nullable
              as String?,
      activityPrevious: freezed == activityPrevious
          ? _self.activityPrevious
          : activityPrevious // ignore: cast_nullable_to_non_nullable
              as String?,
      activitySelectorOptions: freezed == activitySelectorOptions
          ? _self.activitySelectorOptions
          : activitySelectorOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as FeedInputData?,
      externalRanking: freezed == externalRanking
          ? _self.externalRanking
          : externalRanking // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      followerLimit: freezed == followerLimit
          ? _self.followerLimit
          : followerLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      followingLimit: freezed == followingLimit
          ? _self.followingLimit
          : followingLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      interestWeights: freezed == interestWeights
          ? _self.interestWeights
          : interestWeights // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      memberLimit: freezed == memberLimit
          ? _self.memberLimit
          : memberLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
      watch: null == watch
          ? _self.watch
          : watch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
