// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {
  List<Attachment> get attachments;
  bool? get beforeMessageSendFailed;
  String get cid;
  String? get command;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get deletedAt;
  bool? get deletedForMe;
  int get deletedReplyCount;
  String get html;
  Map<String, String>? get i18n;
  String get id;
  Map<String, List<String>>? get imageLabels;
  List<Reaction> get latestReactions;
  ChannelMember? get member;
  List<User> get mentionedUsers;
  DateTime? get messageTextUpdatedAt;
  String? get mml;
  ModerationV2Response? get moderation;
  List<Reaction> get ownReactions;
  String? get parentId;
  DateTime? get pinExpires;
  bool get pinned;
  DateTime? get pinnedAt;
  User? get pinnedBy;
  Poll? get poll;
  String? get pollId;
  Message? get quotedMessage;
  String? get quotedMessageId;
  Map<String, int> get reactionCounts;
  Map<String, ReactionGroupResponse> get reactionGroups;
  Map<String, int> get reactionScores;
  MessageReminder? get reminder;
  int get replyCount;
  List<String> get restrictedVisibility;
  bool get shadowed;
  SharedLocation? get sharedLocation;
  bool? get showInChannel;
  bool get silent;
  String get text;
  List<User>? get threadParticipants;
  String get type;
  DateTime get updatedAt;
  User? get user;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageCopyWith<Message> get copyWith =>
      _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Message &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(
                    other.beforeMessageSendFailed, beforeMessageSendFailed) ||
                other.beforeMessageSendFailed == beforeMessageSendFailed) &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.command, command) || other.command == command) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.deletedForMe, deletedForMe) ||
                other.deletedForMe == deletedForMe) &&
            (identical(other.deletedReplyCount, deletedReplyCount) ||
                other.deletedReplyCount == deletedReplyCount) &&
            (identical(other.html, html) || other.html == html) &&
            const DeepCollectionEquality().equals(other.i18n, i18n) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.imageLabels, imageLabels) &&
            const DeepCollectionEquality()
                .equals(other.latestReactions, latestReactions) &&
            (identical(other.member, member) || other.member == member) &&
            const DeepCollectionEquality()
                .equals(other.mentionedUsers, mentionedUsers) &&
            (identical(other.messageTextUpdatedAt, messageTextUpdatedAt) ||
                other.messageTextUpdatedAt == messageTextUpdatedAt) &&
            (identical(other.mml, mml) || other.mml == mml) &&
            (identical(other.moderation, moderation) ||
                other.moderation == moderation) &&
            const DeepCollectionEquality()
                .equals(other.ownReactions, ownReactions) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.pinExpires, pinExpires) ||
                other.pinExpires == pinExpires) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.pinnedAt, pinnedAt) ||
                other.pinnedAt == pinnedAt) &&
            (identical(other.pinnedBy, pinnedBy) ||
                other.pinnedBy == pinnedBy) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.pollId, pollId) || other.pollId == pollId) &&
            (identical(other.quotedMessage, quotedMessage) ||
                other.quotedMessage == quotedMessage) &&
            (identical(other.quotedMessageId, quotedMessageId) ||
                other.quotedMessageId == quotedMessageId) &&
            const DeepCollectionEquality()
                .equals(other.reactionCounts, reactionCounts) &&
            const DeepCollectionEquality()
                .equals(other.reactionGroups, reactionGroups) &&
            const DeepCollectionEquality()
                .equals(other.reactionScores, reactionScores) &&
            (identical(other.reminder, reminder) ||
                other.reminder == reminder) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            const DeepCollectionEquality()
                .equals(other.restrictedVisibility, restrictedVisibility) &&
            (identical(other.shadowed, shadowed) ||
                other.shadowed == shadowed) &&
            (identical(other.sharedLocation, sharedLocation) ||
                other.sharedLocation == sharedLocation) &&
            (identical(other.showInChannel, showInChannel) ||
                other.showInChannel == showInChannel) &&
            (identical(other.silent, silent) || other.silent == silent) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other.threadParticipants, threadParticipants) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(attachments),
        beforeMessageSendFailed,
        cid,
        command,
        createdAt,
        const DeepCollectionEquality().hash(custom),
        deletedAt,
        deletedForMe,
        deletedReplyCount,
        html,
        const DeepCollectionEquality().hash(i18n),
        id,
        const DeepCollectionEquality().hash(imageLabels),
        const DeepCollectionEquality().hash(latestReactions),
        member,
        const DeepCollectionEquality().hash(mentionedUsers),
        messageTextUpdatedAt,
        mml,
        moderation,
        const DeepCollectionEquality().hash(ownReactions),
        parentId,
        pinExpires,
        pinned,
        pinnedAt,
        pinnedBy,
        poll,
        pollId,
        quotedMessage,
        quotedMessageId,
        const DeepCollectionEquality().hash(reactionCounts),
        const DeepCollectionEquality().hash(reactionGroups),
        const DeepCollectionEquality().hash(reactionScores),
        reminder,
        replyCount,
        const DeepCollectionEquality().hash(restrictedVisibility),
        shadowed,
        sharedLocation,
        showInChannel,
        silent,
        text,
        const DeepCollectionEquality().hash(threadParticipants),
        type,
        updatedAt,
        user
      ]);

  @override
  String toString() {
    return 'Message(attachments: $attachments, beforeMessageSendFailed: $beforeMessageSendFailed, cid: $cid, command: $command, createdAt: $createdAt, custom: $custom, deletedAt: $deletedAt, deletedForMe: $deletedForMe, deletedReplyCount: $deletedReplyCount, html: $html, i18n: $i18n, id: $id, imageLabels: $imageLabels, latestReactions: $latestReactions, member: $member, mentionedUsers: $mentionedUsers, messageTextUpdatedAt: $messageTextUpdatedAt, mml: $mml, moderation: $moderation, ownReactions: $ownReactions, parentId: $parentId, pinExpires: $pinExpires, pinned: $pinned, pinnedAt: $pinnedAt, pinnedBy: $pinnedBy, poll: $poll, pollId: $pollId, quotedMessage: $quotedMessage, quotedMessageId: $quotedMessageId, reactionCounts: $reactionCounts, reactionGroups: $reactionGroups, reactionScores: $reactionScores, reminder: $reminder, replyCount: $replyCount, restrictedVisibility: $restrictedVisibility, shadowed: $shadowed, sharedLocation: $sharedLocation, showInChannel: $showInChannel, silent: $silent, text: $text, threadParticipants: $threadParticipants, type: $type, updatedAt: $updatedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) =
      _$MessageCopyWithImpl;
  @useResult
  $Res call(
      {List<Attachment> attachments,
      bool? beforeMessageSendFailed,
      String cid,
      String? command,
      DateTime createdAt,
      Map<String, Object?> custom,
      DateTime? deletedAt,
      bool? deletedForMe,
      int deletedReplyCount,
      String html,
      Map<String, String>? i18n,
      String id,
      Map<String, List<String>>? imageLabels,
      List<Reaction> latestReactions,
      ChannelMember? member,
      List<User> mentionedUsers,
      DateTime? messageTextUpdatedAt,
      String? mml,
      ModerationV2Response? moderation,
      List<Reaction> ownReactions,
      String? parentId,
      DateTime? pinExpires,
      bool pinned,
      DateTime? pinnedAt,
      User? pinnedBy,
      Poll? poll,
      String? pollId,
      Message? quotedMessage,
      String? quotedMessageId,
      Map<String, int> reactionCounts,
      Map<String, ReactionGroupResponse> reactionGroups,
      Map<String, int> reactionScores,
      MessageReminder? reminder,
      int replyCount,
      List<String> restrictedVisibility,
      bool shadowed,
      SharedLocation? sharedLocation,
      bool? showInChannel,
      bool silent,
      String text,
      List<User>? threadParticipants,
      String type,
      DateTime updatedAt,
      User? user});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = null,
    Object? beforeMessageSendFailed = freezed,
    Object? cid = null,
    Object? command = freezed,
    Object? createdAt = null,
    Object? custom = null,
    Object? deletedAt = freezed,
    Object? deletedForMe = freezed,
    Object? deletedReplyCount = null,
    Object? html = null,
    Object? i18n = freezed,
    Object? id = null,
    Object? imageLabels = freezed,
    Object? latestReactions = null,
    Object? member = freezed,
    Object? mentionedUsers = null,
    Object? messageTextUpdatedAt = freezed,
    Object? mml = freezed,
    Object? moderation = freezed,
    Object? ownReactions = null,
    Object? parentId = freezed,
    Object? pinExpires = freezed,
    Object? pinned = null,
    Object? pinnedAt = freezed,
    Object? pinnedBy = freezed,
    Object? poll = freezed,
    Object? pollId = freezed,
    Object? quotedMessage = freezed,
    Object? quotedMessageId = freezed,
    Object? reactionCounts = null,
    Object? reactionGroups = null,
    Object? reactionScores = null,
    Object? reminder = freezed,
    Object? replyCount = null,
    Object? restrictedVisibility = null,
    Object? shadowed = null,
    Object? sharedLocation = freezed,
    Object? showInChannel = freezed,
    Object? silent = null,
    Object? text = null,
    Object? threadParticipants = freezed,
    Object? type = null,
    Object? updatedAt = null,
    Object? user = freezed,
  }) {
    return _then(Message(
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      beforeMessageSendFailed: freezed == beforeMessageSendFailed
          ? _self.beforeMessageSendFailed
          : beforeMessageSendFailed // ignore: cast_nullable_to_non_nullable
              as bool?,
      cid: null == cid
          ? _self.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      command: freezed == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedForMe: freezed == deletedForMe
          ? _self.deletedForMe
          : deletedForMe // ignore: cast_nullable_to_non_nullable
              as bool?,
      deletedReplyCount: null == deletedReplyCount
          ? _self.deletedReplyCount
          : deletedReplyCount // ignore: cast_nullable_to_non_nullable
              as int,
      html: null == html
          ? _self.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      i18n: freezed == i18n
          ? _self.i18n
          : i18n // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageLabels: freezed == imageLabels
          ? _self.imageLabels
          : imageLabels // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
      latestReactions: null == latestReactions
          ? _self.latestReactions
          : latestReactions // ignore: cast_nullable_to_non_nullable
              as List<Reaction>,
      member: freezed == member
          ? _self.member
          : member // ignore: cast_nullable_to_non_nullable
              as ChannelMember?,
      mentionedUsers: null == mentionedUsers
          ? _self.mentionedUsers
          : mentionedUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      messageTextUpdatedAt: freezed == messageTextUpdatedAt
          ? _self.messageTextUpdatedAt
          : messageTextUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mml: freezed == mml
          ? _self.mml
          : mml // ignore: cast_nullable_to_non_nullable
              as String?,
      moderation: freezed == moderation
          ? _self.moderation
          : moderation // ignore: cast_nullable_to_non_nullable
              as ModerationV2Response?,
      ownReactions: null == ownReactions
          ? _self.ownReactions
          : ownReactions // ignore: cast_nullable_to_non_nullable
              as List<Reaction>,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      pinExpires: freezed == pinExpires
          ? _self.pinExpires
          : pinExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pinned: null == pinned
          ? _self.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      pinnedAt: freezed == pinnedAt
          ? _self.pinnedAt
          : pinnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pinnedBy: freezed == pinnedBy
          ? _self.pinnedBy
          : pinnedBy // ignore: cast_nullable_to_non_nullable
              as User?,
      poll: freezed == poll
          ? _self.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as Poll?,
      pollId: freezed == pollId
          ? _self.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String?,
      quotedMessage: freezed == quotedMessage
          ? _self.quotedMessage
          : quotedMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
      quotedMessageId: freezed == quotedMessageId
          ? _self.quotedMessageId
          : quotedMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      reactionCounts: null == reactionCounts
          ? _self.reactionCounts
          : reactionCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      reactionGroups: null == reactionGroups
          ? _self.reactionGroups
          : reactionGroups // ignore: cast_nullable_to_non_nullable
              as Map<String, ReactionGroupResponse>,
      reactionScores: null == reactionScores
          ? _self.reactionScores
          : reactionScores // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      reminder: freezed == reminder
          ? _self.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as MessageReminder?,
      replyCount: null == replyCount
          ? _self.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      restrictedVisibility: null == restrictedVisibility
          ? _self.restrictedVisibility
          : restrictedVisibility // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shadowed: null == shadowed
          ? _self.shadowed
          : shadowed // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedLocation: freezed == sharedLocation
          ? _self.sharedLocation
          : sharedLocation // ignore: cast_nullable_to_non_nullable
              as SharedLocation?,
      showInChannel: freezed == showInChannel
          ? _self.showInChannel
          : showInChannel // ignore: cast_nullable_to_non_nullable
              as bool?,
      silent: null == silent
          ? _self.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      threadParticipants: freezed == threadParticipants
          ? _self.threadParticipants
          : threadParticipants // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

// dart format on
