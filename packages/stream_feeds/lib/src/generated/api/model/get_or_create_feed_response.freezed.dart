// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_or_create_feed_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetOrCreateFeedResponse {
  List<ActivityResponse> get activities;
  List<AggregatedActivityResponse> get aggregatedActivities;
  bool get created;
  String get duration;
  FeedResponse get feed;
  List<FollowResponse> get followers;
  PagerResponse? get followersPagination;
  List<FollowResponse> get following;
  PagerResponse? get followingPagination;
  PagerResponse? get memberPagination;
  List<FeedMemberResponse> get members;
  String? get next;
  NotificationStatusResponse? get notificationStatus;
  List<FeedOwnCapability> get ownCapabilities;
  List<FollowResponse>? get ownFollows;
  FeedMemberResponse? get ownMembership;
  List<ActivityPinResponse> get pinnedActivities;
  String? get prev;

  /// Create a copy of GetOrCreateFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetOrCreateFeedResponseCopyWith<GetOrCreateFeedResponse> get copyWith =>
      _$GetOrCreateFeedResponseCopyWithImpl<GetOrCreateFeedResponse>(
          this as GetOrCreateFeedResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetOrCreateFeedResponse &&
            const DeepCollectionEquality()
                .equals(other.activities, activities) &&
            const DeepCollectionEquality()
                .equals(other.aggregatedActivities, aggregatedActivities) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            const DeepCollectionEquality().equals(other.followers, followers) &&
            (identical(other.followersPagination, followersPagination) ||
                other.followersPagination == followersPagination) &&
            const DeepCollectionEquality().equals(other.following, following) &&
            (identical(other.followingPagination, followingPagination) ||
                other.followingPagination == followingPagination) &&
            (identical(other.memberPagination, memberPagination) ||
                other.memberPagination == memberPagination) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.notificationStatus, notificationStatus) ||
                other.notificationStatus == notificationStatus) &&
            const DeepCollectionEquality()
                .equals(other.ownCapabilities, ownCapabilities) &&
            const DeepCollectionEquality()
                .equals(other.ownFollows, ownFollows) &&
            (identical(other.ownMembership, ownMembership) ||
                other.ownMembership == ownMembership) &&
            const DeepCollectionEquality()
                .equals(other.pinnedActivities, pinnedActivities) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activities),
      const DeepCollectionEquality().hash(aggregatedActivities),
      created,
      duration,
      feed,
      const DeepCollectionEquality().hash(followers),
      followersPagination,
      const DeepCollectionEquality().hash(following),
      followingPagination,
      memberPagination,
      const DeepCollectionEquality().hash(members),
      next,
      notificationStatus,
      const DeepCollectionEquality().hash(ownCapabilities),
      const DeepCollectionEquality().hash(ownFollows),
      ownMembership,
      const DeepCollectionEquality().hash(pinnedActivities),
      prev);

  @override
  String toString() {
    return 'GetOrCreateFeedResponse(activities: $activities, aggregatedActivities: $aggregatedActivities, created: $created, duration: $duration, feed: $feed, followers: $followers, followersPagination: $followersPagination, following: $following, followingPagination: $followingPagination, memberPagination: $memberPagination, members: $members, next: $next, notificationStatus: $notificationStatus, ownCapabilities: $ownCapabilities, ownFollows: $ownFollows, ownMembership: $ownMembership, pinnedActivities: $pinnedActivities, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $GetOrCreateFeedResponseCopyWith<$Res> {
  factory $GetOrCreateFeedResponseCopyWith(GetOrCreateFeedResponse value,
          $Res Function(GetOrCreateFeedResponse) _then) =
      _$GetOrCreateFeedResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<ActivityResponse> activities,
      List<AggregatedActivityResponse> aggregatedActivities,
      bool created,
      String duration,
      FeedResponse feed,
      List<FollowResponse> followers,
      PagerResponse? followersPagination,
      List<FollowResponse> following,
      PagerResponse? followingPagination,
      PagerResponse? memberPagination,
      List<FeedMemberResponse> members,
      String? next,
      NotificationStatusResponse? notificationStatus,
      List<FeedOwnCapability> ownCapabilities,
      List<FollowResponse>? ownFollows,
      FeedMemberResponse? ownMembership,
      List<ActivityPinResponse> pinnedActivities,
      String? prev});
}

/// @nodoc
class _$GetOrCreateFeedResponseCopyWithImpl<$Res>
    implements $GetOrCreateFeedResponseCopyWith<$Res> {
  _$GetOrCreateFeedResponseCopyWithImpl(this._self, this._then);

  final GetOrCreateFeedResponse _self;
  final $Res Function(GetOrCreateFeedResponse) _then;

  /// Create a copy of GetOrCreateFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
    Object? aggregatedActivities = null,
    Object? created = null,
    Object? duration = null,
    Object? feed = null,
    Object? followers = null,
    Object? followersPagination = freezed,
    Object? following = null,
    Object? followingPagination = freezed,
    Object? memberPagination = freezed,
    Object? members = null,
    Object? next = freezed,
    Object? notificationStatus = freezed,
    Object? ownCapabilities = null,
    Object? ownFollows = freezed,
    Object? ownMembership = freezed,
    Object? pinnedActivities = null,
    Object? prev = freezed,
  }) {
    return _then(GetOrCreateFeedResponse(
      activities: null == activities
          ? _self.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<ActivityResponse>,
      aggregatedActivities: null == aggregatedActivities
          ? _self.aggregatedActivities
          : aggregatedActivities // ignore: cast_nullable_to_non_nullable
              as List<AggregatedActivityResponse>,
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      feed: null == feed
          ? _self.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as FeedResponse,
      followers: null == followers
          ? _self.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<FollowResponse>,
      followersPagination: freezed == followersPagination
          ? _self.followersPagination
          : followersPagination // ignore: cast_nullable_to_non_nullable
              as PagerResponse?,
      following: null == following
          ? _self.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<FollowResponse>,
      followingPagination: freezed == followingPagination
          ? _self.followingPagination
          : followingPagination // ignore: cast_nullable_to_non_nullable
              as PagerResponse?,
      memberPagination: freezed == memberPagination
          ? _self.memberPagination
          : memberPagination // ignore: cast_nullable_to_non_nullable
              as PagerResponse?,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<FeedMemberResponse>,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationStatus: freezed == notificationStatus
          ? _self.notificationStatus
          : notificationStatus // ignore: cast_nullable_to_non_nullable
              as NotificationStatusResponse?,
      ownCapabilities: null == ownCapabilities
          ? _self.ownCapabilities
          : ownCapabilities // ignore: cast_nullable_to_non_nullable
              as List<FeedOwnCapability>,
      ownFollows: freezed == ownFollows
          ? _self.ownFollows
          : ownFollows // ignore: cast_nullable_to_non_nullable
              as List<FollowResponse>?,
      ownMembership: freezed == ownMembership
          ? _self.ownMembership
          : ownMembership // ignore: cast_nullable_to_non_nullable
              as FeedMemberResponse?,
      pinnedActivities: null == pinnedActivities
          ? _self.pinnedActivities
          : pinnedActivities // ignore: cast_nullable_to_non_nullable
              as List<ActivityPinResponse>,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
