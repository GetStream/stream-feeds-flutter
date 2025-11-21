// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelConfig {
  List<String>? get allowedFlagReasons;
  ChannelConfigAutomod get automod;
  ChannelConfigAutomodBehavior get automodBehavior;
  Thresholds? get automodThresholds;
  String? get blocklist;
  ChannelConfigBlocklistBehavior? get blocklistBehavior;
  List<BlockListOptions>? get blocklists;
  List<String> get commands;
  bool get connectEvents;
  bool get countMessages;
  DateTime get createdAt;
  bool get customEvents;
  bool get deliveryEvents;
  bool get markMessagesPending;
  int get maxMessageLength;
  bool get mutes;
  String get name;
  int? get partitionSize;
  int? get partitionTtl;
  bool get polls;
  bool get pushNotifications;
  bool get quotes;
  bool get reactions;
  bool get readEvents;
  bool get reminders;
  bool get replies;
  bool get search;
  bool get sharedLocations;
  bool get skipLastMsgUpdateForSystemMsgs;
  bool get typingEvents;
  DateTime get updatedAt;
  bool get uploads;
  bool get urlEnrichment;
  bool get userMessageReminders;

  /// Create a copy of ChannelConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelConfigCopyWith<ChannelConfig> get copyWith =>
      _$ChannelConfigCopyWithImpl<ChannelConfig>(
          this as ChannelConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelConfig &&
            const DeepCollectionEquality()
                .equals(other.allowedFlagReasons, allowedFlagReasons) &&
            (identical(other.automod, automod) || other.automod == automod) &&
            (identical(other.automodBehavior, automodBehavior) ||
                other.automodBehavior == automodBehavior) &&
            (identical(other.automodThresholds, automodThresholds) ||
                other.automodThresholds == automodThresholds) &&
            (identical(other.blocklist, blocklist) ||
                other.blocklist == blocklist) &&
            (identical(other.blocklistBehavior, blocklistBehavior) ||
                other.blocklistBehavior == blocklistBehavior) &&
            const DeepCollectionEquality()
                .equals(other.blocklists, blocklists) &&
            const DeepCollectionEquality().equals(other.commands, commands) &&
            (identical(other.connectEvents, connectEvents) ||
                other.connectEvents == connectEvents) &&
            (identical(other.countMessages, countMessages) ||
                other.countMessages == countMessages) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.customEvents, customEvents) ||
                other.customEvents == customEvents) &&
            (identical(other.deliveryEvents, deliveryEvents) ||
                other.deliveryEvents == deliveryEvents) &&
            (identical(other.markMessagesPending, markMessagesPending) ||
                other.markMessagesPending == markMessagesPending) &&
            (identical(other.maxMessageLength, maxMessageLength) ||
                other.maxMessageLength == maxMessageLength) &&
            (identical(other.mutes, mutes) || other.mutes == mutes) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.partitionSize, partitionSize) ||
                other.partitionSize == partitionSize) &&
            (identical(other.partitionTtl, partitionTtl) ||
                other.partitionTtl == partitionTtl) &&
            (identical(other.polls, polls) || other.polls == polls) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.quotes, quotes) || other.quotes == quotes) &&
            (identical(other.reactions, reactions) ||
                other.reactions == reactions) &&
            (identical(other.readEvents, readEvents) ||
                other.readEvents == readEvents) &&
            (identical(other.reminders, reminders) ||
                other.reminders == reminders) &&
            (identical(other.replies, replies) || other.replies == replies) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.sharedLocations, sharedLocations) ||
                other.sharedLocations == sharedLocations) &&
            (identical(other.skipLastMsgUpdateForSystemMsgs,
                    skipLastMsgUpdateForSystemMsgs) ||
                other.skipLastMsgUpdateForSystemMsgs ==
                    skipLastMsgUpdateForSystemMsgs) &&
            (identical(other.typingEvents, typingEvents) ||
                other.typingEvents == typingEvents) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.uploads, uploads) || other.uploads == uploads) &&
            (identical(other.urlEnrichment, urlEnrichment) ||
                other.urlEnrichment == urlEnrichment) &&
            (identical(other.userMessageReminders, userMessageReminders) ||
                other.userMessageReminders == userMessageReminders));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(allowedFlagReasons),
        automod,
        automodBehavior,
        automodThresholds,
        blocklist,
        blocklistBehavior,
        const DeepCollectionEquality().hash(blocklists),
        const DeepCollectionEquality().hash(commands),
        connectEvents,
        countMessages,
        createdAt,
        customEvents,
        deliveryEvents,
        markMessagesPending,
        maxMessageLength,
        mutes,
        name,
        partitionSize,
        partitionTtl,
        polls,
        pushNotifications,
        quotes,
        reactions,
        readEvents,
        reminders,
        replies,
        search,
        sharedLocations,
        skipLastMsgUpdateForSystemMsgs,
        typingEvents,
        updatedAt,
        uploads,
        urlEnrichment,
        userMessageReminders
      ]);

  @override
  String toString() {
    return 'ChannelConfig(allowedFlagReasons: $allowedFlagReasons, automod: $automod, automodBehavior: $automodBehavior, automodThresholds: $automodThresholds, blocklist: $blocklist, blocklistBehavior: $blocklistBehavior, blocklists: $blocklists, commands: $commands, connectEvents: $connectEvents, countMessages: $countMessages, createdAt: $createdAt, customEvents: $customEvents, deliveryEvents: $deliveryEvents, markMessagesPending: $markMessagesPending, maxMessageLength: $maxMessageLength, mutes: $mutes, name: $name, partitionSize: $partitionSize, partitionTtl: $partitionTtl, polls: $polls, pushNotifications: $pushNotifications, quotes: $quotes, reactions: $reactions, readEvents: $readEvents, reminders: $reminders, replies: $replies, search: $search, sharedLocations: $sharedLocations, skipLastMsgUpdateForSystemMsgs: $skipLastMsgUpdateForSystemMsgs, typingEvents: $typingEvents, updatedAt: $updatedAt, uploads: $uploads, urlEnrichment: $urlEnrichment, userMessageReminders: $userMessageReminders)';
  }
}

