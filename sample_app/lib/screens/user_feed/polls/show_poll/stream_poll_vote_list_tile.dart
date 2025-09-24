import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../../theme/extensions/theme_extensions.dart';
import '../../../../widgets/user_avatar.dart';

class StreamPollVoteListTile extends StatelessWidget {
  const StreamPollVoteListTile({
    super.key,
    required this.pollVote,
    this.showAnswerText = true,
    this.onTap,
    this.onLongPress,
    this.tileColor,
    this.borderRadius,
    this.contentPadding,
  });

  /// The poll vote to display the tile for.
  final PollVoteData pollVote;

  /// Whether to show the answer text.
  final bool showAnswerText;

  /// Called when the user taps this list tile.
  final GestureTapCallback? onTap;

  /// Called when the user long-presses on this list tile.
  final GestureLongPressCallback? onLongPress;

  /// Defines the background color of the tile.
  final Color? tileColor;

  /// The tile's border radius.
  final BorderRadiusGeometry? borderRadius;

  /// The tile's internal padding.
  final EdgeInsetsGeometry? contentPadding;

  /// Creates a copy of this tile but with the given fields replaced with
  /// the new values.
  StreamPollVoteListTile copyWith({
    Key? key,
    PollVoteData? pollVote,
    bool? showAnswerText,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    Color? tileColor,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? contentPadding,
  }) =>
      StreamPollVoteListTile(
        key: key ?? this.key,
        pollVote: pollVote ?? this.pollVote,
        showAnswerText: showAnswerText ?? this.showAnswerText,
        onTap: onTap ?? this.onTap,
        onLongPress: onLongPress ?? this.onLongPress,
        tileColor: tileColor ?? this.tileColor,
        borderRadius: borderRadius ?? this.borderRadius,
        contentPadding: contentPadding ?? this.contentPadding,
      );

  @override
  Widget build(BuildContext context) {
    final textTheme = context.appTextStyles;
    final colorTheme = context.appColors;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: contentPadding,
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: borderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pollVote.answerText case final answerText?
                when showAnswerText) ...[
              Text(
                answerText,
                style: textTheme.headlineBold.copyWith(
                  color: colorTheme.textHighEmphasis,
                ),
              ),
              const SizedBox(height: 16),
            ],
            Row(
              children: [
                if (pollVote.user case final user?) ...[
                  UserAvatar(
                    user: User(id: user.id, name: user.name, image: user.image),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        user.name ?? user.id,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.body.copyWith(
                          color: colorTheme.textHighEmphasis,
                        ),
                      ),
                    ),
                  ),
                ],
                PollVoteUpdatedAt(
                  dateTime: pollVote.updatedAt.toLocal(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PollVoteUpdatedAt extends StatelessWidget {
  const PollVoteUpdatedAt({
    super.key,
    required this.dateTime,
  });

  /// The date and time when the poll vote was last updated.
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Text(dateTime.toString());
  }
}
