// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:stream_core/stream_core.dart';
//
// import '../../../generated/api/models.dart' as api;
// import '../feed_id.dart';
//
// part 'feed_add_activity_request.freezed.dart';
//
// /// A request for adding activities when interacting with a Feed.
// ///
// /// This class encapsulates all the information needed to add an activity to a feed
// /// in the Stream Feeds system. It supports rich activity features including attachments,
// /// mentions, custom metadata, and various activity types.
// ///
// /// ## Example Usage
// /// ```dart
// /// final request = FeedAddActivityRequest(
// ///   type: 'post',
// ///   text: 'Just shared a great article!',
// ///   mentionedUserIds: ['user123', 'user456'],
// ///   custom: {'category': 'tech', 'priority': 'high'},
// /// );
// ///
// /// // Convert to API request for a specific feed
// /// final feedId = FeedId(group: 'user', id: 'john');
// /// final apiRequest = request.toRequest(feedId);
// /// ```
// @freezed
// class FeedAddActivityRequest with _$FeedAddActivityRequest {
//   /// Creates a new instance of [FeedAddActivityRequest].
//   const FeedAddActivityRequest({
//     required this.type,
//     this.attachments,
//     this.attachmentUploads,
//     this.custom,
//     this.expiresAt,
//     this.filterTags,
//     this.id,
//     this.interestTags,
//     this.location,
//     this.mentionedUserIds,
//     this.parentId,
//     this.pollId,
//     this.searchData,
//     this.text,
//     this.visibility,
//     this.visibilityTag,
//   });
//
//   /// The type of activity (e.g., "post", "share", "like").
//   /// This is a required field that categorizes the activity.
//   @override
//   final String type;
//
//   /// Optional list of attachments to include with the activity.
//   @override
//   final List<api.Attachment>? attachments;
//
//   /// Optional list of attachment uploads that need to be processed.
//   /// These represent files that will be uploaded and converted to attachments.
//   @override
//   final List<Object>?
//       attachmentUploads; // TODO: Define proper attachment upload type when available
//
//   /// Optional custom data to include with the activity.
//   @override
//   final Map<String, Object>? custom;
//
//   /// Optional expiration date for the activity in ISO 8601 format.
//   @override
//   final String? expiresAt;
//
//   /// Optional list of filter tags for the activity.
//   @override
//   final List<String>? filterTags;
//
//   /// Optional unique identifier for the activity.
//   /// If not provided, the server will generate one.
//   @override
//   final String? id;
//
//   /// Optional list of interest tags for the activity.
//   @override
//   final List<String>? interestTags;
//
//   /// Optional location data for the activity.
//   @override
//   final api.ActivityLocation? location;
//
//   /// Optional list of user IDs to mention in the activity.
//   @override
//   final List<String>? mentionedUserIds;
//
//   /// Optional ID of the parent activity if this is a reply.
//   @override
//   final String? parentId;
//
//   /// Optional ID of an associated poll.
//   @override
//   final String? pollId;
//
//   /// Optional search data to make the activity searchable.
//   @override
//   final Map<String, Object>? searchData;
//
//   /// Optional text content of the activity.
//   @override
//   final String? text;
//
//   /// Optional visibility setting for the activity.
//   @override
//   final api.AddActivityRequestVisibilityEnum? visibility;
//
//   /// Optional visibility tag for tag-based visibility.
//   @override
//   final String? visibilityTag;
//
//   /// Gets the first feed ID if available from internal state.
//   /// This is used internally for tracking which feed the activity belongs to.
//   String? get fidString => null; // Will be set when converting to API request
//
//   /// Creates an API request with the specified feed ID and uploaded attachments.
//   ///
//   /// [fid] The feed identifier where the activity should be added.
//   /// [uploadedAttachments] Additional attachments that have been uploaded.
//   /// Returns an [api.AddActivityRequest] suitable for API calls.
//   api.AddActivityRequest withFid(
//     FeedId fid, {
//     List<api.Attachment>? uploadedAttachments,
//   }) {
//     final allAttachments = <api.Attachment>[
//       ...?attachments,
//       ...?uploadedAttachments,
//     ];
//
//     return api.AddActivityRequest(
//       fids: [fid.rawValue],
//       type: type,
//       attachments: allAttachments.isEmpty ? null : allAttachments,
//       custom: custom,
//       expiresAt: expiresAt,
//       filterTags: filterTags,
//       id: id,
//       interestTags: interestTags,
//       location: location,
//       mentionedUserIds: mentionedUserIds,
//       parentId: parentId,
//       pollId: pollId,
//       searchData: searchData,
//       text: text,
//       visibility: visibility,
//       visibilityTag: visibilityTag,
//     );
//   }
// }
//
// /// Extension function to convert a [FeedAddActivityRequest] to an API request.
// extension FeedAddActivityRequestMapper on FeedAddActivityRequest {
//   /// Converts this request to the corresponding API request type.
//   ///
//   /// [fid] The feed identifier where the activity should be added.
//   /// [uploadedAttachments] Additional attachments that have been uploaded.
//   /// Returns an [api.AddActivityRequest] containing all the necessary
//   /// information to add an activity to a feed.
//   api.AddActivityRequest toRequest(
//     FeedId fid, {
//     List<api.Attachment>? uploadedAttachments,
//   }) {
//     final allAttachments = [...?attachments, ...?uploadedAttachments];
//
//     return api.AddActivityRequest(
//       fids: [fid.rawValue],
//       type: type,
//       attachments: allAttachments.takeIf((it) => it.isNotEmpty),
//       custom: custom,
//       expiresAt: expiresAt,
//       filterTags: filterTags,
//       id: id,
//       interestTags: interestTags,
//       location: location,
//       mentionedUserIds: mentionedUserIds,
//       parentId: parentId,
//       pollId: pollId,
//       searchData: searchData,
//       text: text,
//       visibility: visibility,
//       visibilityTag: visibilityTag,
//     );
//   }
// }
