// Code generated by GetStream internal OpenAPI code generator. DO NOT EDIT.

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: use_string_in_part_of_directives
// ignore_for_file: unnecessary_raw_strings
// ignore_for_file: unnecessary_null_in_if_null_operators
// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_single_quotes
// ignore_for_file: require_trailing_commas

part of openapi.api;

enum ChannelOwnCapability {
  banChannelMembers('ban-channel-members'),
  castPollVote('cast-poll-vote'),
  connectEvents('connect-events'),
  createAttachment('create-attachment'),
  deleteAnyMessage('delete-any-message'),
  deleteChannel('delete-channel'),
  deleteOwnMessage('delete-own-message'),
  flagMessage('flag-message'),
  freezeChannel('freeze-channel'),
  joinChannel('join-channel'),
  leaveChannel('leave-channel'),
  muteChannel('mute-channel'),
  pinMessage('pin-message'),
  queryPollVotes('query-poll-votes'),
  quoteMessage('quote-message'),
  readEvents('read-events'),
  searchMessages('search-messages'),
  sendCustomEvents('send-custom-events'),
  sendLinks('send-links'),
  sendMessage('send-message'),
  sendPoll('send-poll'),
  sendReaction('send-reaction'),
  sendReply('send-reply'),
  sendRestrictedVisibilityMessage('send-restricted-visibility-message'),
  sendTypingEvents('send-typing-events'),
  setChannelCooldown('set-channel-cooldown'),
  shareLocation('share-location'),
  skipSlowMode('skip-slow-mode'),
  slowMode('slow-mode'),
  typingEvents('typing-events'),
  updateAnyMessage('update-any-message'),
  updateChannel('update-channel'),
  updateChannelMembers('update-channel-members'),
  updateOwnMessage('update-own-message'),
  updateThread('update-thread'),
  uploadFile('upload-file'),
  ;

  const ChannelOwnCapability(this.value);
  final String value;

  static ChannelOwnCapability fromJson(String json) {
    switch (json) {
      case 'ban-channel-members':
        return ChannelOwnCapability.banChannelMembers;
      case 'cast-poll-vote':
        return ChannelOwnCapability.castPollVote;
      case 'connect-events':
        return ChannelOwnCapability.connectEvents;
      case 'create-attachment':
        return ChannelOwnCapability.createAttachment;
      case 'delete-any-message':
        return ChannelOwnCapability.deleteAnyMessage;
      case 'delete-channel':
        return ChannelOwnCapability.deleteChannel;
      case 'delete-own-message':
        return ChannelOwnCapability.deleteOwnMessage;
      case 'flag-message':
        return ChannelOwnCapability.flagMessage;
      case 'freeze-channel':
        return ChannelOwnCapability.freezeChannel;
      case 'join-channel':
        return ChannelOwnCapability.joinChannel;
      case 'leave-channel':
        return ChannelOwnCapability.leaveChannel;
      case 'mute-channel':
        return ChannelOwnCapability.muteChannel;
      case 'pin-message':
        return ChannelOwnCapability.pinMessage;
      case 'query-poll-votes':
        return ChannelOwnCapability.queryPollVotes;
      case 'quote-message':
        return ChannelOwnCapability.quoteMessage;
      case 'read-events':
        return ChannelOwnCapability.readEvents;
      case 'search-messages':
        return ChannelOwnCapability.searchMessages;
      case 'send-custom-events':
        return ChannelOwnCapability.sendCustomEvents;
      case 'send-links':
        return ChannelOwnCapability.sendLinks;
      case 'send-message':
        return ChannelOwnCapability.sendMessage;
      case 'send-poll':
        return ChannelOwnCapability.sendPoll;
      case 'send-reaction':
        return ChannelOwnCapability.sendReaction;
      case 'send-reply':
        return ChannelOwnCapability.sendReply;
      case 'send-restricted-visibility-message':
        return ChannelOwnCapability.sendRestrictedVisibilityMessage;
      case 'send-typing-events':
        return ChannelOwnCapability.sendTypingEvents;
      case 'set-channel-cooldown':
        return ChannelOwnCapability.setChannelCooldown;
      case 'share-location':
        return ChannelOwnCapability.shareLocation;
      case 'skip-slow-mode':
        return ChannelOwnCapability.skipSlowMode;
      case 'slow-mode':
        return ChannelOwnCapability.slowMode;
      case 'typing-events':
        return ChannelOwnCapability.typingEvents;
      case 'update-any-message':
        return ChannelOwnCapability.updateAnyMessage;
      case 'update-channel':
        return ChannelOwnCapability.updateChannel;
      case 'update-channel-members':
        return ChannelOwnCapability.updateChannelMembers;
      case 'update-own-message':
        return ChannelOwnCapability.updateOwnMessage;
      case 'update-thread':
        return ChannelOwnCapability.updateThread;
      case 'upload-file':
        return ChannelOwnCapability.uploadFile;

      default:
        throw ArgumentError('Unknown ChannelOwnCapability value: $json');
    }
  }

  static List<ChannelOwnCapability> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ChannelOwnCapability>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        result.add(ChannelOwnCapability.fromJson(row));
      }
    }
    return result.toList(growable: growable);
  }

  String toJson() => value;

  @override
  String toString() => value;
}
