import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import 'user_data.dart';

part 'poll_vote_data.freezed.dart';

/// A poll vote in the Stream Feeds system.
///
/// Contains voter information, selected option, timing data, and any
/// additional answer text for a single vote cast in a poll.
@freezed
class PollVoteData with _$PollVoteData {
  /// Creates a new [PollVoteData] instance.
  const PollVoteData({
    required this.createdAt,
    required this.id,
    required this.optionId,
    required this.pollId,
    required this.updatedAt,
    this.answerText,
    this.user,
    this.userId,
  });

  /// The text of the answer, if any.
  @override
  final String? answerText;

  /// The date and time when the vote was created.
  @override
  final DateTime createdAt;

  /// Unique identifier for the poll vote.
  @override
  final String id;

  /// Whether this vote is the answer, if known.
  bool get isAnswer => answerText != null;

  /// The ID of the selected option.
  @override
  final String optionId;

  /// The ID of the poll.
  @override
  final String pollId;

  /// The date and time when the vote was last updated.
  @override
  final DateTime updatedAt;

  /// The user who voted, if available.
  @override
  final UserData? user;

  /// The ID of the user who voted, if available.
  @override
  final String? userId;
}

/// Extension function to convert a [PollVoteResponseData] to a [PollVoteData] model.
extension PollVoteResponseMapper on PollVoteResponseData {
  /// Converts this API poll vote response to a domain [PollVoteData] instance.
  PollVoteData toModel() {
    return PollVoteData(
      answerText: answerText,
      createdAt: createdAt,
      id: id,
      optionId: optionId,
      pollId: pollId,
      updatedAt: updatedAt,
      user: user?.toModel(),
      userId: userId,
    );
  }
}
