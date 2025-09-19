import 'package:flutter/material.dart';

import 'create_poll_state.dart';
import 'poll_option_reorderable_list_view.dart';
import 'poll_question_text_field.dart';
import 'poll_switch_list_tile.dart';
import 'stream_poll_controller.dart';

/// {@template streamPollCreator}
/// A widget that allows users to create a poll.
///
/// The widget provides a form to create a poll with a question and multiple
/// options.
///
/// {@endtemplate}
class StreamPollCreatorWidget extends StatelessWidget {
  /// {@macro streamPollCreator}
  const StreamPollCreatorWidget({
    super.key,
    required this.controller,
    this.shrinkWrap = false,
    this.physics,
    this.padding = const EdgeInsets.all(16),
  });

  /// The padding around the poll creator.
  final EdgeInsets padding;

  /// Whether the scroll view should shrink-wrap its content.
  final bool shrinkWrap;

  /// The physics of the scroll view.
  final ScrollPhysics? physics;

  /// The controller used to manage the state of the poll.
  final StreamPollController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, poll, child) {
        final config = controller.config;

        // Using a combination of SingleChildScrollView and Column instead of
        // ListView to avoid the item color overflow issue.
        //
        // More info: https://github.com/flutter/flutter/issues/86584
        return SingleChildScrollView(
          padding: padding,
          physics: physics,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PollQuestionTextField(
                questionRange: config.nameRange,
                title: 'Questions',
                hintText: 'Ask a question',
                initialQuestion:
                    PollQuestion(originalId: poll.id, text: poll.name),
                onChanged: (question) => controller.question = question.text,
              ),
              const SizedBox(height: 32),
              PollOptionReorderableListView(
                title: 'Options',
                itemHintText: 'Option',
                allowDuplicate: config.allowDuplicateOptions,
                optionsRange: config.optionsRange,
                initialOptions: [
                  for (final option in poll.options)
                    PollOptionItem(
                        key: option.key,
                        originalId: option.originalId,
                        text: option.text),
                ],
                onOptionsChanged: (options) => controller.options = [
                  for (final option in options)
                    PollOptionInputState(
                      key: option.key,
                      originalId: option.originalId,
                      text: option.text,
                    ),
                ],
              ),
              const SizedBox(height: 32),
              PollSwitchListTile(
                title: 'Multiple answers',
                value: poll.enforceUniqueVote == false,
                onChanged: (value) {
                  controller.enforceUniqueVote = !value;
                  // We also need to reset maxVotesAllowed if disabled.
                  if (value case false) controller.maxVotesAllowed = null;
                },
                children: [
                  PollSwitchTextField(
                    hintText: 'Maximum votes per person',
                    item: PollSwitchItem(
                      value: poll.maxVotesAllowed != null,
                      inputValue: poll.maxVotesAllowed,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (item) {
                      final allowedRange = config.allowedVotesRange;
                      final votes = item.inputValue;
                      if (votes == null || allowedRange == null) return null;

                      final (:min, :max) = allowedRange;

                      if (min != null && votes < min) {
                        return 'Vote count must be at least $min';
                      }

                      if (max != null && votes > max) {
                        return 'Vote count must be at most $max';
                      }

                      return null;
                    },
                    onChanged: (option) {
                      final enabled = option.value;
                      final maxVotes = option.inputValue;

                      controller.maxVotesAllowed = enabled ? maxVotes : null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              PollSwitchListTile(
                title: 'Anonymous poll',
                value: poll.votingVisibility == VotingVisibility.anonymous,
                onChanged: (anon) => controller.votingVisibility = anon //
                    ? VotingVisibility.anonymous
                    : VotingVisibility.public,
              ),
              const SizedBox(height: 8),
              PollSwitchListTile(
                title: 'Suggest an option',
                value: poll.allowUserSuggestedOptions,
                onChanged: (allow) => controller.allowSuggestions = allow,
              ),
              const SizedBox(height: 8),
              PollSwitchListTile(
                title: 'Add a comment',
                value: poll.allowAnswers,
                onChanged: (allow) => controller.allowComments = allow,
              ),
            ],
          ),
        );
      },
    );
  }
}
