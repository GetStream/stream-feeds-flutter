import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generated/api/models.dart' as api;
import 'activity_data.dart';

part 'aggregated_activity_data.freezed.dart';

/// Aggregated activities in the Stream Feeds system.
///
/// A group of related activities that have been aggregated together for
/// timeline feeds. For example, multiple "like" activities grouped into
/// "John and 5 others liked your post".
@freezed
class AggregatedActivityData with _$AggregatedActivityData {
  /// Creates a new [AggregatedActivityData] instance.
  const AggregatedActivityData({
    required this.activities,
    required this.activityCount,
    required this.createdAt,
    required this.group,
    required this.score,
    required this.updatedAt,
    required this.userCount,
  });

  /// The list of individual activities that make up this aggregated group.
  @override
  final List<ActivityData> activities;

  /// The total number of activities in this aggregated group.
  @override
  final int activityCount;

  /// The date and time when this aggregated group was created.
  @override
  final DateTime createdAt;

  /// The grouping identifier or key used to aggregate these activities.
  @override
  final String group;

  /// A relevance or ranking score for this aggregated group.
  @override
  final double score;

  /// The date and time when this aggregated group was last updated.
  @override
  final DateTime updatedAt;

  /// The number of unique users involved in this aggregated group.
  @override
  final int userCount;

  /// Unique identifier for the aggregated activity.
  ///
  /// If there are activities in the group, uses the ID of the first activity.
  /// Otherwise, generates a unique identifier from the aggregation metadata.
  String get id {
    if (activities.firstOrNull case final first?) return first.id;
    return '$activityCount-$userCount-$score-${createdAt.millisecondsSinceEpoch}-($group)';
  }
}

/// Extension function to convert an [api.AggregatedActivityResponse] to an [AggregatedActivityData] model.
extension AggregatedActivityResponseMapper on api.AggregatedActivityResponse {
  /// Converts this API aggregated activity response to a domain [AggregatedActivityData] instance.
  ///
  /// This conversion transforms the API response format into the application's domain model,
  /// including mapping all individual activities within the aggregated group.
  AggregatedActivityData toModel() {
    return AggregatedActivityData(
      activities: activities.map((it) => it.toModel()).toList(),
      activityCount: activityCount,
      createdAt: createdAt,
      group: group,
      score: score.toDouble(),
      updatedAt: updatedAt,
      userCount: userCount,
    );
  }
}
