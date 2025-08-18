// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedGroup {
  int get appPK;
  DateTime get createdAt;
  Map<String, Object> get custom;
  String get defaultViewID;
  String get defaultVisibility;
  DateTime? get deletedAt;
  String get iD;
  DateTime? get lastFeedGetAt;
  NotificationConfig? get notification;
  StoriesConfig? get stories;
  DateTime get updatedAt;

  /// Create a copy of FeedGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedGroupCopyWith<FeedGroup> get copyWith =>
      _$FeedGroupCopyWithImpl<FeedGroup>(this as FeedGroup, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedGroup &&
            (identical(other.appPK, appPK) || other.appPK == appPK) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.defaultViewID, defaultViewID) ||
                other.defaultViewID == defaultViewID) &&
            (identical(other.defaultVisibility, defaultVisibility) ||
                other.defaultVisibility == defaultVisibility) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.iD, iD) || other.iD == iD) &&
            (identical(other.lastFeedGetAt, lastFeedGetAt) ||
                other.lastFeedGetAt == lastFeedGetAt) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.stories, stories) || other.stories == stories) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appPK,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      defaultViewID,
      defaultVisibility,
      deletedAt,
      iD,
      lastFeedGetAt,
      notification,
      stories,
      updatedAt);

  @override
  String toString() {
    return 'FeedGroup(appPK: $appPK, createdAt: $createdAt, custom: $custom, defaultViewID: $defaultViewID, defaultVisibility: $defaultVisibility, deletedAt: $deletedAt, iD: $iD, lastFeedGetAt: $lastFeedGetAt, notification: $notification, stories: $stories, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $FeedGroupCopyWith<$Res> {
  factory $FeedGroupCopyWith(FeedGroup value, $Res Function(FeedGroup) _then) =
      _$FeedGroupCopyWithImpl;
  @useResult
  $Res call(
      {int appPK,
      DateTime createdAt,
      Map<String, Object> custom,
      String defaultViewID,
      String defaultVisibility,
      DateTime? deletedAt,
      String iD,
      DateTime? lastFeedGetAt,
      NotificationConfig? notification,
      StoriesConfig? stories,
      DateTime updatedAt});
}

/// @nodoc
class _$FeedGroupCopyWithImpl<$Res> implements $FeedGroupCopyWith<$Res> {
  _$FeedGroupCopyWithImpl(this._self, this._then);

  final FeedGroup _self;
  final $Res Function(FeedGroup) _then;

  /// Create a copy of FeedGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPK = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? defaultViewID = null,
    Object? defaultVisibility = null,
    Object? deletedAt = freezed,
    Object? iD = null,
    Object? lastFeedGetAt = freezed,
    Object? notification = freezed,
    Object? stories = freezed,
    Object? updatedAt = null,
  }) {
    return _then(FeedGroup(
      appPK: null == appPK
          ? _self.appPK
          : appPK // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
      defaultViewID: null == defaultViewID
          ? _self.defaultViewID
          : defaultViewID // ignore: cast_nullable_to_non_nullable
              as String,
      defaultVisibility: null == defaultVisibility
          ? _self.defaultVisibility
          : defaultVisibility // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iD: null == iD
          ? _self.iD
          : iD // ignore: cast_nullable_to_non_nullable
              as String,
      lastFeedGetAt: freezed == lastFeedGetAt
          ? _self.lastFeedGetAt
          : lastFeedGetAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notification: freezed == notification
          ? _self.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationConfig?,
      stories: freezed == stories
          ? _self.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as StoriesConfig?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
