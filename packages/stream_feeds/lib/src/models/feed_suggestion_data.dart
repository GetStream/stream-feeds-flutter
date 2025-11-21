import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import 'feed_data.dart';
import 'feed_id.dart';
import 'feed_member_data.dart';
import 'user_data.dart';

part 'feed_suggestion_data.freezed.dart';

/// A feed suggestion in the Stream Feeds system.
///
/// Represents a recommended feed with scoring and reasoning information for
/// feed discovery features. Feed suggestions include algorithmic scores,
/// recommendation confidence, and human-readable explanations.
@freezed
class FeedSuggestionData with _$FeedSuggestionData {
  const FeedSuggestionData({
    required this.feed,
    this.algorithmScores,
    this.reason,
    this.recommendationScore,
  });

  /// The suggested feed.
  @override
  final FeedData feed;

  /// The algorithm scores for this suggestion.
  ///
  /// Maps algorithm names to their scores for ranking and relevance determination.
  @override
  final Map<String, double>? algorithmScores;

  /// The reason for suggesting this feed.
  ///
  /// A human-readable explanation such as "Based on your interests" or "Popular in your network".
  @override
  final String? reason;

  /// The overall recommendation score for this feed.
  ///
  /// A normalized value representing recommendation confidence. Higher values indicate stronger recommendations.
  @override
  final double? recommendationScore;
}

/// Extension function to convert a [FeedSuggestionResponse] to a [FeedSuggestionData] model.
extension FeedSuggestionResponseMapper on FeedSuggestionResponse {
  /// Converts this API feed response common fields to a domain [FeedSuggestionData] instance.
  ///
  /// Returns a [FeedSuggestionData] instance containing the feed information
  /// from the API response with proper field mapping and type conversions.
  FeedSuggestionData toModel() {
    return FeedSuggestionData(
      feed: FeedData(
        createdAt: createdAt,
        createdBy: createdBy.toModel(),
        deletedAt: deletedAt,
        description: description,
        fid: FeedId.fromRawValue(feed),
        filterTags: [...?filterTags],
        followerCount: followerCount,
        followingCount: followingCount,
        groupId: groupId,
        id: id,
        memberCount: memberCount,
        name: name,
        ownCapabilities: ownCapabilities ?? const [],
        ownMembership: ownMembership?.toModel(),
        pinCount: pinCount,
        updatedAt: updatedAt,
        visibility: visibility,
        custom: custom,
      ),
      algorithmScores: algorithmScores,
      reason: reason,
      recommendationScore: recommendationScore,
    );
  }
}
