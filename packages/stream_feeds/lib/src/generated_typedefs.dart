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

// ---------------------------------------------------------------------------
// Moderation action request types
// ---------------------------------------------------------------------------

/// Use [BanActionRequestPayload] instead.
@Deprecated('Renamed to BanActionRequestPayload. Migrate to BanActionRequestPayload.')
typedef BanActionRequest = BanActionRequestPayload;

/// Use [BanActionRequestPayloadDeleteMessages] instead.
@Deprecated('Renamed to BanActionRequestPayloadDeleteMessages. Migrate to BanActionRequestPayloadDeleteMessages.')
typedef BanActionRequestDeleteMessages = BanActionRequestPayloadDeleteMessages;

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