/// @nodoc
abstract mixin class $ChannelConfigCopyWith<$Res> {
  factory $ChannelConfigCopyWith(
          ChannelConfig value, $Res Function(ChannelConfig) _then) =
      _$ChannelConfigCopyWithImpl;
  @useResult
  $Res call(
      {List<String>? allowedFlagReasons,
      ChannelConfigAutomod automod,
      ChannelConfigAutomodBehavior automodBehavior,
      Thresholds? automodThresholds,
      String? blocklist,
      ChannelConfigBlocklistBehavior? blocklistBehavior,
      List<BlockListOptions>? blocklists,
      List<String> commands,
      bool connectEvents,
      bool countMessages,
      DateTime createdAt,
      bool customEvents,
      bool deliveryEvents,
      bool markMessagesPending,
      int maxMessageLength,
      bool mutes,
      String name,
      int? partitionSize,
      int? partitionTtl,
      bool polls,
      bool pushNotifications,
      bool quotes,
      bool reactions,
      bool readEvents,
      bool reminders,
      bool replies,
      bool search,
      bool sharedLocations,
      bool skipLastMsgUpdateForSystemMsgs,
      bool typingEvents,
      DateTime updatedAt,
      bool uploads,
      bool urlEnrichment,
      bool userMessageReminders});
}

