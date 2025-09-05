// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_add_activity_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedAddActivityRequest {
  List<Attachment>? get attachments;
  List<StreamAttachment>? get attachmentUploads;
  Map<String, Object>? get custom;
  String? get expiresAt;
  List<String> get feeds;
  List<String>? get filterTags;
  String? get id;
  List<String>? get interestTags;
  ActivityLocation? get location;
  List<String>? get mentionedUserIds;
  String? get parentId;
  String? get pollId;
  Map<String, Object>? get searchData;
  String? get text;
  String get type;
  AddActivityRequestVisibility? get visibility;
  String? get visibilityTag;

  /// Create a copy of FeedAddActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedAddActivityRequestCopyWith<FeedAddActivityRequest> get copyWith =>
      _$FeedAddActivityRequestCopyWithImpl<FeedAddActivityRequest>(
          this as FeedAddActivityRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedAddActivityRequest &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            const DeepCollectionEquality()
                .equals(other.attachmentUploads, attachmentUploads) &&
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
      const DeepCollectionEquality().hash(attachmentUploads),
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
    return 'FeedAddActivityRequest(attachments: $attachments, attachmentUploads: $attachmentUploads, custom: $custom, expiresAt: $expiresAt, feeds: $feeds, filterTags: $filterTags, id: $id, interestTags: $interestTags, location: $location, mentionedUserIds: $mentionedUserIds, parentId: $parentId, pollId: $pollId, searchData: $searchData, text: $text, type: $type, visibility: $visibility, visibilityTag: $visibilityTag)';
  }
}

/// @nodoc
abstract mixin class $FeedAddActivityRequestCopyWith<$Res> {
  factory $FeedAddActivityRequestCopyWith(FeedAddActivityRequest value,
          $Res Function(FeedAddActivityRequest) _then) =
      _$FeedAddActivityRequestCopyWithImpl;
  @useResult
  $Res call(
      {String type,
      List<String> feeds,
      List<Attachment>? attachments,
      List<StreamAttachment>? attachmentUploads,
      Map<String, Object>? custom,
      String? expiresAt,
      List<String>? filterTags,
      String? id,
      List<String>? interestTags,
      ActivityLocation? location,
      List<String>? mentionedUserIds,
      String? parentId,
      String? pollId,
      Map<String, Object>? searchData,
      String? text,
      AddActivityRequestVisibility? visibility,
      String? visibilityTag});
}

/// @nodoc
class _$FeedAddActivityRequestCopyWithImpl<$Res>
    implements $FeedAddActivityRequestCopyWith<$Res> {
  _$FeedAddActivityRequestCopyWithImpl(this._self, this._then);

  final FeedAddActivityRequest _self;
  final $Res Function(FeedAddActivityRequest) _then;

  /// Create a copy of FeedAddActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? feeds = null,
    Object? attachments = freezed,
    Object? attachmentUploads = freezed,
    Object? custom = freezed,
    Object? expiresAt = freezed,
    Object? filterTags = freezed,
    Object? id = freezed,
    Object? interestTags = freezed,
    Object? location = freezed,
    Object? mentionedUserIds = freezed,
    Object? parentId = freezed,
    Object? pollId = freezed,
    Object? searchData = freezed,
    Object? text = freezed,
    Object? visibility = freezed,
    Object? visibilityTag = freezed,
  }) {
    return _then(FeedAddActivityRequest(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      feeds: null == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachmentUploads: freezed == attachmentUploads
          ? _self.attachmentUploads
          : attachmentUploads // ignore: cast_nullable_to_non_nullable
              as List<StreamAttachment>?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as Map<String, Object>?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
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
