// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Channel {
  List<SharedLocation>? get activeLiveLocations;
  bool? get autoTranslationEnabled;
  String get autoTranslationLanguage;
  String get cid;
  ChannelConfig? get config;
  ConfigOverrides? get configOverrides;
  int? get cooldown;
  DateTime get createdAt;
  User? get createdBy;
  Map<String, Object?> get custom;
  DateTime? get deletedAt;
  bool get disabled;
  bool get frozen;
  String get id;
  List<ChannelMember>? get invites;
  String? get lastCampaigns;
  DateTime? get lastMessageAt;
  int? get memberCount;
  List<ChannelMember>? get members;
  Map<String, ChannelMemberLookup>? get membersLookup;
  int? get messageCount;
  DateTime? get messageCountUpdatedAt;
  String? get team;
  User? get truncatedBy;
  String get type;
  DateTime get updatedAt;

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<Channel> get copyWith =>
      _$ChannelCopyWithImpl<Channel>(this as Channel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Channel &&
            const DeepCollectionEquality()
                .equals(other.activeLiveLocations, activeLiveLocations) &&
            (identical(other.autoTranslationEnabled, autoTranslationEnabled) ||
                other.autoTranslationEnabled == autoTranslationEnabled) &&
            (identical(
                    other.autoTranslationLanguage, autoTranslationLanguage) ||
                other.autoTranslationLanguage == autoTranslationLanguage) &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.configOverrides, configOverrides) ||
                other.configOverrides == configOverrides) &&
            (identical(other.cooldown, cooldown) ||
                other.cooldown == cooldown) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.frozen, frozen) || other.frozen == frozen) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.invites, invites) &&
            (identical(other.lastCampaigns, lastCampaigns) ||
                other.lastCampaigns == lastCampaigns) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality()
                .equals(other.membersLookup, membersLookup) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount) &&
            (identical(other.messageCountUpdatedAt, messageCountUpdatedAt) ||
                other.messageCountUpdatedAt == messageCountUpdatedAt) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.truncatedBy, truncatedBy) ||
                other.truncatedBy == truncatedBy) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(activeLiveLocations),
        autoTranslationEnabled,
        autoTranslationLanguage,
        cid,
        config,
        configOverrides,
        cooldown,
        createdAt,
        createdBy,
        const DeepCollectionEquality().hash(custom),
        deletedAt,
        disabled,
        frozen,
        id,
        const DeepCollectionEquality().hash(invites),
        lastCampaigns,
        lastMessageAt,
        memberCount,
        const DeepCollectionEquality().hash(members),
        const DeepCollectionEquality().hash(membersLookup),
        messageCount,
        messageCountUpdatedAt,
        team,
        truncatedBy,
        type,
        updatedAt
      ]);

  @override
  String toString() {
    return 'Channel(activeLiveLocations: $activeLiveLocations, autoTranslationEnabled: $autoTranslationEnabled, autoTranslationLanguage: $autoTranslationLanguage, cid: $cid, config: $config, configOverrides: $configOverrides, cooldown: $cooldown, createdAt: $createdAt, createdBy: $createdBy, custom: $custom, deletedAt: $deletedAt, disabled: $disabled, frozen: $frozen, id: $id, invites: $invites, lastCampaigns: $lastCampaigns, lastMessageAt: $lastMessageAt, memberCount: $memberCount, members: $members, membersLookup: $membersLookup, messageCount: $messageCount, messageCountUpdatedAt: $messageCountUpdatedAt, team: $team, truncatedBy: $truncatedBy, type: $type, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) _then) =
      _$ChannelCopyWithImpl;
  @useResult
  $Res call(
      {List<SharedLocation>? activeLiveLocations,
      bool? autoTranslationEnabled,
      String autoTranslationLanguage,
      String cid,
      ChannelConfig? config,
      ConfigOverrides? configOverrides,
      int? cooldown,
      DateTime createdAt,
      User? createdBy,
      Map<String, Object?> custom,
      DateTime? deletedAt,
      bool disabled,
      bool frozen,
      String id,
      List<ChannelMember>? invites,
      String? lastCampaigns,
      DateTime? lastMessageAt,
      int? memberCount,
      List<ChannelMember>? members,
      Map<String, ChannelMemberLookup>? membersLookup,
      int? messageCount,
      DateTime? messageCountUpdatedAt,
      String? team,
      User? truncatedBy,
      String type,
      DateTime updatedAt});
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res> implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._self, this._then);

  final Channel _self;
  final $Res Function(Channel) _then;

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeLiveLocations = freezed,
    Object? autoTranslationEnabled = freezed,
    Object? autoTranslationLanguage = null,
    Object? cid = null,
    Object? config = freezed,
    Object? configOverrides = freezed,
    Object? cooldown = freezed,
    Object? createdAt = null,
    Object? createdBy = freezed,
    Object? custom = null,
    Object? deletedAt = freezed,
    Object? disabled = null,
    Object? frozen = null,
    Object? id = null,
    Object? invites = freezed,
    Object? lastCampaigns = freezed,
    Object? lastMessageAt = freezed,
    Object? memberCount = freezed,
    Object? members = freezed,
    Object? membersLookup = freezed,
    Object? messageCount = freezed,
    Object? messageCountUpdatedAt = freezed,
    Object? team = freezed,
    Object? truncatedBy = freezed,
    Object? type = null,
    Object? updatedAt = null,
  }) {
    return _then(Channel(
      activeLiveLocations: freezed == activeLiveLocations
          ? _self.activeLiveLocations
          : activeLiveLocations // ignore: cast_nullable_to_non_nullable
              as List<SharedLocation>?,
      autoTranslationEnabled: freezed == autoTranslationEnabled
          ? _self.autoTranslationEnabled
          : autoTranslationEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      autoTranslationLanguage: null == autoTranslationLanguage
          ? _self.autoTranslationLanguage
          : autoTranslationLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      cid: null == cid
          ? _self.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      config: freezed == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as ChannelConfig?,
      configOverrides: freezed == configOverrides
          ? _self.configOverrides
          : configOverrides // ignore: cast_nullable_to_non_nullable
              as ConfigOverrides?,
      cooldown: freezed == cooldown
          ? _self.cooldown
          : cooldown // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      disabled: null == disabled
          ? _self.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      frozen: null == frozen
          ? _self.frozen
          : frozen // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      invites: freezed == invites
          ? _self.invites
          : invites // ignore: cast_nullable_to_non_nullable
              as List<ChannelMember>?,
      lastCampaigns: freezed == lastCampaigns
          ? _self.lastCampaigns
          : lastCampaigns // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _self.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      memberCount: freezed == memberCount
          ? _self.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      members: freezed == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<ChannelMember>?,
      membersLookup: freezed == membersLookup
          ? _self.membersLookup
          : membersLookup // ignore: cast_nullable_to_non_nullable
              as Map<String, ChannelMemberLookup>?,
      messageCount: freezed == messageCount
          ? _self.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      messageCountUpdatedAt: freezed == messageCountUpdatedAt
          ? _self.messageCountUpdatedAt
          : messageCountUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      team: freezed == team
          ? _self.team
          : team // ignore: cast_nullable_to_non_nullable
              as String?,
      truncatedBy: freezed == truncatedBy
          ? _self.truncatedBy
          : truncatedBy // ignore: cast_nullable_to_non_nullable
              as User?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