/// @nodoc
class _$ChannelConfigCopyWithImpl<$Res>
    implements $ChannelConfigCopyWith<$Res> {
  _$ChannelConfigCopyWithImpl(this._self, this._then);

  final ChannelConfig _self;
  final $Res Function(ChannelConfig) _then;

  /// Create a copy of ChannelConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowedFlagReasons = freezed,
    Object? automod = null,
    Object? automodBehavior = null,
    Object? automodThresholds = freezed,
    Object? blocklist = freezed,
    Object? blocklistBehavior = freezed,
    Object? blocklists = freezed,
    Object? commands = null,
    Object? connectEvents = null,
    Object? countMessages = null,
    Object? createdAt = null,
    Object? customEvents = null,
    Object? deliveryEvents = null,
    Object? markMessagesPending = null,
    Object? maxMessageLength = null,
    Object? mutes = null,
    Object? name = null,
    Object? partitionSize = freezed,
    Object? partitionTtl = freezed,
    Object? polls = null,
    Object? pushNotifications = null,
    Object? quotes = null,
    Object? reactions = null,
    Object? readEvents = null,
    Object? reminders = null,
    Object? replies = null,
    Object? search = null,
    Object? sharedLocations = null,
    Object? skipLastMsgUpdateForSystemMsgs = null,
    Object? typingEvents = null,
    Object? updatedAt = null,
    Object? uploads = null,
    Object? urlEnrichment = null,
    Object? userMessageReminders = null,
  }) {
    return _then(ChannelConfig(
      allowedFlagReasons: freezed == allowedFlagReasons
          ? _self.allowedFlagReasons
          : allowedFlagReasons // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      automod: null == automod
          ? _self.automod
          : automod // ignore: cast_nullable_to_non_nullable
              as ChannelConfigAutomod,
      automodBehavior: null == automodBehavior
          ? _self.automodBehavior
          : automodBehavior // ignore: cast_nullable_to_non_nullable
              as ChannelConfigAutomodBehavior,
      automodThresholds: freezed == automodThresholds
          ? _self.automodThresholds
          : automodThresholds // ignore: cast_nullable_to_non_nullable
              as Thresholds?,
      blocklist: freezed == blocklist
          ? _self.blocklist
          : blocklist // ignore: cast_nullable_to_non_nullable
              as String?,
      blocklistBehavior: freezed == blocklistBehavior
          ? _self.blocklistBehavior
          : blocklistBehavior // ignore: cast_nullable_to_non_nullable
              as ChannelConfigBlocklistBehavior?,
      blocklists: freezed == blocklists
          ? _self.blocklists
          : blocklists // ignore: cast_nullable_to_non_nullable
              as List<BlockListOptions>?,
      commands: null == commands
          ? _self.commands
          : commands // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectEvents: null == connectEvents
          ? _self.connectEvents
          : connectEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      countMessages: null == countMessages
          ? _self.countMessages
          : countMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customEvents: null == customEvents
          ? _self.customEvents
          : customEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryEvents: null == deliveryEvents
          ? _self.deliveryEvents
          : deliveryEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      markMessagesPending: null == markMessagesPending
          ? _self.markMessagesPending
          : markMessagesPending // ignore: cast_nullable_to_non_nullable
              as bool,
      maxMessageLength: null == maxMessageLength
          ? _self.maxMessageLength
          : maxMessageLength // ignore: cast_nullable_to_non_nullable
              as int,
      mutes: null == mutes
          ? _self.mutes
          : mutes // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      partitionSize: freezed == partitionSize
          ? _self.partitionSize
          : partitionSize // ignore: cast_nullable_to_non_nullable
              as int?,
      partitionTtl: freezed == partitionTtl
          ? _self.partitionTtl
          : partitionTtl // ignore: cast_nullable_to_non_nullable
              as int?,
      polls: null == polls
          ? _self.polls
          : polls // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _self.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      quotes: null == quotes
          ? _self.quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as bool,
      reactions: null == reactions
          ? _self.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as bool,
      readEvents: null == readEvents
          ? _self.readEvents
          : readEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      reminders: null == reminders
          ? _self.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as bool,
      replies: null == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as bool,
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedLocations: null == sharedLocations
          ? _self.sharedLocations
          : sharedLocations // ignore: cast_nullable_to_non_nullable
              as bool,
      skipLastMsgUpdateForSystemMsgs: null == skipLastMsgUpdateForSystemMsgs
          ? _self.skipLastMsgUpdateForSystemMsgs
          : skipLastMsgUpdateForSystemMsgs // ignore: cast_nullable_to_non_nullable
              as bool,
      typingEvents: null == typingEvents
          ? _self.typingEvents
          : typingEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploads: null == uploads
          ? _self.uploads
          : uploads // ignore: cast_nullable_to_non_nullable
              as bool,
      urlEnrichment: null == urlEnrichment
          ? _self.urlEnrichment
          : urlEnrichment // ignore: cast_nullable_to_non_nullable
              as bool,
      userMessageReminders: null == userMessageReminders
          ? _self.userMessageReminders
          : userMessageReminders // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
