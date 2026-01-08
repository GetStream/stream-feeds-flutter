// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_feed_updated_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationFeedUpdatedEvent {
  List<AggregatedActivityResponse>? get aggregatedActivities;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  String? get feedVisibility;
  String get fid;
  NotificationStatusResponse? get notificationStatus;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of NotificationFeedUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationFeedUpdatedEventCopyWith<NotificationFeedUpdatedEvent>
      get copyWith => _$NotificationFeedUpdatedEventCopyWithImpl<
              NotificationFeedUpdatedEvent>(
          this as NotificationFeedUpdatedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationFeedUpdatedEvent &&
            const DeepCollectionEquality()
                .equals(other.aggregatedActivities, aggregatedActivities) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) ||
                other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.notificationStatus, notificationStatus) ||
                other.notificationStatus == notificationStatus) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(aggregatedActivities),
      createdAt,
      const DeepCollectionEquality().hash(custom),
      feedVisibility,
      fid,
      notificationStatus,
      receivedAt,
      type,
      user);

  @override
  String toString() {
    return 'NotificationFeedUpdatedEvent(aggregatedActivities: $aggregatedActivities, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, notificationStatus: $notificationStatus, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $NotificationFeedUpdatedEventCopyWith<$Res> {
  factory $NotificationFeedUpdatedEventCopyWith(
          NotificationFeedUpdatedEvent value,
          $Res Function(NotificationFeedUpdatedEvent) _then) =
      _$NotificationFeedUpdatedEventCopyWithImpl;
  @useResult
  $Res call(
      {List<AggregatedActivityResponse>? aggregatedActivities,
      DateTime createdAt,
      Map<String, Object?> custom,
      String? feedVisibility,
      String fid,
      NotificationStatusResponse? notificationStatus,
      DateTime? receivedAt,
      String type,
      UserResponseCommonFields? user});
}

/// @nodoc
class _$NotificationFeedUpdatedEventCopyWithImpl<$Res>
    implements $NotificationFeedUpdatedEventCopyWith<$Res> {
  _$NotificationFeedUpdatedEventCopyWithImpl(this._self, this._then);

  final NotificationFeedUpdatedEvent _self;
  final $Res Function(NotificationFeedUpdatedEvent) _then;

  /// Create a copy of NotificationFeedUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aggregatedActivities = freezed,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? notificationStatus = freezed,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(NotificationFeedUpdatedEvent(
      aggregatedActivities: freezed == aggregatedActivities
          ? _self.aggregatedActivities
          : aggregatedActivities // ignore: cast_nullable_to_non_nullable
              as List<AggregatedActivityResponse>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      feedVisibility: freezed == feedVisibility
          ? _self.feedVisibility
          : feedVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as String,
      notificationStatus: freezed == notificationStatus
          ? _self.notificationStatus
          : notificationStatus // ignore: cast_nullable_to_non_nullable
              as NotificationStatusResponse?,
      receivedAt: freezed == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponseCommonFields?,
    ));
  }
}

// dart format on
