import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart';

part 'feed_add_activity_request.freezed.dart';

/// A request for adding an activity to feeds.
///
/// Contains activity content, targeting information, attachments, and metadata
/// needed to create a new activity across multiple feeds. Supports advanced
/// features like location data, visibility controls, and file attachments.
@freezed
class FeedAddActivityRequest with _$FeedAddActivityRequest {
  /// Creates a new [FeedAddActivityRequest] instance.
  const FeedAddActivityRequest({
    required this.type,
    this.feeds = const [],
    this.attachments,
    this.attachmentUploads = const [],
    this.custom,
    this.expiresAt,
    this.filterTags,
    this.id,
    this.interestTags,
    this.location,
    this.mentionedUserIds,
    this.parentId,
    this.pollId,
    this.searchData,
    this.text,
    this.visibility,
    this.visibilityTag,
  });

  /// List of file attachments to include with the activity.
  @override
  final List<Attachment>? attachments;

  /// Optional list of stream attachments to be uploaded before adding the
  /// activity to the feeds.
  @override
  final List<StreamAttachment> attachmentUploads;

  /// Custom data associated with the activity.
  @override
  final Map<String, Object>? custom;

  /// Optional expiration date for the activity.
  @override
  final String? expiresAt;

  /// List of feed IDs where this activity should be posted.
  @override
  final List<String> feeds;

  /// Optional filter tags for content categorization.
  @override
  final List<String>? filterTags;

  /// Optional unique identifier for the activity.
  @override
  final String? id;

  /// Optional interest tags for content discovery.
  @override
  final List<String>? interestTags;

  /// Optional location data for the activity.
  @override
  final ActivityLocation? location;

  /// Optional list of user IDs mentioned in the activity.
  @override
  final List<String>? mentionedUserIds;

  /// Optional parent activity ID for replies or reposts.
  @override
  final String? parentId;

  /// Optional poll ID to associate with the activity.
  @override
  final String? pollId;

  /// Optional search metadata for enhanced discoverability.
  @override
  final Map<String, Object>? searchData;

  /// Optional text content of the activity.
  @override
  final String? text;

  /// The type of activity being created.
  @override
  final String type;

  /// Optional visibility setting for the activity.
  @override
  final AddActivityRequestVisibility? visibility;

  /// Optional visibility tag for custom visibility rules.
  @override
  final String? visibilityTag;
}

/// Extension function to convert a [FeedAddActivityRequest] to an API request.
extension FeedAddActivityRequestMapper on FeedAddActivityRequest {
  /// Converts this request to the corresponding API request type.
  ///
  /// Returns an [AddActivityRequest] containing all the necessary
  /// information to add an activity to the specified feeds.
  AddActivityRequest toRequest() {
    return AddActivityRequest(
      type: type,
      feeds: feeds,
      attachments: attachments,
      custom: custom,
      expiresAt: expiresAt,
      filterTags: filterTags,
      id: id,
      interestTags: interestTags,
      location: location,
      mentionedUserIds: mentionedUserIds,
      parentId: parentId,
      pollId: pollId,
      searchData: searchData,
      text: text,
      visibility: visibility,
      visibilityTag: visibilityTag,
    );
  }
}
