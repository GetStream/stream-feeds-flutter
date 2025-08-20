// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedState {
  FeedId get fid;
  FeedQuery get feedQuery;
  List<ActivityData> get activities;
  List<AggregatedActivityData> get aggregatedActivities;
  FeedData? get feed;
  List<FollowData> get followers;
  List<FollowData> get following;
  List<FollowData> get followRequests;
  List<FeedMemberData> get members;
  List<api.FeedOwnCapability> get ownCapabilities;
  List<ActivityPinData> get pinnedActivities;
  api.NotificationStatusResponse? get notificationStatus;
  PaginationData? get activitiesPagination;

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedStateCopyWith<FeedState> get copyWith =>
      _$FeedStateCopyWithImpl<FeedState>(this as FeedState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedState &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.feedQuery, feedQuery) ||
                other.feedQuery == feedQuery) &&
            const DeepCollectionEquality()
                .equals(other.activities, activities) &&
            const DeepCollectionEquality()
                .equals(other.aggregatedActivities, aggregatedActivities) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            const DeepCollectionEquality().equals(other.followers, followers) &&
            const DeepCollectionEquality().equals(other.following, following) &&
            const DeepCollectionEquality()
                .equals(other.followRequests, followRequests) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality()
                .equals(other.ownCapabilities, ownCapabilities) &&
            const DeepCollectionEquality()
                .equals(other.pinnedActivities, pinnedActivities) &&
            (identical(other.notificationStatus, notificationStatus) ||
                other.notificationStatus == notificationStatus) &&
            (identical(other.activitiesPagination, activitiesPagination) ||
                other.activitiesPagination == activitiesPagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fid,
      feedQuery,
      const DeepCollectionEquality().hash(activities),
      const DeepCollectionEquality().hash(aggregatedActivities),
      feed,
      const DeepCollectionEquality().hash(followers),
      const DeepCollectionEquality().hash(following),
      const DeepCollectionEquality().hash(followRequests),
      const DeepCollectionEquality().hash(members),
      const DeepCollectionEquality().hash(ownCapabilities),
      const DeepCollectionEquality().hash(pinnedActivities),
      notificationStatus,
      activitiesPagination);

  @override
  String toString() {
    return 'FeedState(fid: $fid, feedQuery: $feedQuery, activities: $activities, aggregatedActivities: $aggregatedActivities, feed: $feed, followers: $followers, following: $following, followRequests: $followRequests, members: $members, ownCapabilities: $ownCapabilities, pinnedActivities: $pinnedActivities, notificationStatus: $notificationStatus, activitiesPagination: $activitiesPagination)';
  }
}

/// @nodoc
abstract mixin class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) _then) =
      _$FeedStateCopyWithImpl;
  @useResult
  $Res call(
      {FeedId fid,
      FeedQuery feedQuery,
      List<ActivityData> activities,
      List<AggregatedActivityData> aggregatedActivities,
      FeedData? feed,
      List<FollowData> followers,
      List<FollowData> following,
      List<FollowData> followRequests,
      List<FeedMemberData> members,
      List<FeedOwnCapability> ownCapabilities,
      List<ActivityPinData> pinnedActivities,
      NotificationStatusResponse? notificationStatus,
      PaginationData? activitiesPagination});
}

/// @nodoc
class _$FeedStateCopyWithImpl<$Res> implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._self, this._then);

  final FeedState _self;
  final $Res Function(FeedState) _then;

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fid = null,
    Object? feedQuery = null,
    Object? activities = null,
    Object? aggregatedActivities = null,
    Object? feed = freezed,
    Object? followers = null,
    Object? following = null,
    Object? followRequests = null,
    Object? members = null,
    Object? ownCapabilities = null,
    Object? pinnedActivities = null,
    Object? notificationStatus = freezed,
    Object? activitiesPagination = freezed,
  }) {
    return _then(FeedState(
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as FeedId,
      feedQuery: null == feedQuery
          ? _self.feedQuery
          : feedQuery // ignore: cast_nullable_to_non_nullable
              as FeedQuery,
      activities: null == activities
          ? _self.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<ActivityData>,
      aggregatedActivities: null == aggregatedActivities
          ? _self.aggregatedActivities
          : aggregatedActivities // ignore: cast_nullable_to_non_nullable
              as List<AggregatedActivityData>,
      feed: freezed == feed
          ? _self.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as FeedData?,
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
              as List<FeedMemberData>,
      ownCapabilities: null == ownCapabilities
          ? _self.ownCapabilities
          : ownCapabilities // ignore: cast_nullable_to_non_nullable
              as List<FeedOwnCapability>,
      pinnedActivities: null == pinnedActivities
          ? _self.pinnedActivities
          : pinnedActivities // ignore: cast_nullable_to_non_nullable
              as List<ActivityPinData>,
      notificationStatus: freezed == notificationStatus
          ? _self.notificationStatus
          : notificationStatus // ignore: cast_nullable_to_non_nullable
              as NotificationStatusResponse?,
      activitiesPagination: freezed == activitiesPagination
          ? _self.activitiesPagination
          : activitiesPagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on
