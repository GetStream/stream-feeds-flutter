// Backwards-compatibility type aliases for renamed generated API types.
//
// All typedefs in this file are deprecated. Migrate to the new names at
// your earliest convenience.

import 'generated/api/models.dart';

/// Use [UnfollowPair] instead.
@Deprecated('Renamed to UnfollowPair. Migrate to UnfollowPair.')
typedef FollowPair = UnfollowPair;

/// Use [Location] instead.
@Deprecated('Renamed to Location. Migrate to Location.')
typedef ActivityLocation = Location;

/// Use [OwnUserResponse] instead.
@Deprecated('Renamed to OwnUserResponse. Migrate to OwnUserResponse.')
typedef OwnUser = OwnUserResponse;

/// Use [UserMuteResponse] instead.
@Deprecated('Renamed to UserMuteResponse. Migrate to UserMuteResponse.')
typedef UserMute = UserMuteResponse;

/// Use [PollResponseData] instead.
///
/// Note: [PollResponseData.votingVisibility] is now a required field.
@Deprecated('Renamed to PollResponseData. Migrate to PollResponseData.')
typedef Poll = PollResponseData;

/// Use [PollOptionResponseData] instead.
@Deprecated('Renamed to PollOptionResponseData. Migrate to PollOptionResponseData.')
typedef PollOption = PollOptionResponseData;

/// Use [PollVoteResponseData] instead.
@Deprecated('Renamed to PollVoteResponseData. Migrate to PollVoteResponseData.')
typedef PollVote = PollVoteResponseData;

/// Use [ModerationBanResponse] instead.
@Deprecated('Renamed to ModerationBanResponse. Migrate to ModerationBanResponse.')
typedef BanResponse = ModerationBanResponse;

/// Use [ModerationCallResponse] instead.
@Deprecated('Renamed to ModerationCallResponse. Migrate to ModerationCallResponse.')
typedef CallResponse = ModerationCallResponse;

/// Use [FlagItemResponse] instead.
@Deprecated('Renamed to FlagItemResponse. Migrate to FlagItemResponse.')
typedef FlagResponse = FlagItemResponse;

// ---------------------------------------------------------------------------
// Moderation action request types
// ---------------------------------------------------------------------------

/// Use [BanActionRequestPayload] instead.
@Deprecated('Renamed to BanActionRequestPayload. Migrate to BanActionRequestPayload.')
typedef BanActionRequest = BanActionRequestPayload;

/// Use [DeleteMessages] instead.
@Deprecated('Renamed to DeleteMessages. Migrate to DeleteMessages.')
typedef BanActionRequestDeleteMessages = DeleteMessages;

/// Use [BlockActionRequestPayload] instead.
@Deprecated('Renamed to BlockActionRequestPayload. Migrate to BlockActionRequestPayload.')
typedef BlockActionRequest = BlockActionRequestPayload;

/// Use [ShadowBlockActionRequestPayload] instead.
@Deprecated('Renamed to ShadowBlockActionRequestPayload. Migrate to ShadowBlockActionRequestPayload.')
typedef ShadowBlockActionRequest = ShadowBlockActionRequestPayload;

/// Use [CustomActionRequestPayload] instead.
@Deprecated('Renamed to CustomActionRequestPayload. Migrate to CustomActionRequestPayload.')
typedef CustomActionRequest = CustomActionRequestPayload;

/// Use [DeleteUserRequestPayload] instead.
@Deprecated('Renamed to DeleteUserRequestPayload. Migrate to DeleteUserRequestPayload.')
typedef DeleteUserRequest = DeleteUserRequestPayload;

/// Use [DeleteActivityRequestPayload] instead.
@Deprecated('Renamed to DeleteActivityRequestPayload. Migrate to DeleteActivityRequestPayload.')
typedef DeleteActivityRequest = DeleteActivityRequestPayload;

/// Use [DeleteCommentRequestPayload] instead.
@Deprecated('Renamed to DeleteCommentRequestPayload. Migrate to DeleteCommentRequestPayload.')
typedef DeleteCommentRequest = DeleteCommentRequestPayload;

/// Use [DeleteReactionRequestPayload] instead.
@Deprecated('Renamed to DeleteReactionRequestPayload. Migrate to DeleteReactionRequestPayload.')
typedef DeleteReactionRequest = DeleteReactionRequestPayload;

/// Use [DeleteMessageRequestPayload] instead.
@Deprecated('Renamed to DeleteMessageRequestPayload. Migrate to DeleteMessageRequestPayload.')
typedef DeleteMessageRequest = DeleteMessageRequestPayload;

