// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrichment_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EnrichmentOptions {
  bool? get enrichOwnFollowings;
  bool? get includeFlatActivities;
  bool? get includeScoreVars;
  bool? get skipActivity;
  bool? get skipActivityCollections;
  bool? get skipActivityComments;
  bool? get skipActivityCurrentFeed;
  bool? get skipActivityMentionedUsers;
  bool? get skipActivityOwnBookmarks;
  bool? get skipActivityParents;
  bool? get skipActivityPoll;
  bool? get skipActivityReactions;
  bool? get skipActivityRefreshImageUrls;
  bool? get skipAll;
  bool? get skipFeedMemberUser;
  bool? get skipFollowers;
  bool? get skipFollowing;
  bool? get skipOwnCapabilities;
  bool? get skipOwnFollows;
  bool? get skipPins;

  /// Create a copy of EnrichmentOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnrichmentOptionsCopyWith<EnrichmentOptions> get copyWith => _$EnrichmentOptionsCopyWithImpl<EnrichmentOptions>(
    this as EnrichmentOptions,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnrichmentOptions &&
            (identical(other.enrichOwnFollowings, enrichOwnFollowings) ||
                other.enrichOwnFollowings == enrichOwnFollowings) &&
            (identical(other.includeFlatActivities, includeFlatActivities) ||
                other.includeFlatActivities == includeFlatActivities) &&
            (identical(other.includeScoreVars, includeScoreVars) || other.includeScoreVars == includeScoreVars) &&
            (identical(other.skipActivity, skipActivity) || other.skipActivity == skipActivity) &&
            (identical(
                  other.skipActivityCollections,
                  skipActivityCollections,
                ) ||
                other.skipActivityCollections == skipActivityCollections) &&
            (identical(other.skipActivityComments, skipActivityComments) ||
                other.skipActivityComments == skipActivityComments) &&
            (identical(
                  other.skipActivityCurrentFeed,
                  skipActivityCurrentFeed,
                ) ||
                other.skipActivityCurrentFeed == skipActivityCurrentFeed) &&
            (identical(
                  other.skipActivityMentionedUsers,
                  skipActivityMentionedUsers,
                ) ||
                other.skipActivityMentionedUsers == skipActivityMentionedUsers) &&
            (identical(
                  other.skipActivityOwnBookmarks,
                  skipActivityOwnBookmarks,
                ) ||
                other.skipActivityOwnBookmarks == skipActivityOwnBookmarks) &&
            (identical(other.skipActivityParents, skipActivityParents) ||
                other.skipActivityParents == skipActivityParents) &&
            (identical(other.skipActivityPoll, skipActivityPoll) || other.skipActivityPoll == skipActivityPoll) &&
            (identical(other.skipActivityReactions, skipActivityReactions) ||
                other.skipActivityReactions == skipActivityReactions) &&
            (identical(
                  other.skipActivityRefreshImageUrls,
                  skipActivityRefreshImageUrls,
                ) ||
                other.skipActivityRefreshImageUrls == skipActivityRefreshImageUrls) &&
            (identical(other.skipAll, skipAll) || other.skipAll == skipAll) &&
            (identical(other.skipFeedMemberUser, skipFeedMemberUser) ||
                other.skipFeedMemberUser == skipFeedMemberUser) &&
            (identical(other.skipFollowers, skipFollowers) || other.skipFollowers == skipFollowers) &&
            (identical(other.skipFollowing, skipFollowing) || other.skipFollowing == skipFollowing) &&
            (identical(other.skipOwnCapabilities, skipOwnCapabilities) ||
                other.skipOwnCapabilities == skipOwnCapabilities) &&
            (identical(other.skipOwnFollows, skipOwnFollows) || other.skipOwnFollows == skipOwnFollows) &&
            (identical(other.skipPins, skipPins) || other.skipPins == skipPins));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    enrichOwnFollowings,
    includeFlatActivities,
    includeScoreVars,
    skipActivity,
    skipActivityCollections,
    skipActivityComments,
    skipActivityCurrentFeed,
    skipActivityMentionedUsers,
    skipActivityOwnBookmarks,
    skipActivityParents,
    skipActivityPoll,
    skipActivityReactions,
    skipActivityRefreshImageUrls,
    skipAll,
    skipFeedMemberUser,
    skipFollowers,
    skipFollowing,
    skipOwnCapabilities,
    skipOwnFollows,
    skipPins,
  ]);

  @override
  String toString() {
    return 'EnrichmentOptions(enrichOwnFollowings: $enrichOwnFollowings, includeFlatActivities: $includeFlatActivities, includeScoreVars: $includeScoreVars, skipActivity: $skipActivity, skipActivityCollections: $skipActivityCollections, skipActivityComments: $skipActivityComments, skipActivityCurrentFeed: $skipActivityCurrentFeed, skipActivityMentionedUsers: $skipActivityMentionedUsers, skipActivityOwnBookmarks: $skipActivityOwnBookmarks, skipActivityParents: $skipActivityParents, skipActivityPoll: $skipActivityPoll, skipActivityReactions: $skipActivityReactions, skipActivityRefreshImageUrls: $skipActivityRefreshImageUrls, skipAll: $skipAll, skipFeedMemberUser: $skipFeedMemberUser, skipFollowers: $skipFollowers, skipFollowing: $skipFollowing, skipOwnCapabilities: $skipOwnCapabilities, skipOwnFollows: $skipOwnFollows, skipPins: $skipPins)';
  }
}

