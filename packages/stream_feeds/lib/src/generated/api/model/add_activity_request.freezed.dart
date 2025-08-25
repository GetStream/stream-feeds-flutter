// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_activity_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddActivityRequest {
  List<Attachment>? get attachments;
  Map<String, Object?>? get custom;
  String? get expiresAt;
  List<String> get feeds;
  List<String>? get filterTags;
  String? get id;
  List<String>? get interestTags;
  ActivityLocation? get location;
  List<String>? get mentionedUserIds;
  String? get parentId;
  String? get pollId;
  Map<String, Object?>? get searchData;
  String? get text;
  String get type;
  AddActivityRequestVisibility? get visibility;
  String? get visibilityTag;

  /// Create a copy of AddActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddActivityRequestCopyWith<AddActivityRequest> get copyWith =>
      _$AddActivityRequestCopyWithImpl<AddActivityRequest>(
          this as AddActivityRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddActivityRequest &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality().equals(other.feeds, feeds) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.interestTags, interestTags) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other.mentionedUserIds, mentionedUserIds) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.pollId, pollId) || other.pollId == pollId) &&
            const DeepCollectionEquality()
                .equals(other.searchData, searchData) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.visibilityTag, visibilityTag) ||
                other.visibilityTag == visibilityTag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(attachments),
      const DeepCollectionEquality().hash(custom),
      expiresAt,
      const DeepCollectionEquality().hash(feeds),
      const DeepCollectionEquality().hash(filterTags),
      id,
      const DeepCollectionEquality().hash(interestTags),
      location,
      const DeepCollectionEquality().hash(mentionedUserIds),
      parentId,
      pollId,
      const DeepCollectionEquality().hash(searchData),
      text,
      type,
      visibility,
      visibilityTag);

  @override
  String toString() {
    return 'AddActivityRequest(attachments: $attachments, custom: $custom, expiresAt: $expiresAt, feeds: $feeds, filterTags: $filterTags, id: $id, interestTags: $interestTags, location: $location, mentionedUserIds: $mentionedUserIds, parentId: $parentId, pollId: $pollId, searchData: $searchData, text: $text, type: $type, visibility: $visibility, visibilityTag: $visibilityTag)';
  }
}

/// @nodoc
abstract mixin class $AddActivityRequestCopyWith<$Res> {
  factory $AddActivityRequestCopyWith(
          AddActivityRequest value, $Res Function(AddActivityRequest) _then) =
      _$AddActivityRequestCopyWithImpl;
  @useResult
  $Res call(
      {List<Attachment>? attachments,
      Map<String, Object?>? custom,
      String? expiresAt,
      List<String> feeds,
      List<String>? filterTags,
      String? id,
      List<String>? interestTags,
      ActivityLocation? location,
      List<String>? mentionedUserIds,
      String? parentId,
      String? pollId,
      Map<String, Object?>? searchData,
      String? text,
      String type,
      AddActivityRequestVisibility? visibility,
      String? visibilityTag});
}

/// @nodoc
class _$AddActivityRequestCopyWithImpl<$Res>
    implements $AddActivityRequestCopyWith<$Res> {
  _$AddActivityRequestCopyWithImpl(this._self, this._then);

  final AddActivityRequest _self;
  final $Res Function(AddActivityRequest) _then;

  /// Create a copy of AddActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = freezed,
    Object? custom = freezed,
    Object? expiresAt = freezed,
    Object? feeds = null,
    Object? filterTags = freezed,
    Object? id = freezed,
    Object? interestTags = freezed,
    Object? location = freezed,
    Object? mentionedUserIds = freezed,
    Object? parentId = freezed,
    Object? pollId = freezed,
    Object? searchData = freezed,
    Object? text = freezed,
    Object? type = null,
    Object? visibility = freezed,
    Object? visibilityTag = freezed,
  }) {
    return _then(AddActivityRequest(
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      feeds: null == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filterTags: freezed == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      interestTags: freezed == interestTags
          ? _self.interestTags
          : interestTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as ActivityLocation?,
      mentionedUserIds: freezed == mentionedUserIds
          ? _self.mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      pollId: freezed == pollId
          ? _self.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String?,
      searchData: freezed == searchData
          ? _self.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: freezed == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as AddActivityRequestVisibility?,
      visibilityTag: freezed == visibilityTag
          ? _self.visibilityTag
          : visibilityTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