/// Use [MarkReviewedRequestPayload] instead.
@Deprecated('Renamed to MarkReviewedRequestPayload. Migrate to MarkReviewedRequestPayload.')
typedef MarkReviewedRequest = MarkReviewedRequestPayload;

/// Use [RejectAppealRequestPayload] instead.
@Deprecated('Renamed to RejectAppealRequestPayload. Migrate to RejectAppealRequestPayload.')
typedef RejectAppealRequest = RejectAppealRequestPayload;

/// Use [RestoreActionRequestPayload] instead.
@Deprecated('Renamed to RestoreActionRequestPayload. Migrate to RestoreActionRequestPayload.')
typedef RestoreActionRequest = RestoreActionRequestPayload;

/// Use [UnbanActionRequestPayload] instead.
@Deprecated('Renamed to UnbanActionRequestPayload. Migrate to UnbanActionRequestPayload.')
typedef UnbanActionRequest = UnbanActionRequestPayload;

/// Use [UnblockActionRequestPayload] instead.
@Deprecated('Renamed to UnblockActionRequestPayload. Migrate to UnblockActionRequestPayload.')
typedef UnblockActionRequest = UnblockActionRequestPayload;

// ---------------------------------------------------------------------------
// Per-field enums merged into shared ones
// ---------------------------------------------------------------------------

/// Use [RestrictReplies] instead.
@Deprecated('Renamed to RestrictReplies. Migrate to RestrictReplies.')
typedef ActivityRequestRestrictReplies = RestrictReplies;

/// Use [ActivityVisibility] instead.
@Deprecated('Renamed to ActivityVisibility. Migrate to ActivityVisibility.')
typedef ActivityRequestVisibility = ActivityVisibility;

/// Use [RestrictReplies] instead.
@Deprecated('Renamed to RestrictReplies. Migrate to RestrictReplies.')
typedef ActivityResponseRestrictReplies = RestrictReplies;

/// Use [ActivityVisibility] instead.
@Deprecated('Renamed to ActivityVisibility. Migrate to ActivityVisibility.')
typedef ActivityResponseVisibility = ActivityVisibility;

/// Use [RestrictReplies] instead.
@Deprecated('Renamed to RestrictReplies. Migrate to RestrictReplies.')
typedef AddActivityRequestRestrictReplies = RestrictReplies;

/// Use [ActivityVisibility] instead.
@Deprecated('Renamed to ActivityVisibility. Migrate to ActivityVisibility.')
typedef AddActivityRequestVisibility = ActivityVisibility;

/// Use [ModerationAction] instead.
@Deprecated('Renamed to ModerationAction. Migrate to ModerationAction.')
typedef AutomodRuleAction = ModerationAction;

/// Use [ModerationAction] instead.
@Deprecated('Renamed to ModerationAction. Migrate to ModerationAction.')
typedef AutomodSemanticFiltersRuleAction = ModerationAction;

/// Use [ModerationAction] instead.
@Deprecated('Renamed to ModerationAction. Migrate to ModerationAction.')
typedef AWSRekognitionRuleAction = ModerationAction;

/// Use [DeleteMessages] instead.
@Deprecated('Renamed to DeleteMessages. Migrate to DeleteMessages.')
typedef BanActionRequestPayloadDeleteMessages = DeleteMessages;

/// Use [DeleteMessages] instead.
@Deprecated('Renamed to DeleteMessages. Migrate to DeleteMessages.')
typedef BanOptionsDeleteMessages = DeleteMessages;

/// Use [DeleteMessages] instead.
@Deprecated('Renamed to DeleteMessages. Migrate to DeleteMessages.')
typedef BanRequestDeleteMessages = DeleteMessages;

/// Use [ChannelModerationBehavior] instead.
@Deprecated('Renamed to ChannelModerationBehavior. Migrate to ChannelModerationBehavior.')
typedef BlockListOptionsBehavior = ChannelModerationBehavior;

/// Use [FeedVisibility] instead.
@Deprecated('Renamed to FeedVisibility. Migrate to FeedVisibility.')
typedef ChangeFeedVisibilityRequestVisibility = FeedVisibility;

/// Use [AutomodMode] instead.
@Deprecated('Renamed to AutomodMode. Migrate to AutomodMode.')
typedef ChannelConfigWithInfoAutomod = AutomodMode;

/// Use [ChannelModerationBehavior] instead.
@Deprecated('Renamed to ChannelModerationBehavior. Migrate to ChannelModerationBehavior.')
typedef ChannelConfigWithInfoAutomodBehavior = ChannelModerationBehavior;