/// @nodoc
abstract mixin class $EnrichmentOptionsCopyWith<$Res> {
  factory $EnrichmentOptionsCopyWith(
    EnrichmentOptions value,
    $Res Function(EnrichmentOptions) _then,
  ) = _$EnrichmentOptionsCopyWithImpl;
  @useResult
  $Res call({
    bool? enrichOwnFollowings,
    bool? includeFlatActivities,
    bool? includeScoreVars,
    bool? skipActivity,
    bool? skipActivityCollections,
    bool? skipActivityComments,
    bool? skipActivityCurrentFeed,
    bool? skipActivityMentionedUsers,
    bool? skipActivityOwnBookmarks,
    bool? skipActivityParents,
    bool? skipActivityPoll,
    bool? skipActivityReactions,
    bool? skipActivityRefreshImageUrls,
    bool? skipAll,
    bool? skipFeedMemberUser,
    bool? skipFollowers,
    bool? skipFollowing,
    bool? skipOwnCapabilities,
    bool? skipOwnFollows,
    bool? skipPins,
  });
}

/// @nodoc
class _$EnrichmentOptionsCopyWithImpl<$Res> implements $EnrichmentOptionsCopyWith<$Res> {
  _$EnrichmentOptionsCopyWithImpl(this._self, this._then);

  final EnrichmentOptions _self;
  final $Res Function(EnrichmentOptions) _then;

  /// Create a copy of EnrichmentOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrichOwnFollowings = freezed,
    Object? includeFlatActivities = freezed,
    Object? includeScoreVars = freezed,
    Object? skipActivity = freezed,
    Object? skipActivityCollections = freezed,
    Object? skipActivityComments = freezed,
    Object? skipActivityCurrentFeed = freezed,
    Object? skipActivityMentionedUsers = freezed,
    Object? skipActivityOwnBookmarks = freezed,
    Object? skipActivityParents = freezed,
    Object? skipActivityPoll = freezed,
    Object? skipActivityReactions = freezed,
    Object? skipActivityRefreshImageUrls = freezed,
    Object? skipAll = freezed,
    Object? skipFeedMemberUser = freezed,
    Object? skipFollowers = freezed,
    Object? skipFollowing = freezed,
    Object? skipOwnCapabilities = freezed,
    Object? skipOwnFollows = freezed,
    Object? skipPins = freezed,
  }) {
    return _then(
      EnrichmentOptions(
        enrichOwnFollowings: freezed == enrichOwnFollowings
            ? _self.enrichOwnFollowings
            : enrichOwnFollowings // ignore: cast_nullable_to_non_nullable
                  as bool?,
        includeFlatActivities: freezed == includeFlatActivities
            ? _self.includeFlatActivities
            : includeFlatActivities // ignore: cast_nullable_to_non_nullable
                  as bool?,
        includeScoreVars: freezed == includeScoreVars
            ? _self.includeScoreVars
            : includeScoreVars // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivity: freezed == skipActivity
            ? _self.skipActivity
            : skipActivity // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivityCollections: freezed == skipActivityCollections
            ? _self.skipActivityCollections
            : skipActivityCollections // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivityComments: freezed == skipActivityComments
            ? _self.skipActivityComments
            : skipActivityComments // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivityCurrentFeed: freezed == skipActivityCurrentFeed
            ? _self.skipActivityCurrentFeed
            : skipActivityCurrentFeed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivityMentionedUsers: freezed == skipActivityMentionedUsers
            ? _self.skipActivityMentionedUsers
            : skipActivityMentionedUsers // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivityOwnBookmarks: freezed == skipActivityOwnBookmarks
            ? _self.skipActivityOwnBookmarks
            : skipActivityOwnBookmarks // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivityParents: freezed == skipActivityParents
            ? _self.skipActivityParents
            : skipActivityParents // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivityPoll: freezed == skipActivityPoll
            ? _self.skipActivityPoll
            : skipActivityPoll // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivityReactions: freezed == skipActivityReactions
            ? _self.skipActivityReactions
            : skipActivityReactions // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipActivityRefreshImageUrls: freezed == skipActivityRefreshImageUrls
            ? _self.skipActivityRefreshImageUrls
            : skipActivityRefreshImageUrls // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipAll: freezed == skipAll
            ? _self.skipAll
            : skipAll // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipFeedMemberUser: freezed == skipFeedMemberUser
            ? _self.skipFeedMemberUser
            : skipFeedMemberUser // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipFollowers: freezed == skipFollowers
            ? _self.skipFollowers
            : skipFollowers // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipFollowing: freezed == skipFollowing
            ? _self.skipFollowing
            : skipFollowing // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipOwnCapabilities: freezed == skipOwnCapabilities
            ? _self.skipOwnCapabilities
            : skipOwnCapabilities // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipOwnFollows: freezed == skipOwnFollows
            ? _self.skipOwnFollows
            : skipOwnFollows // ignore: cast_nullable_to_non_nullable
                  as bool?,
        skipPins: freezed == skipPins
            ? _self.skipPins
            : skipPins // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}
