// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feeds_reaction_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedsReactionData {
  String get activityId;
  DateTime get createdAt;
  String get type;
  DateTime get updatedAt;
  UserData get user;
  Map<String, Object>? get custom;

  /// Create a copy of FeedsReactionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedsReactionDataCopyWith<FeedsReactionData> get copyWith =>
      _$FeedsReactionDataCopyWithImpl<FeedsReactionData>(
          this as FeedsReactionData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedsReactionData &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activityId, createdAt, type,
      updatedAt, user, const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'FeedsReactionData(activityId: $activityId, createdAt: $createdAt, type: $type, updatedAt: $updatedAt, user: $user, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $FeedsReactionDataCopyWith<$Res> {
  factory $FeedsReactionDataCopyWith(
          FeedsReactionData value, $Res Function(FeedsReactionData) _then) =
      _$FeedsReactionDataCopyWithImpl;
  @useResult
  $Res call(
      {String activityId,
      DateTime createdAt,
      String type,
      DateTime updatedAt,
      UserData user,
      Map<String, Object>? custom});
}

/// @nodoc
class _$FeedsReactionDataCopyWithImpl<$Res>
    implements $FeedsReactionDataCopyWith<$Res> {
  _$FeedsReactionDataCopyWithImpl(this._self, this._then);

  final FeedsReactionData _self;
  final $Res Function(FeedsReactionData) _then;

  /// Create a copy of FeedsReactionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? createdAt = null,
    Object? type = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? custom = freezed,
  }) {
    return _then(FeedsReactionData(
      activityId: null == activityId
          ? _self.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
