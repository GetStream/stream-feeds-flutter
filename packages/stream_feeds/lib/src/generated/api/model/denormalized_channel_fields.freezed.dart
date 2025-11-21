// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'denormalized_channel_fields.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DenormalizedChannelFields {
  String? get createdAt;
  String? get createdById;
  Map<String, Object?>? get custom;
  bool? get disabled;
  bool? get frozen;
  String? get id;
  String? get lastMessageAt;
  int? get memberCount;
  String? get team;
  String? get type;
  String? get updatedAt;

  /// Create a copy of DenormalizedChannelFields
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DenormalizedChannelFieldsCopyWith<DenormalizedChannelFields> get copyWith =>
      _$DenormalizedChannelFieldsCopyWithImpl<DenormalizedChannelFields>(
          this as DenormalizedChannelFields, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DenormalizedChannelFields &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.frozen, frozen) || other.frozen == frozen) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      createdById,
      const DeepCollectionEquality().hash(custom),
      disabled,
      frozen,
      id,
      lastMessageAt,
      memberCount,
      team,
      type,
      updatedAt);

  @override
  String toString() {
    return 'DenormalizedChannelFields(createdAt: $createdAt, createdById: $createdById, custom: $custom, disabled: $disabled, frozen: $frozen, id: $id, lastMessageAt: $lastMessageAt, memberCount: $memberCount, team: $team, type: $type, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $DenormalizedChannelFieldsCopyWith<$Res> {
  factory $DenormalizedChannelFieldsCopyWith(DenormalizedChannelFields value,
          $Res Function(DenormalizedChannelFields) _then) =
      _$DenormalizedChannelFieldsCopyWithImpl;
  @useResult
  $Res call(
      {String? createdAt,
      String? createdById,
      Map<String, Object?>? custom,
      bool? disabled,
      bool? frozen,
      String? id,
      String? lastMessageAt,
      int? memberCount,
      String? team,
      String? type,
      String? updatedAt});
}

/// @nodoc
class _$DenormalizedChannelFieldsCopyWithImpl<$Res>
    implements $DenormalizedChannelFieldsCopyWith<$Res> {
  _$DenormalizedChannelFieldsCopyWithImpl(this._self, this._then);

  final DenormalizedChannelFields _self;
  final $Res Function(DenormalizedChannelFields) _then;

  /// Create a copy of DenormalizedChannelFields
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? createdById = freezed,
    Object? custom = freezed,
    Object? disabled = freezed,
    Object? frozen = freezed,
    Object? id = freezed,
    Object? lastMessageAt = freezed,
    Object? memberCount = freezed,
    Object? team = freezed,
    Object? type = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(DenormalizedChannelFields(
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: freezed == createdById
          ? _self.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      disabled: freezed == disabled
          ? _self.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      frozen: freezed == frozen
          ? _self.frozen
          : frozen // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _self.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: freezed == memberCount
          ? _self.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      team: freezed == team
          ? _self.team
          : team // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
