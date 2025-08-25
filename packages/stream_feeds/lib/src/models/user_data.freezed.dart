// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserData {
  bool get banned;
  List<String> get blockedUserIds;
  DateTime get createdAt;
  DateTime? get deactivatedAt;
  DateTime? get deletedAt;
  String get id;
  String? get image;
  String? get language;
  DateTime? get lastActive;
  String? get name;
  bool get online;
  DateTime? get revokeTokensIssuedBefore;
  String get role;
  List<String> get teams;
  DateTime get updatedAt;
  Map<String, Object?> get custom;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<UserData> get copyWith =>
      _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserData &&
            (identical(other.banned, banned) || other.banned == banned) &&
            const DeepCollectionEquality()
                .equals(other.blockedUserIds, blockedUserIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deactivatedAt, deactivatedAt) ||
                other.deactivatedAt == deactivatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.lastActive, lastActive) ||
                other.lastActive == lastActive) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(
                    other.revokeTokensIssuedBefore, revokeTokensIssuedBefore) ||
                other.revokeTokensIssuedBefore == revokeTokensIssuedBefore) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other.teams, teams) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      banned,
      const DeepCollectionEquality().hash(blockedUserIds),
      createdAt,
      deactivatedAt,
      deletedAt,
      id,
      image,
      language,
      lastActive,
      name,
      online,
      revokeTokensIssuedBefore,
      role,
      const DeepCollectionEquality().hash(teams),
      updatedAt,
      const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'UserData(banned: $banned, blockedUserIds: $blockedUserIds, createdAt: $createdAt, deactivatedAt: $deactivatedAt, deletedAt: $deletedAt, id: $id, image: $image, language: $language, lastActive: $lastActive, name: $name, online: $online, revokeTokensIssuedBefore: $revokeTokensIssuedBefore, role: $role, teams: $teams, updatedAt: $updatedAt, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) =
      _$UserDataCopyWithImpl;
  @useResult
  $Res call(
      {bool banned,
      List<String> blockedUserIds,
      DateTime createdAt,
      DateTime? deactivatedAt,
      DateTime? deletedAt,
      String id,
      String? image,
      String? language,
      DateTime? lastActive,
      String? name,
      bool online,
      DateTime? revokeTokensIssuedBefore,
      String role,
      List<String> teams,
      DateTime updatedAt,
      Map<String, Object?> custom});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banned = null,
    Object? blockedUserIds = null,
    Object? createdAt = null,
    Object? deactivatedAt = freezed,
    Object? deletedAt = freezed,
    Object? id = null,
    Object? image = freezed,
    Object? language = freezed,
    Object? lastActive = freezed,
    Object? name = freezed,
    Object? online = null,
    Object? revokeTokensIssuedBefore = freezed,
    Object? role = null,
    Object? teams = null,
    Object? updatedAt = null,
    Object? custom = null,
  }) {
    return _then(UserData(
      banned: null == banned
          ? _self.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUserIds: null == blockedUserIds
          ? _self.blockedUserIds
          : blockedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deactivatedAt: freezed == deactivatedAt
          ? _self.deactivatedAt
          : deactivatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      lastActive: freezed == lastActive
          ? _self.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      online: null == online
          ? _self.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
      revokeTokensIssuedBefore: freezed == revokeTokensIssuedBefore
          ? _self.revokeTokensIssuedBefore
          : revokeTokensIssuedBefore // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      teams: null == teams
          ? _self.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ));
  }
}

// dart format on
