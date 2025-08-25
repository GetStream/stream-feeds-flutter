import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import 'user_data.dart';

part 'feeds_reaction_data.freezed.dart';

/// A reaction to an activity in the Stream Feeds system.
///
/// Contains the user who reacted, reaction type, activity reference,
/// and timestamp information.
@freezed
class FeedsReactionData with _$FeedsReactionData {
  /// Creates a new [FeedsReactionData] instance.
  const FeedsReactionData({
    required this.activityId,
    required this.createdAt,
    required this.type,
    required this.updatedAt,
    required this.user,
    this.custom,
  });

  /// The ID of the activity this reaction is associated with.
  @override
  final String activityId;

  /// The date and time when the reaction was created.
  @override
  final DateTime createdAt;

  /// The type of the reaction.
  @override
  final String type;

  /// The date and time when the reaction was last updated.
  @override
  final DateTime updatedAt;

  /// The user who made the reaction.
  @override
  final UserData user;

  /// Optional custom data as a map.
  @override
  final Map<String, Object?>? custom;

  /// Unique identifier for the reaction, generated from the activity ID and user ID.
  String get id => '$activityId${user.id}';
}

/// Extension function to convert a [FeedsReactionResponse] to a [FeedsReactionData] model.
extension FeedsReactionResponseMapper on FeedsReactionResponse {
  /// Converts this API feeds reaction response to a domain [FeedsReactionData] instance.
  FeedsReactionData toModel() {
    return FeedsReactionData(
      activityId: activityId,
      createdAt: createdAt,
      type: type,
      updatedAt: updatedAt,
      user: user.toModel(),
      custom: custom,
    );
  }
}
