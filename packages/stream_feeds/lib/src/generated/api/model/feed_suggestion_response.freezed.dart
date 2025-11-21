// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_suggestion_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedSuggestionResponse {
  Map<String, double>? get algorithmScores;
  DateTime get createdAt;
  UserResponse get createdBy;
  Map<String, Object?>? get custom;
  DateTime? get deletedAt;
  String get description;
  String get feed;
  List<String>? get filterTags;
  int get followerCount;
  int get followingCount;
  String get groupId;
  String get id;
  int get memberCount;
  String get name;
  List<FeedOwnCapability>? get ownCapabilities;
  List<FollowResponse>? get ownFollows;
  FeedMemberResponse? get ownMembership;
  int get pinCount;
  String? get reason;
  double? get recommendationScore;
  DateTime get updatedAt;
  String? get visibility;

  /// Create a copy of FeedSuggestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedSuggestionResponseCopyWith<FeedSuggestionResponse> get copyWith =>
      _$FeedSuggestionResponseCopyWithImpl<FeedSuggestionResponse>(
          this as FeedSuggestionResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedSuggestionResponse &&
            const DeepCollectionEquality()
                .equals(other.algorithmScores, algorithmScores) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.ownCapabilities, ownCapabilities) &&
            const DeepCollectionEquality()
                .equals(other.ownFollows, ownFollows) &&
            (identical(other.ownMembership, ownMembership) ||
                other.ownMembership == ownMembership) &&
            (identical(other.pinCount, pinCount) ||
                other.pinCount == pinCount) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.recommendationScore, recommendationScore) ||
                other.recommendationScore == recommendationScore) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(algorithmScores),
        createdAt,
        createdBy,
        const DeepCollectionEquality().hash(custom),
        deletedAt,
        description,
        feed,
        const DeepCollectionEquality().hash(filterTags),
        followerCount,
        followingCount,
        groupId,
        id,
        memberCount,
        name,
        const DeepCollectionEquality().hash(ownCapabilities),
        const DeepCollectionEquality().hash(ownFollows),
        ownMembership,
        pinCount,
        reason,
        recommendationScore,
        updatedAt,
        visibility
      ]);

  @override
  String toString() {
    return 'FeedSuggestionResponse(algorithmScores: $algorithmScores, createdAt: $createdAt, createdBy: $createdBy, custom: $custom, deletedAt: $deletedAt, description: $description, feed: $feed, filterTags: $filterTags, followerCount: $followerCount, followingCount: $followingCount, groupId: $groupId, id: $id, memberCount: $memberCount, name: $name, ownCapabilities: $ownCapabilities, ownFollows: $ownFollows, ownMembership: $ownMembership, pinCount: $pinCount, reason: $reason, recommendationScore: $recommendationScore, updatedAt: $updatedAt, visibility: $visibility)';
  }
}

/// @nodoc
abstract mixin class $FeedSuggestionResponseCopyWith<$Res> {
  factory $FeedSuggestionResponseCopyWith(FeedSuggestionResponse value,
          $Res Function(FeedSuggestionResponse) _then) =
      _$FeedSuggestionResponseCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, double>? algorithmScores,
      DateTime createdAt,
      UserResponse createdBy,
      Map<String, Object?>? custom,
      DateTime? deletedAt,
      String description,
      String feed,
      List<String>? filterTags,
      int followerCount,
      int followingCount,
      String groupId,
      String id,
      int memberCount,
      String name,
      List<FeedOwnCapability>? ownCapabilities,
      List<FollowResponse>? ownFollows,
      FeedMemberResponse? ownMembership,
      int pinCount,
      String? reason,
      double? recommendationScore,
      DateTime updatedAt,
      String? visibility});
}

/// @nodoc
class _$FeedSuggestionResponseCopyWithImpl<$Res>
    implements $FeedSuggestionResponseCopyWith<$Res> {
  _$FeedSuggestionResponseCopyWithImpl(this._self, this._then);

  final FeedSuggestionResponse _self;
  final $Res Function(FeedSuggestionResponse) _then;

  /// Create a copy of FeedSuggestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? algorithmScores = freezed,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? custom = freezed,
    Object? deletedAt = freezed,
    Object? description = null,
    Object? feed = null,
    Object? filterTags = freezed,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? groupId = null,
    Object? id = null,
    Object? memberCount = null,
    Object? name = null,
    Object? ownCapabilities = freezed,
    Object? ownFollows = freezed,
    Object? ownMembership = freezed,
    Object? pinCount = null,
    Object? reason = freezed,
    Object? recommendationScore = freezed,
    Object? updatedAt = null,
    Object? visibility = freezed,
  }) {
    return _then(FeedSuggestionResponse(
      algorithmScores: freezed == algorithmScores
          ? _self.algorithmScores
          : algorithmScores // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserResponse,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      feed: null == feed
          ? _self.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as String,
      filterTags: freezed == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followerCount: null == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _self.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      memberCount: null == memberCount
          ? _self.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownCapabilities: freezed == ownCapabilities
          ? _self.ownCapabilities
          : ownCapabilities // ignore: cast_nullable_to_non_nullable
              as List<FeedOwnCapability>?,
      ownFollows: freezed == ownFollows
          ? _self.ownFollows
          : ownFollows // ignore: cast_nullable_to_non_nullable
              as List<FollowResponse>?,
      ownMembership: freezed == ownMembership
          ? _self.ownMembership
          : ownMembership // ignore: cast_nullable_to_non_nullable
              as FeedMemberResponse?,
      pinCount: null == pinCount
          ? _self.pinCount
          : pinCount // ignore: cast_nullable_to_non_nullable
              as int,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendationScore: freezed == recommendationScore
          ? _self.recommendationScore
          : recommendationScore // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visibility: freezed == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