/// Use [ChannelModerationBehavior] instead.
@Deprecated('Renamed to ChannelModerationBehavior. Migrate to ChannelModerationBehavior.')
typedef ChannelConfigWithInfoBlocklistBehavior = ChannelModerationBehavior;

/// Use [PushLevel] instead.
@Deprecated('Renamed to PushLevel. Migrate to PushLevel.')
typedef ChannelConfigWithInfoPushLevel = PushLevel;

/// Use [CommentStatus] instead.
@Deprecated('Renamed to CommentStatus. Migrate to CommentStatus.')
typedef CommentResponseStatus = CommentStatus;

/// Use [PushProviderName] instead.
@Deprecated('Renamed to PushProviderName. Migrate to PushProviderName.')
typedef CreateDeviceRequestPushProvider = PushProviderName;

/// Use [VotingVisibility] instead.
@Deprecated('Renamed to VotingVisibility. Migrate to VotingVisibility.')
typedef CreatePollRequestVotingVisibility = VotingVisibility;

/// Use [DeleteMessages] instead.
@Deprecated('Renamed to DeleteMessages. Migrate to DeleteMessages.')
typedef DeleteUserMessagesRequestPayloadDeleteMessages = DeleteMessages;

/// Use [CollectionStatus] instead.
@Deprecated('Renamed to CollectionStatus. Migrate to CollectionStatus.')
typedef EnrichedCollectionResponseStatus = CollectionStatus;

/// Use [FeedVisibility] instead.
@Deprecated('Renamed to FeedVisibility. Migrate to FeedVisibility.')
typedef FeedInputVisibility = FeedVisibility;

/// Use [FeedMemberStatus] instead.
@Deprecated('Renamed to FeedMemberStatus. Migrate to FeedMemberStatus.')
typedef FeedMemberResponseStatus = FeedMemberStatus;

/// Use [FeedVisibility] instead.
@Deprecated('Renamed to FeedVisibility. Migrate to FeedVisibility.')
typedef FeedRequestVisibility = FeedVisibility;

/// Use [FeedVisibility] instead.
@Deprecated('Renamed to FeedVisibility. Migrate to FeedVisibility.')
typedef FeedResponseVisibility = FeedVisibility;

/// Use [FeedVisibility] instead.
@Deprecated('Renamed to FeedVisibility. Migrate to FeedVisibility.')
typedef FeedSuggestionResponseVisibility = FeedVisibility;

/// Use [FollowPushPreference] instead.
@Deprecated('Renamed to FollowPushPreference. Migrate to FollowPushPreference.')
typedef FollowRequestPushPreference = FollowPushPreference;

/// Use [FollowPushPreference] instead.
@Deprecated('Renamed to FollowPushPreference. Migrate to FollowPushPreference.')
typedef FollowResponsePushPreference = FollowPushPreference;

/// Use [FollowStatus] instead.
@Deprecated('Renamed to FollowStatus. Migrate to FollowStatus.')
typedef FollowResponseStatus = FollowStatus;

/// Use [FriendReactionType] instead.
@Deprecated('Renamed to FriendReactionType. Migrate to FriendReactionType.')
typedef FriendReactionsOptionsType = FriendReactionType;

/// Use [ModerationAction] instead.
@Deprecated('Renamed to ModerationAction. Migrate to ModerationAction.')
typedef OCRRuleAction = ModerationAction;

/// Use [VotingVisibility] instead.
@Deprecated('Renamed to VotingVisibility. Migrate to VotingVisibility.')
typedef PollResponseDataVotingVisibility = VotingVisibility;

/// Use [CommentStatus] instead.
@Deprecated('Renamed to CommentStatus. Migrate to CommentStatus.')
typedef ThreadedCommentResponseStatus = CommentStatus;

/// Use [RestrictReplies] instead.
@Deprecated('Renamed to RestrictReplies. Migrate to RestrictReplies.')
typedef UpdateActivityRequestRestrictReplies = RestrictReplies;

/// Use [ActivityVisibility] instead.
@Deprecated('Renamed to ActivityVisibility. Migrate to ActivityVisibility.')
typedef UpdateActivityRequestVisibility = ActivityVisibility;

/// Use [FollowPushPreference] instead.
@Deprecated('Renamed to FollowPushPreference. Migrate to FollowPushPreference.')
typedef UpdateFollowRequestPushPreference = FollowPushPreference;

/// Use [VotingVisibility] instead.
@Deprecated('Renamed to VotingVisibility. Migrate to VotingVisibility.')
typedef UpdatePollRequestVotingVisibility = VotingVisibility;
