// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_or_create_feed_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetOrCreateFeedData {
  PaginationResult<ActivityData> get activities;
  List<AggregatedActivityData> get aggregatedActivities;
  QueryConfiguration<ActivityData> get activitiesQueryConfig;
  FeedData get feed;
  List<FollowData> get followers;
  List<FollowData> get following;
  List<FollowData> get followRequests;
  PaginationResult<FeedMemberData> get members;
  List<ActivityPinData> get pinnedActivities;
  NotificationStatusResponse? get notificationStatus;

  /// Create a copy of GetOrCreateFeedData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetOrCreateFeedDataCopyWith<GetOrCreateFeedData> get copyWith =>
      _$GetOrCreateFeedDataCopyWithImpl<GetOrCreateFeedData>(
          this as GetOrCreateFeedData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetOrCreateFeedData &&
            (identical(other.activities, activities) ||
                other.activities == activities) &&
            const DeepCollectionEquality()
                .equals(other.aggregatedActivities, aggregatedActivities) &&
            (identical(other.activitiesQueryConfig, activitiesQueryConfig) ||
                other.activitiesQueryConfig == activitiesQueryConfig) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            const DeepCollectionEquality().equals(other.followers, followers) &&
            const DeepCollectionEquality().equals(other.following, following) &&
            const DeepCollectionEquality()
                .equals(other.followRequests, followRequests) &&
            (identical(other.members, members) || other.members == members) &&
            const DeepCollectionEquality()
                .equals(other.pinnedActivities, pinnedActivities) &&
            (identical(other.notificationStatus, notificationStatus) ||
                other.notificationStatus == notificationStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      activities,
      const DeepCollectionEquality().hash(aggregatedActivities),
      activitiesQueryConfig,
      feed,
      const DeepCollectionEquality().hash(followers),
      const DeepCollectionEquality().hash(following),
      const DeepCollectionEquality().hash(followRequests),
      members,
      const DeepCollectionEquality().hash(pinnedActivities),
      notificationStatus);

  @override
  String toString() {
    return 'GetOrCreateFeedData(activities: $activities, aggregatedActivities: $aggregatedActivities, activitiesQueryConfig: $activitiesQueryConfig, feed: $feed, followers: $followers, following: $following, followRequests: $followRequests, members: $members, pinnedActivities: $pinnedActivities, notificationStatus: $notificationStatus)';
  }
}

/// @nodoc
abstract mixin class $GetOrCreateFeedDataCopyWith<$Res> {
  factory $GetOrCreateFeedDataCopyWith(
          GetOrCreateFeedData value, $Res Function(GetOrCreateFeedData) _then) =
      _$GetOrCreateFeedDataCopyWithImpl;
  @useResult
  $Res call(
      {PaginationResult<ActivityData> activities,
      QueryConfiguration<ActivityData> activitiesQueryConfig,
      FeedData feed,
      List<FollowData> followers,
      List<FollowData> following,
      List<FollowData> followRequests,
      PaginationResult<FeedMemberData> members,
      List<ActivityPinData> pinnedActivities,
      List<AggregatedActivityData> aggregatedActivities,
      NotificationStatusResponse? notificationStatus});
}

/// @nodoc
class _$GetOrCreateFeedDataCopyWithImpl<$Res>
    implements $GetOrCreateFeedDataCopyWith<$Res> {
  _$GetOrCreateFeedDataCopyWithImpl(this._self, this._then);

  final GetOrCreateFeedData _self;
  final $Res Function(GetOrCreateFeedData) _then;

  /// Create a copy of GetOrCreateFeedData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
    Object? activitiesQueryConfig = null,
    Object? feed = null,
    Object? followers = null,
    Object? following = null,
    Object? followRequests = null,
    Object? members = null,
    Object? pinnedActivities = null,
    Object? aggregatedActivities = null,
    Object? notificationStatus = freezed,
  }) {
    return _then(GetOrCreateFeedData(
      activities: null == activities
          ? _self.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as PaginationResult<ActivityData>,
      activitiesQueryConfig: null == activitiesQueryConfig
          ? _self.activitiesQueryConfig
          : activitiesQueryConfig // ignore: cast_nullable_to_non_nullable
              as QueryConfiguration<ActivityData>,
      feed: null == feed
          ? _self.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as FeedData,
      followers: null == followers
          ? _self.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<FollowData>,
      following: null == following
          ? _self.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<FollowData>,
      followRequests: null == followRequests
          ? _self.followRequests
          : followRequests // ignore: cast_nullable_to_non_nullable
              as List<FollowData>,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as PaginationResult<FeedMemberData>,
      pinnedActivities: null == pinnedActivities
          ? _self.pinnedActivities
          : pinnedActivities // ignore: cast_nullable_to_non_nullable
              as List<ActivityPinData>,
      aggregatedActivities: null == aggregatedActivities
          ? _self.aggregatedActivities
          : aggregatedActivities // ignore: cast_nullable_to_non_nullable
              as List<AggregatedActivityData>,
      notificationStatus: freezed == notificationStatus
          ? _self.notificationStatus
          : notificationStatus // ignore: cast_nullable_to_non_nullable
              as NotificationStatusResponse?,
    ));
  }
}

// dart format on
