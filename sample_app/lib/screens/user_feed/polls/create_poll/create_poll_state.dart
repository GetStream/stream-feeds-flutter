import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_poll_state.freezed.dart';

@freezed
@immutable
class CreatePollState with _$CreatePollState {
  const CreatePollState({
    required this.allowAnswers,
    required this.allowUserSuggestedOptions,
    required this.description,
    required this.enforceUniqueVote,
    required this.id,
    required this.isClosed,
    required this.maxVotesAllowed,
    required this.name,
    required this.options,
    required this.votingVisibility,
  });

  CreatePollState.empty()
      : allowAnswers = false,
        allowUserSuggestedOptions = false,
        description = '',
        enforceUniqueVote = true,
        id = null,
        isClosed = false,
        maxVotesAllowed = null,
        name = '',
        options = [PollOptionInputState(text: '')],
        votingVisibility = VotingVisibility.public;

  @override
  final bool allowAnswers;

  @override
  final bool allowUserSuggestedOptions;

  @override
  final String description;

  @override
  final bool enforceUniqueVote;

  @override
  final String? id;

  @override
  final bool isClosed;

  @override
  final int? maxVotesAllowed;

  @override
  final String name;

  @override
  final List<PollOptionInputState> options;

  @override
  final VotingVisibility? votingVisibility;
}

@freezed
@immutable
class PollOptionInputState with _$PollOptionInputState {
  PollOptionInputState({
    Key? key,
    this.originalId,
    required this.text,
  }) : key = key ?? UniqueKey();

  @override
  final Key key;

  @override
  final String? originalId;

  @override
  final String text;
}

enum VotingVisibility {
  anonymous,
  public,
}
