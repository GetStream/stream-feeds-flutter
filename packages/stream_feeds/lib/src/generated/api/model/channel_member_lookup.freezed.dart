// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_member_lookup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelMemberLookup {
  bool get archived;
  DateTime? get archivedAt;
  DateTime? get banExpires;
  bool get banned;
  bool get blocked;
  bool get hidden;
  bool get pinned;
  DateTime? get pinnedAt;

  /// Create a copy of ChannelMemberLookup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelMemberLookupCopyWith<ChannelMemberLookup> get copyWith =>
      _$ChannelMemberLookupCopyWithImpl<ChannelMemberLookup>(
          this as ChannelMemberLookup, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelMemberLookup &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.banExpires, banExpires) ||
                other.banExpires == banExpires) &&
            (identical(other.banned, banned) || other.banned == banned) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.pinnedAt, pinnedAt) ||
                other.pinnedAt == pinnedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, archived, archivedAt, banExpires,
      banned, blocked, hidden, pinned, pinnedAt);

  @override
  String toString() {
    return 'ChannelMemberLookup(archived: $archived, archivedAt: $archivedAt, banExpires: $banExpires, banned: $banned, blocked: $blocked, hidden: $hidden, pinned: $pinned, pinnedAt: $pinnedAt)';
  }
}

/// @nodoc
abstract mixin class $ChannelMemberLookupCopyWith<$Res> {
  factory $ChannelMemberLookupCopyWith(
          ChannelMemberLookup value, $Res Function(ChannelMemberLookup) _then) =
      _$ChannelMemberLookupCopyWithImpl;
  @useResult
  $Res call(
      {bool archived,
      DateTime? archivedAt,
      DateTime? banExpires,
      bool banned,
      bool blocked,
      bool hidden,
      bool pinned,
      DateTime? pinnedAt});
}

/// @nodoc
class _$ChannelMemberLookupCopyWithImpl<$Res>
    implements $ChannelMemberLookupCopyWith<$Res> {
  _$ChannelMemberLookupCopyWithImpl(this._self, this._then);

  final ChannelMemberLookup _self;
  final $Res Function(ChannelMemberLookup) _then;

  /// Create a copy of ChannelMemberLookup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? archived = null,
    Object? archivedAt = freezed,
    Object? banExpires = freezed,
    Object? banned = null,
    Object? blocked = null,
    Object? hidden = null,
    Object? pinned = null,
    Object? pinnedAt = freezed,
  }) {
    return _then(ChannelMemberLookup(
      archived: null == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      archivedAt: freezed == archivedAt
          ? _self.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      banExpires: freezed == banExpires
          ? _self.banExpires
          : banExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      banned: null == banned
          ? _self.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      blocked: null == blocked
          ? _self.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      hidden: null == hidden
          ? _self.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      pinned: null == pinned
          ? _self.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      pinnedAt: freezed == pinnedAt
          ? _self.pinnedAt
          : pinnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
