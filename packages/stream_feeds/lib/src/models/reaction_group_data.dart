import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

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

/// Extension functions for [ReactionGroupData] to handle common operations.
extension ReactionGroupDataMutations on ReactionGroupData {
  /// Returns true if the reaction group is empty (count is 0 or less).
  bool get isEmpty => count <= 0;

  /// Returns a copy of this ReactionGroupData with the count decremented by 1 (not below 0),
  /// if the given date is within the valid range (date >= firstReactionAt or date <= lastReactionAt).
  /// Otherwise, returns the original instance.
  ///
  /// - Parameter date: The date to check for decrementing.
  /// - Returns: A new ReactionGroupData with updated count, or the original if not decremented.
  ReactionGroupData decrement(DateTime date) {
    if (date < firstReactionAt || date > lastReactionAt) return this;
    return copyWith(count: math.max(0, count - 1));
  }

  /// Returns a copy of this ReactionGroupData with the count incremented by 1 and lastReactionAt
  /// updated to the given date, if the date is after firstReactionAt. Otherwise, returns the original
  /// instance.
  ///
  /// - Parameter date: The date to use for incrementing and updating lastReactionAt.
  /// - Returns: A new ReactionGroupData with updated count and lastReactionAt, or the original if not
  /// incremented.
  ReactionGroupData increment(DateTime date) {
    if (date <= firstReactionAt) return this;
    return copyWith(count: math.max(0, count + 1), lastReactionAt: date);
  }
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
