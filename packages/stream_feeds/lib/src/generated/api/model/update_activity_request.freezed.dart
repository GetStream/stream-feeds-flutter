// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_activity_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateActivityRequest {
  List<Attachment>? get attachments;
  List<String>? get collectionRefs;
  bool? get copyCustomToNotification;
  Map<String, Object?>? get custom;
  bool? get enrichOwnFields;
  DateTime? get expiresAt;
  List<String>? get feeds;
  List<String>? get filterTags;
  bool? get handleMentionNotifications;
  List<String>? get interestTags;
  Location? get location;
  List<String>? get mentionedUserIds;
  String? get pollId;
  UpdateActivityRequestRestrictReplies? get restrictReplies;
  bool? get runActivityProcessors;
  Map<String, Object?>? get searchData;
  bool? get skipEnrichUrl;
  String? get text;
  UpdateActivityRequestVisibility? get visibility;
  String? get visibilityTag;

  /// Create a copy of UpdateActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateActivityRequestCopyWith<UpdateActivityRequest> get copyWith =>
      _$UpdateActivityRequestCopyWithImpl<UpdateActivityRequest>(
          this as UpdateActivityRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateActivityRequest &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            const DeepCollectionEquality()
                .equals(other.collectionRefs, collectionRefs) &&
            (identical(
                    other.copyCustomToNotification, copyCustomToNotification) ||
                other.copyCustomToNotification == copyCustomToNotification) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.enrichOwnFields, enrichOwnFields) ||
                other.enrichOwnFields == enrichOwnFields) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality().equals(other.feeds, feeds) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            (identical(other.handleMentionNotifications,
                    handleMentionNotifications) ||
                other.handleMentionNotifications ==
                    handleMentionNotifications) &&
            const DeepCollectionEquality()
                .equals(other.interestTags, interestTags) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other.mentionedUserIds, mentionedUserIds) &&
            (identical(other.pollId, pollId) || other.pollId == pollId) &&
            (identical(other.restrictReplies, restrictReplies) ||
                other.restrictReplies == restrictReplies) &&
            (identical(other.runActivityProcessors, runActivityProcessors) ||
                other.runActivityProcessors == runActivityProcessors) &&
            const DeepCollectionEquality()
                .equals(other.searchData, searchData) &&
            (identical(other.skipEnrichUrl, skipEnrichUrl) ||
                other.skipEnrichUrl == skipEnrichUrl) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.visibilityTag, visibilityTag) ||
                other.visibilityTag == visibilityTag));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(attachments),
        const DeepCollectionEquality().hash(collectionRefs),
        copyCustomToNotification,
        const DeepCollectionEquality().hash(custom),
        enrichOwnFields,
        expiresAt,
        const DeepCollectionEquality().hash(feeds),
        const DeepCollectionEquality().hash(filterTags),
        handleMentionNotifications,
        const DeepCollectionEquality().hash(interestTags),
        location,
        const DeepCollectionEquality().hash(mentionedUserIds),
        pollId,
        restrictReplies,
        runActivityProcessors,
        const DeepCollectionEquality().hash(searchData),
        skipEnrichUrl,
        text,
        visibility,
        visibilityTag
      ]);

  @override
  String toString() {
    return 'UpdateActivityRequest(attachments: $attachments, collectionRefs: $collectionRefs, copyCustomToNotification: $copyCustomToNotification, custom: $custom, enrichOwnFields: $enrichOwnFields, expiresAt: $expiresAt, feeds: $feeds, filterTags: $filterTags, handleMentionNotifications: $handleMentionNotifications, interestTags: $interestTags, location: $location, mentionedUserIds: $mentionedUserIds, pollId: $pollId, restrictReplies: $restrictReplies, runActivityProcessors: $runActivityProcessors, searchData: $searchData, skipEnrichUrl: $skipEnrichUrl, text: $text, visibility: $visibility, visibilityTag: $visibilityTag)';
  }
}

