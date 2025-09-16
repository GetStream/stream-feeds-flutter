import 'package:stream_feed/stream_feed.dart';

late StreamFeedsClient client;
late Feed feed;
late Activity activity;

Future<void> creatingAPoll() async {
  // Create a poll
  final poll = await feed.createPoll(
    request: const CreatePollRequest(
      name: 'Where should we host our next company event?',
      options: [
        PollOptionInput(text: 'Amsterdam, The Netherlands'),
        PollOptionInput(text: 'Boulder, CO'),
      ],
    ),
    activityType: 'poll',
  );

  // The poll is automatically added as an activity to the feed
  print('Poll created with ID: ${poll.getOrThrow().id}');
}

Future<void> pollOptions() async {
  final poll = await feed.createPoll(
    request: const CreatePollRequest(
      custom: {'category': 'event_planning', 'priority': 'high'},
      name: 'Where should we host our next company event?',
      options: [
        PollOptionInput(
          custom: {'country': 'Netherlands', 'timezone': 'CET'},
          text: 'Amsterdam, The Netherlands',
        ),
        PollOptionInput(
          custom: {'country': 'USA', 'timezone': 'MST'},
          text: 'Boulder, CO',
        ),
      ],
    ),
    activityType: 'poll',
  );
}

Future<void> sendVoteOnOption() async {
  final activity = client.activity(
    activityId: 'activity_123',
    fid: const FeedId(group: 'user', id: 'test'),
  );

  final votes = await activity.castPollVote(
    const CastPollVoteRequest(vote: VoteData(optionId: 'option_789')),
  );
}

Future<void> sendAnAnswer() async {
  final votes = await activity.castPollVote(
    const CastPollVoteRequest(
      vote: VoteData(answerText: "Let's go somewhere else"),
    ),
  );
}

Future<void> removingAVote() async {
  final votes = await activity.deletePollVote(voteId: 'vote_789');
}

Future<void> closingAPoll() async {
  final poll = await activity.closePoll();
}

Future<void> retrievingAPoll() async {
  final poll = await activity.getPoll();
}

Future<void> fullUpdate() async {
  final updatedPoll = await activity.updatePoll(
    const UpdatePollRequest(
      id: 'poll_456',
      name: 'Where should we not go to?',
      options: [
        PollOptionRequest(
          custom: {'reason': 'too expensive'},
          id: 'option_789',
          text: 'Amsterdam, The Netherlands',
        ),
        PollOptionRequest(
          custom: {'reason': 'too far'},
          id: 'option_790',
          text: 'Boulder, CO',
        ),
      ],
    ),
  );
}

Future<void> partialUpdate() async {
  final updatedPoll = await activity.updatePollPartial(
    const UpdatePollPartialRequest(
      set: {'name': 'Updated poll name'},
      unset: ['custom_property'],
    ),
  );
}

Future<void> deletingAPoll() async {
  final poll = await activity.deletePoll();
}

Future<void> addPollOption() async {
  final pollOption = await activity.createPollOption(
    const CreatePollOptionRequest(
      custom: {'added_by': 'user_123'},
      text: 'Another option',
    ),
  );
}

Future<void> updatePollOption() async {
  final updatedPollOption = await activity.updatePollOption(
    const UpdatePollOptionRequest(
      custom: {'my_custom_property': 'my_custom_value'},
      id: 'option_789',
      text: 'Updated option',
    ),
  );
}

Future<void> deletePollOption() async {
  final pollOption = await activity.deletePollOption(optionId: 'option_789');
}

Future<void> queryingVotes() async {
  // Retrieve all votes on either option1Id or option2Id
  final pollVoteList = client.pollVoteList(
    const PollVotesQuery(
      pollId: 'poll_456',
      filter: Filter.in_(
        PollVotesFilterField.optionId,
        ['option_789', 'option_790'],
      ),
    ),
  );
  final votesPage1 = await pollVoteList.get();
  final votesPage2 = await pollVoteList.queryMorePollVotes();
  final votesPage1And2 = pollVoteList.state.votes;
}

Future<void> queryingPolls() async {
  // Retrieve all polls that are closed for voting sorted by created_at
  final pollList = client.pollList(
    const PollsQuery(
      filter: Filter.equal(PollsFilterField.isClosed, true),
    ),
  );
  final pollsPage1 = await pollList.get();
  final pollsPage2 = await pollList.queryMorePolls();
  final pollsPage1And2 = pollList.state.polls;
}
