import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import 'follow_data.dart';

part 'batch_follow_data.freezed.dart';

/// Represents the result of a batch follow operation.
///
/// Contains information about follows that were created and all follows
/// (including existing and newly created ones).
@freezed
class BatchFollowData with _$BatchFollowData {
  const BatchFollowData({
    required this.created,
    required this.follows,
  });

  /// The follows that were created as a result of the batch operation.
  ///
  /// Contains only the newly created follow relationships. For getOrCreate
  /// operations, this will be empty if all follows already existed.
  @override
  final List<FollowData> created;

  /// All follows, including existing and newly created ones.
  ///
  /// Contains the complete list of follow relationships returned from the
  /// batch operation, regardless of whether they were newly created or already existed.
  @override
  final List<FollowData> follows;
}

/// Extension function to convert a [FollowBatchResponse] to a [BatchFollowData] model.
extension FollowBatchResponseMapper on FollowBatchResponse {
  /// Converts this API batch follow response to a domain [BatchFollowData] instance.
  ///
  /// Maps the created and follows lists from API responses to domain models
  /// with proper type conversions.
  BatchFollowData toModel() {
    return BatchFollowData(
      created: created.map((f) => f.toModel()).toList(),
      follows: follows.map((f) => f.toModel()).toList(),
    );
  }
}
