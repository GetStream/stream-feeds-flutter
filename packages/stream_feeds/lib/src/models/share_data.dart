import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import 'user_data.dart';

part 'share_data.freezed.dart';

/// A share of an activity.
///
/// Records who shared an activity and when. An activity's `shareCount` counts
/// these, and its `latestShares` holds the most recent few.
@freezed
class ShareData with _$ShareData {
  /// Creates a new [ShareData] instance.
  const ShareData({
    required this.activityId,
    required this.createdAt,
    required this.user,
  });

  /// The ID of the activity that was shared.
  @override
  final String activityId;

  /// The date and time when the activity was shared.
  @override
  final DateTime createdAt;

  /// The user who shared the activity.
  @override
  final UserData user;
}

/// Extension function to convert a [ShareResponse] to a [ShareData] model.
extension ShareResponseMapper on ShareResponse {
  /// Converts this API share response to a domain [ShareData] instance.
  ShareData toModel() {
    return ShareData(
      activityId: activityId,
      createdAt: createdAt,
      user: user.toModel(),
    );
  }
}

/// Extension function to convert a [FeedsShareResponse] to a [ShareData] model.
extension FeedsShareResponseMapper on FeedsShareResponse {
  /// Converts this API feeds share response to a domain [ShareData] instance.
  ShareData toModel() {
    return ShareData(
      activityId: activityId,
      createdAt: createdAt,
      user: user.toModel(),
    );
  }
}
