// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedRequest {
  String? get createdById;
  Map<String, Object>? get custom;
  String? get description;
  String get feedGroupId;
  String get feedId;
  List<String>? get filterTags;
  List<FeedMemberRequest>? get members;
  String? get name;
  FeedRequestVisibility? get visibility;

  /// Create a copy of FeedRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedRequestCopyWith<FeedRequest> get copyWith =>
      _$FeedRequestCopyWithImpl<FeedRequest>(this as FeedRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedRequest &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.feedGroupId, feedGroupId) ||
                other.feedGroupId == feedGroupId) &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdById,
      const DeepCollectionEquality().hash(custom),
      description,
      feedGroupId,
      feedId,
      const DeepCollectionEquality().hash(filterTags),
      const DeepCollectionEquality().hash(members),
      name,
      visibility);

  @override
  String toString() {
    return 'FeedRequest(createdById: $createdById, custom: $custom, description: $description, feedGroupId: $feedGroupId, feedId: $feedId, filterTags: $filterTags, members: $members, name: $name, visibility: $visibility)';
  }
}

/// @nodoc
abstract mixin class $FeedRequestCopyWith<$Res> {
  factory $FeedRequestCopyWith(
          FeedRequest value, $Res Function(FeedRequest) _then) =
      _$FeedRequestCopyWithImpl;
  @useResult
  $Res call(
      {String? createdById,
      Map<String, Object>? custom,
      String? description,
      String feedGroupId,
      String feedId,
      List<String>? filterTags,
      List<FeedMemberRequest>? members,
      String? name,
      FeedRequestVisibility? visibility});
}

/// @nodoc
class _$FeedRequestCopyWithImpl<$Res> implements $FeedRequestCopyWith<$Res> {
  _$FeedRequestCopyWithImpl(this._self, this._then);

  final FeedRequest _self;
  final $Res Function(FeedRequest) _then;

  /// Create a copy of FeedRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdById = freezed,
    Object? custom = freezed,
    Object? description = freezed,
    Object? feedGroupId = null,
    Object? feedId = null,
    Object? filterTags = freezed,
    Object? members = freezed,
    Object? name = freezed,
    Object? visibility = freezed,
  }) {
    return _then(FeedRequest(
      createdById: freezed == createdById
          ? _self.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      feedGroupId: null == feedGroupId
          ? _self.feedGroupId
          : feedGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      feedId: null == feedId
          ? _self.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as String,
      filterTags: freezed == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      members: freezed == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<FeedMemberRequest>?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: freezed == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as FeedRequestVisibility?,
    ));
  }
}

// dart format on
