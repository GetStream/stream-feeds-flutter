// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedData {
  DateTime get createdAt;
  UserData get createdBy;
  DateTime? get deletedAt;
  String get description;
  FeedId get fid;
  List<String> get filterTags;
  int get followerCount;
  int get followingCount;
  String get groupId;
  String get id;
  int get memberCount;
  String get name;
  int get pinCount;
  DateTime get updatedAt;
  String? get visibility;
  Map<String, Object>? get custom;

  /// Create a copy of FeedData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedDataCopyWith<FeedData> get copyWith =>
      _$FeedDataCopyWithImpl<FeedData>(this as FeedData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedData &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pinCount, pinCount) ||
                other.pinCount == pinCount) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      createdBy,
      deletedAt,
      description,
      fid,
      const DeepCollectionEquality().hash(filterTags),
      followerCount,
      followingCount,
      groupId,
      id,
      memberCount,
      name,
      pinCount,
      updatedAt,
      visibility,
      const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'FeedData(createdAt: $createdAt, createdBy: $createdBy, deletedAt: $deletedAt, description: $description, fid: $fid, filterTags: $filterTags, followerCount: $followerCount, followingCount: $followingCount, groupId: $groupId, id: $id, memberCount: $memberCount, name: $name, pinCount: $pinCount, updatedAt: $updatedAt, visibility: $visibility, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $FeedDataCopyWith<$Res> {
  factory $FeedDataCopyWith(FeedData value, $Res Function(FeedData) _then) =
      _$FeedDataCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      UserData createdBy,
      DateTime? deletedAt,
      String description,
      FeedId fid,
      List<String> filterTags,
      int followerCount,
      int followingCount,
      String groupId,
      String id,
      int memberCount,
      String name,
      int pinCount,
      DateTime updatedAt,
      String? visibility,
      Map<String, Object>? custom});
}

/// @nodoc
class _$FeedDataCopyWithImpl<$Res> implements $FeedDataCopyWith<$Res> {
  _$FeedDataCopyWithImpl(this._self, this._then);

  final FeedData _self;
  final $Res Function(FeedData) _then;

  /// Create a copy of FeedData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdBy = null,
    Object? deletedAt = freezed,
    Object? description = null,
    Object? fid = null,
    Object? filterTags = null,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? groupId = null,
    Object? id = null,
    Object? memberCount = null,
    Object? name = null,
    Object? pinCount = null,
    Object? updatedAt = null,
    Object? visibility = freezed,
    Object? custom = freezed,
  }) {
    return _then(FeedData(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserData,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as FeedId,
      filterTags: null == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followerCount: null == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _self.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      memberCount: null == memberCount
          ? _self.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pinCount: null == pinCount
          ? _self.pinCount
          : pinCount // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visibility: freezed == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
