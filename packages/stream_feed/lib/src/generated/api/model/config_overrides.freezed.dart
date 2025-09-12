// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_overrides.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfigOverrides {
  String? get blocklist;
  ConfigOverridesBlocklistBehavior? get blocklistBehavior;
  List<String> get commands;
  bool? get countMessages;
  Map<String, List<String>> get grants;
  int? get maxMessageLength;
  bool? get quotes;
  bool? get reactions;
  bool? get replies;
  bool? get sharedLocations;
  bool? get typingEvents;
  bool? get uploads;
  bool? get urlEnrichment;
  bool? get userMessageReminders;

  /// Create a copy of ConfigOverrides
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfigOverridesCopyWith<ConfigOverrides> get copyWith =>
      _$ConfigOverridesCopyWithImpl<ConfigOverrides>(
          this as ConfigOverrides, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfigOverrides &&
            (identical(other.blocklist, blocklist) ||
                other.blocklist == blocklist) &&
            (identical(other.blocklistBehavior, blocklistBehavior) ||
                other.blocklistBehavior == blocklistBehavior) &&
            const DeepCollectionEquality().equals(other.commands, commands) &&
            (identical(other.countMessages, countMessages) ||
                other.countMessages == countMessages) &&
            const DeepCollectionEquality().equals(other.grants, grants) &&
            (identical(other.maxMessageLength, maxMessageLength) ||
                other.maxMessageLength == maxMessageLength) &&
            (identical(other.quotes, quotes) || other.quotes == quotes) &&
            (identical(other.reactions, reactions) ||
                other.reactions == reactions) &&
            (identical(other.replies, replies) || other.replies == replies) &&
            (identical(other.sharedLocations, sharedLocations) ||
                other.sharedLocations == sharedLocations) &&
            (identical(other.typingEvents, typingEvents) ||
                other.typingEvents == typingEvents) &&
            (identical(other.uploads, uploads) || other.uploads == uploads) &&
            (identical(other.urlEnrichment, urlEnrichment) ||
                other.urlEnrichment == urlEnrichment) &&
            (identical(other.userMessageReminders, userMessageReminders) ||
                other.userMessageReminders == userMessageReminders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      blocklist,
      blocklistBehavior,
      const DeepCollectionEquality().hash(commands),
      countMessages,
      const DeepCollectionEquality().hash(grants),
      maxMessageLength,
      quotes,
      reactions,
      replies,
      sharedLocations,
      typingEvents,
      uploads,
      urlEnrichment,
      userMessageReminders);

  @override
  String toString() {
    return 'ConfigOverrides(blocklist: $blocklist, blocklistBehavior: $blocklistBehavior, commands: $commands, countMessages: $countMessages, grants: $grants, maxMessageLength: $maxMessageLength, quotes: $quotes, reactions: $reactions, replies: $replies, sharedLocations: $sharedLocations, typingEvents: $typingEvents, uploads: $uploads, urlEnrichment: $urlEnrichment, userMessageReminders: $userMessageReminders)';
  }
}

/// @nodoc
abstract mixin class $ConfigOverridesCopyWith<$Res> {
  factory $ConfigOverridesCopyWith(
          ConfigOverrides value, $Res Function(ConfigOverrides) _then) =
      _$ConfigOverridesCopyWithImpl;
  @useResult
  $Res call(
      {String? blocklist,
      ConfigOverridesBlocklistBehavior? blocklistBehavior,
      List<String> commands,
      bool? countMessages,
      Map<String, List<String>> grants,
      int? maxMessageLength,
      bool? quotes,
      bool? reactions,
      bool? replies,
      bool? sharedLocations,
      bool? typingEvents,
      bool? uploads,
      bool? urlEnrichment,
      bool? userMessageReminders});
}

/// @nodoc
class _$ConfigOverridesCopyWithImpl<$Res>
    implements $ConfigOverridesCopyWith<$Res> {
  _$ConfigOverridesCopyWithImpl(this._self, this._then);

  final ConfigOverrides _self;
  final $Res Function(ConfigOverrides) _then;

  /// Create a copy of ConfigOverrides
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocklist = freezed,
    Object? blocklistBehavior = freezed,
    Object? commands = null,
    Object? countMessages = freezed,
    Object? grants = null,
    Object? maxMessageLength = freezed,
    Object? quotes = freezed,
    Object? reactions = freezed,
    Object? replies = freezed,
    Object? sharedLocations = freezed,
    Object? typingEvents = freezed,
    Object? uploads = freezed,
    Object? urlEnrichment = freezed,
    Object? userMessageReminders = freezed,
  }) {
    return _then(ConfigOverrides(
      blocklist: freezed == blocklist
          ? _self.blocklist
          : blocklist // ignore: cast_nullable_to_non_nullable
              as String?,
      blocklistBehavior: freezed == blocklistBehavior
          ? _self.blocklistBehavior
          : blocklistBehavior // ignore: cast_nullable_to_non_nullable
              as ConfigOverridesBlocklistBehavior?,
      commands: null == commands
          ? _self.commands
          : commands // ignore: cast_nullable_to_non_nullable
              as List<String>,
      countMessages: freezed == countMessages
          ? _self.countMessages
          : countMessages // ignore: cast_nullable_to_non_nullable
              as bool?,
      grants: null == grants
          ? _self.grants
          : grants // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      maxMessageLength: freezed == maxMessageLength
          ? _self.maxMessageLength
          : maxMessageLength // ignore: cast_nullable_to_non_nullable
              as int?,
      quotes: freezed == quotes
          ? _self.quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as bool?,
      reactions: freezed == reactions
          ? _self.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as bool?,
      replies: freezed == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as bool?,
      sharedLocations: freezed == sharedLocations
          ? _self.sharedLocations
          : sharedLocations // ignore: cast_nullable_to_non_nullable
              as bool?,
      typingEvents: freezed == typingEvents
          ? _self.typingEvents
          : typingEvents // ignore: cast_nullable_to_non_nullable
              as bool?,
      uploads: freezed == uploads
          ? _self.uploads
          : uploads // ignore: cast_nullable_to_non_nullable
              as bool?,
      urlEnrichment: freezed == urlEnrichment
          ? _self.urlEnrichment
          : urlEnrichment // ignore: cast_nullable_to_non_nullable
              as bool?,
      userMessageReminders: freezed == userMessageReminders
          ? _self.userMessageReminders
          : userMessageReminders // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
