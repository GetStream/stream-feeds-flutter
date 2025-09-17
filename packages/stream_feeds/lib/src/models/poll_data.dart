import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart';
import 'poll_option_data.dart';
import 'poll_vote_data.dart';
import 'user_data.dart';

part 'poll_data.freezed.dart';

/// A poll in the Stream Feeds system.
///
/// Interactive content embedded within activities to gather user feedback.
/// Supports multiple voting modes, user-suggested options, real-time vote
/// tracking, and comprehensive analytics.
@freezed
class PollData with _$PollData {
  /// Creates a new [PollData] instance.
  const PollData({
    required this.allowAnswers,
    required this.allowUserSuggestedOptions,
    required this.answersCount,
    required this.createdAt,
    required this.createdById,
    required this.description,
    required this.enforceUniqueVote,
    required this.id,
    required this.isClosed,
    required this.latestAnswers,
    required this.latestVotesByOption,
    required this.name,
    required this.options,
    required this.ownVotesAndAnswers,
    required this.updatedAt,
    required this.voteCount,
    required this.voteCountsByOption,
    required this.votingVisibility,
    this.createdBy,
    this.maxVotesAllowed,
    this.custom,
  });

  /// Whether answers are allowed.
  @override
  final bool allowAnswers;

  /// Whether user-suggested options are allowed.
  @override
  final bool allowUserSuggestedOptions;

  /// The number of answers.
  @override
  final int answersCount;

  /// The date and time when the poll was created.
  @override
  final DateTime createdAt;

  /// The user who created the poll, if available.
  @override
  final UserData? createdBy;

  /// The ID of the user who created the poll.
  @override
  final String createdById;

  /// The description of the poll.
  @override
  final String description;

  /// Whether unique voting is enforced.
  @override
  final bool enforceUniqueVote;

  /// Unique identifier for the poll.
  @override
  final String id;

  /// Whether the poll is closed.
  @override
  final bool isClosed;

  /// The latest answers to the poll.
  @override
  final List<PollVoteData> latestAnswers;

  /// List of votes received by the poll.
  ///
  /// Note: This does not include the answers provided by the users,
  /// see [latestAnswers] for that.
  List<PollVoteData> get latestVotes {
    return [...latestVotesByOption.values.flattened];
  }

  /// The latest votes by option.
  @override
  final Map<String, List<PollVoteData>> latestVotesByOption;

  /// The maximum number of votes allowed, if any.
  @override
  final int? maxVotesAllowed;

  /// The name of the poll.
  @override
  final String name;

  /// The options for the poll.
  @override
  final List<PollOptionData> options;

  /// The votes made by the current user.
  @override
  final List<PollVoteData> ownVotesAndAnswers;

  /// List of votes casted by the current user.
  ///
  /// Note: This does not include the answers provided by the user,
  /// see [ownAnswers] for that.
  List<PollVoteData> get ownVotes {
    return ownVotesAndAnswers.where((it) => !it.isAnswer).toList();
  }

  /// List of answers provided by the current user.
  ///
  /// Note: This does not include the votes casted by the user,
  /// see [ownVotes] for that.
  List<PollVoteData> get ownAnswers {
    return ownVotesAndAnswers.where((it) => it.isAnswer).toList();
  }

  /// The date and time when the poll was last updated.
  @override
  final DateTime updatedAt;

  /// The total number of votes.
  @override
  final int voteCount;

  /// The number of votes by option.
  @override
  final Map<String, int> voteCountsByOption;

  /// The visibility of voting.
  @override
  final String votingVisibility;

  /// Custom data as a map.
  @override
  final Map<String, Object?>? custom;
}

extension PollDataMutations on PollData {
  PollData addOption(PollOptionData option) {
    final updatedOptions = options.upsert(
      option,
      key: (it) => it.id == option.id,
    );

    return copyWith(options: updatedOptions);
  }

  PollData removeOption(String optionId) {
    final updatedOptions = options.where((it) => it.id != optionId).toList();

    return copyWith(options: updatedOptions);
  }

  PollData updateOption(PollOptionData option) {
    final updatedOptions = options.map((it) {
      if (it.id != option.id) return it;
      return option;
    }).toList();

    return copyWith(options: updatedOptions);
  }

  PollData castAnswer(PollVoteData answer, String currentUserId) {
    final updatedLatestAnswers = latestAnswers.let((it) {
      return it.upsert(answer, key: (it) => it.id == answer.id);
    });

    final updatedOwnVotesAndAnswers = ownVotesAndAnswers.let((it) {
      if (answer.userId != currentUserId) return it;
      return it.upsert(answer, key: (it) => it.id == answer.id);
    });

    return copyWith(
      latestAnswers: updatedLatestAnswers,
      ownVotesAndAnswers: updatedOwnVotesAndAnswers,
    );
  }
}

/// Extension function to convert a [PollResponseData] to a [PollData] model.
extension PollResponseMapper on PollResponseData {
  /// Converts this API poll response to a domain [PollData] instance.
  PollData toModel() {
    return PollData(
      allowAnswers: allowAnswers,
      allowUserSuggestedOptions: allowUserSuggestedOptions,
      answersCount: answersCount,
      createdAt: createdAt,
      createdBy: createdBy?.toModel(),
      createdById: createdById,
      description: description,
      enforceUniqueVote: enforceUniqueVote,
      id: id,
      isClosed: isClosed ?? false,
      latestAnswers: [...latestAnswers.map((e) => e.toModel())],
      latestVotesByOption: {
        for (final entry in latestVotesByOption.entries)
          entry.key: [...entry.value.map((e) => e.toModel())],
      },
      maxVotesAllowed: maxVotesAllowed,
      name: name,
      options: [...options.map((e) => e.toModel())],
      ownVotesAndAnswers: [...ownVotes.map((e) => e.toModel())],
      updatedAt: updatedAt,
      voteCount: voteCount,
      voteCountsByOption: voteCountsByOption,
      votingVisibility: votingVisibility,
      custom: custom,
    );
  }
}
