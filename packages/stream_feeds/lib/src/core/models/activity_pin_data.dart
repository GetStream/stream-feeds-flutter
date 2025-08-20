import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generated/api/models.dart' as api;
import 'activity_data.dart';
import 'feed_id.dart';

part 'activity_pin_data.freezed.dart';

/// A pinned activity in the Stream Feeds system.
///
/// An activity that has been pinned to a specific feed and is displayed
/// prominently at the top of the feed.
@freezed
class ActivityPinData with _$ActivityPinData {
  /// Creates a new [ActivityPinData] instance.
  const ActivityPinData({
    required this.activity,
    required this.createdAt,
    required this.fid,
    required this.updatedAt,
    required this.userId,
  });

  /// The activity that has been pinned.
  @override
  final ActivityData activity;

  /// The date and time when the activity was pinned to the feed.
  @override
  final DateTime createdAt;

  /// The feed identifier where this activity is pinned.
  @override
  final FeedId fid;

  /// The date and time when the pin was last updated.
  @override
  final DateTime updatedAt;

  /// The identifier of the user who pinned the activity.
  @override
  final String userId;

  /// Unique identifier for the pinned activity, generated from the feed ID, activity ID,
  /// and user ID. This identifier is used for simpler identification of pinned activities.
  String get id => '${fid.rawValue}${activity.id}$userId';
}

/// Extension function to convert an [api.ActivityPinResponse] to an [ActivityPinData] model.
extension ActivityPinResponseMapper on api.ActivityPinResponse {
  /// Converts this API activity pin response to a domain [ActivityPinData] instance.
  ///
  /// This conversion is used when retrieving pinned activities from the API,
  /// transforming the API response format into the application's domain model.
  ActivityPinData toModel() {
    return ActivityPinData(
      activity: activity.toModel(),
      createdAt: createdAt,
      fid: FeedId.fromRawValue(feed),
      updatedAt: updatedAt,
      userId: user.id,
    );
  }
}

/// Extension function to convert a [api.PinActivityResponse] to an [ActivityPinData] model.
extension PinActivityResponseMapper on api.PinActivityResponse {
  /// Converts this API pin activity response to a domain [ActivityPinData] instance.
  ///
  /// This conversion is used when pinning an activity to a feed, where the response
  /// contains the pinned activity details.
  ActivityPinData toModel() {
    return ActivityPinData(
      activity: activity.toModel(),
      createdAt: createdAt,
      fid: FeedId.fromRawValue(fid),
      updatedAt: createdAt, // No updated_at field in PinActivityResponse
      userId: userId,
    );
  }
}
