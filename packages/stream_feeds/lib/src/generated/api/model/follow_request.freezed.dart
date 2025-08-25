// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowRequest {
  bool? get createNotificationActivity;
  Map<String, Object?>? get custom;
  FollowRequestPushPreference? get pushPreference;
  bool? get skipPush;
  String get source;
  String get target;

  /// Create a copy of FollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowRequestCopyWith<FollowRequest> get copyWith =>
      _$FollowRequestCopyWithImpl<FollowRequest>(
          this as FollowRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowRequest &&
            (identical(other.createNotificationActivity,
                    createNotificationActivity) ||
                other.createNotificationActivity ==
                    createNotificationActivity) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.pushPreference, pushPreference) ||
                other.pushPreference == pushPreference) &&
            (identical(other.skipPush, skipPush) ||
                other.skipPush == skipPush) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createNotificationActivity,
      const DeepCollectionEquality().hash(custom),
      pushPreference,
      skipPush,
      source,
      target);

  @override
  String toString() {
    return 'FollowRequest(createNotificationActivity: $createNotificationActivity, custom: $custom, pushPreference: $pushPreference, skipPush: $skipPush, source: $source, target: $target)';
  }
}

/// @nodoc
abstract mixin class $FollowRequestCopyWith<$Res> {
  factory $FollowRequestCopyWith(
          FollowRequest value, $Res Function(FollowRequest) _then) =
      _$FollowRequestCopyWithImpl;
  @useResult
  $Res call(
      {bool? createNotificationActivity,
      Map<String, Object?>? custom,
      FollowRequestPushPreference? pushPreference,
      bool? skipPush,
      String source,
      String target});
}

/// @nodoc
class _$FollowRequestCopyWithImpl<$Res>
    implements $FollowRequestCopyWith<$Res> {
  _$FollowRequestCopyWithImpl(this._self, this._then);

  final FollowRequest _self;
  final $Res Function(FollowRequest) _then;

  /// Create a copy of FollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createNotificationActivity = freezed,
    Object? custom = freezed,
    Object? pushPreference = freezed,
    Object? skipPush = freezed,
    Object? source = null,
    Object? target = null,
  }) {
    return _then(FollowRequest(
      createNotificationActivity: freezed == createNotificationActivity
          ? _self.createNotificationActivity
          : createNotificationActivity // ignore: cast_nullable_to_non_nullable
              as bool?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      pushPreference: freezed == pushPreference
          ? _self.pushPreference
          : pushPreference // ignore: cast_nullable_to_non_nullable
              as FollowRequestPushPreference?,
      skipPush: freezed == skipPush
          ? _self.skipPush
          : skipPush // ignore: cast_nullable_to_non_nullable
              as bool?,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
