import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';

part 'reaction_group_data.freezed.dart';

/// A group of reactions of the same type.
///
/// Contains count statistics, timing metadata, and aggregated information
/// for reactions of the same type on an activity.
@freezed
class ReactionGroupData with _$ReactionGroupData {
  /// Creates a new [ReactionGroupData] instance.
  const ReactionGroupData({
    required this.count,
    required this.firstReactionAt,
    required this.lastReactionAt,
  });

  /// The number of reactions in the group.
  @override
  final int count;

  /// The date and time of the first reaction.
  @override
  final DateTime firstReactionAt;

  /// The date and time of the last reaction.
  @override
  final DateTime lastReactionAt;
}

/// Extension function to convert a [ReactionGroupResponse] to a [ReactionGroupData] model.
extension ReactionGroupResponseMapper on ReactionGroupResponse {
  /// Converts this API reaction group response to a domain [ReactionGroupData] instance.
  ReactionGroupData toModel() {
    return ReactionGroupData(
      count: count,
      firstReactionAt: firstReactionAt,
      lastReactionAt: lastReactionAt,
    );
  }
}