/// @nodoc
abstract mixin class $UpdateActivityRequestCopyWith<$Res> {
  factory $UpdateActivityRequestCopyWith(UpdateActivityRequest value,
          $Res Function(UpdateActivityRequest) _then) =
      _$UpdateActivityRequestCopyWithImpl;
  @useResult
  $Res call(
      {List<Attachment>? attachments,
      List<String>? collectionRefs,
      bool? copyCustomToNotification,
      Map<String, Object?>? custom,
      bool? enrichOwnFields,
      DateTime? expiresAt,
      List<String>? feeds,
      List<String>? filterTags,
      bool? handleMentionNotifications,
      List<String>? interestTags,
      Location? location,
      List<String>? mentionedUserIds,
      String? pollId,
      UpdateActivityRequestRestrictReplies? restrictReplies,
      bool? runActivityProcessors,
      Map<String, Object?>? searchData,
      bool? skipEnrichUrl,
      String? text,
      UpdateActivityRequestVisibility? visibility,
      String? visibilityTag});
}

/// @nodoc
class _$UpdateActivityRequestCopyWithImpl<$Res>
    implements $UpdateActivityRequestCopyWith<$Res> {
  _$UpdateActivityRequestCopyWithImpl(this._self, this._then);

  final UpdateActivityRequest _self;
  final $Res Function(UpdateActivityRequest) _then;

  /// Create a copy of UpdateActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = freezed,
    Object? collectionRefs = freezed,
    Object? copyCustomToNotification = freezed,
    Object? custom = freezed,
    Object? enrichOwnFields = freezed,
    Object? expiresAt = freezed,
    Object? feeds = freezed,
    Object? filterTags = freezed,
    Object? handleMentionNotifications = freezed,
    Object? interestTags = freezed,
    Object? location = freezed,
    Object? mentionedUserIds = freezed,
    Object? pollId = freezed,
    Object? restrictReplies = freezed,
    Object? runActivityProcessors = freezed,
    Object? searchData = freezed,
    Object? skipEnrichUrl = freezed,
    Object? text = freezed,
    Object? visibility = freezed,
    Object? visibilityTag = freezed,
  }) {
    return _then(UpdateActivityRequest(
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      collectionRefs: freezed == collectionRefs
          ? _self.collectionRefs
          : collectionRefs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      copyCustomToNotification: freezed == copyCustomToNotification
          ? _self.copyCustomToNotification
          : copyCustomToNotification // ignore: cast_nullable_to_non_nullable
              as bool?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      enrichOwnFields: freezed == enrichOwnFields
          ? _self.enrichOwnFields
          : enrichOwnFields // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feeds: freezed == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      filterTags: freezed == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      handleMentionNotifications: freezed == handleMentionNotifications
          ? _self.handleMentionNotifications
          : handleMentionNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
      interestTags: freezed == interestTags
          ? _self.interestTags
          : interestTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      mentionedUserIds: freezed == mentionedUserIds
          ? _self.mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pollId: freezed == pollId
          ? _self.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String?,
      restrictReplies: freezed == restrictReplies
          ? _self.restrictReplies
          : restrictReplies // ignore: cast_nullable_to_non_nullable
              as UpdateActivityRequestRestrictReplies?,
      runActivityProcessors: freezed == runActivityProcessors
          ? _self.runActivityProcessors
          : runActivityProcessors // ignore: cast_nullable_to_non_nullable
              as bool?,
      searchData: freezed == searchData
          ? _self.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      skipEnrichUrl: freezed == skipEnrichUrl
          ? _self.skipEnrichUrl
          : skipEnrichUrl // ignore: cast_nullable_to_non_nullable
              as bool?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: freezed == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as UpdateActivityRequestVisibility?,
      visibilityTag: freezed == visibilityTag
          ? _self.visibilityTag
          : visibilityTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
