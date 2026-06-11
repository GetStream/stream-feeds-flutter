// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_follow_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateFollowRequest {

 int? get activityCopyLimit; bool? get copyCustomToNotification; bool? get createNotificationActivity; Map<String, Object?>? get custom; bool? get enrichOwnFields; String? get followerRole; UpdateFollowRequestPushPreference? get pushPreference; bool? get skipPush; String get source; String get target;
/// Create a copy of UpdateFollowRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateFollowRequestCopyWith<UpdateFollowRequest> get copyWith => _$UpdateFollowRequestCopyWithImpl<UpdateFollowRequest>(this as UpdateFollowRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateFollowRequest&&(identical(other.activityCopyLimit, activityCopyLimit) || other.activityCopyLimit == activityCopyLimit)&&(identical(other.copyCustomToNotification, copyCustomToNotification) || other.copyCustomToNotification == copyCustomToNotification)&&(identical(other.createNotificationActivity, createNotificationActivity) || other.createNotificationActivity == createNotificationActivity)&&const DeepCollectionEquality().equals(other.custom, custom)&&(identical(other.enrichOwnFields, enrichOwnFields) || other.enrichOwnFields == enrichOwnFields)&&(identical(other.followerRole, followerRole) || other.followerRole == followerRole)&&(identical(other.pushPreference, pushPreference) || other.pushPreference == pushPreference)&&(identical(other.skipPush, skipPush) || other.skipPush == skipPush)&&(identical(other.source, source) || other.source == source)&&(identical(other.target, target) || other.target == target));
}


@override
int get hashCode => Object.hash(runtimeType,activityCopyLimit,copyCustomToNotification,createNotificationActivity,const DeepCollectionEquality().hash(custom),enrichOwnFields,followerRole,pushPreference,skipPush,source,target);

@override
String toString() {
  return 'UpdateFollowRequest(activityCopyLimit: $activityCopyLimit, copyCustomToNotification: $copyCustomToNotification, createNotificationActivity: $createNotificationActivity, custom: $custom, enrichOwnFields: $enrichOwnFields, followerRole: $followerRole, pushPreference: $pushPreference, skipPush: $skipPush, source: $source, target: $target)';
}


}

/// @nodoc
abstract mixin class $UpdateFollowRequestCopyWith<$Res>  {
  factory $UpdateFollowRequestCopyWith(UpdateFollowRequest value, $Res Function(UpdateFollowRequest) _then) = _$UpdateFollowRequestCopyWithImpl;
@useResult
$Res call({
 int? activityCopyLimit, bool? copyCustomToNotification, bool? createNotificationActivity, Map<String, Object?>? custom, bool? enrichOwnFields, String? followerRole, UpdateFollowRequestPushPreference? pushPreference, bool? skipPush, String source, String target
});




}
/// @nodoc
class _$UpdateFollowRequestCopyWithImpl<$Res>
    implements $UpdateFollowRequestCopyWith<$Res> {
  _$UpdateFollowRequestCopyWithImpl(this._self, this._then);

  final UpdateFollowRequest _self;
  final $Res Function(UpdateFollowRequest) _then;

/// Create a copy of UpdateFollowRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activityCopyLimit = freezed,Object? copyCustomToNotification = freezed,Object? createNotificationActivity = freezed,Object? custom = freezed,Object? enrichOwnFields = freezed,Object? followerRole = freezed,Object? pushPreference = freezed,Object? skipPush = freezed,Object? source = null,Object? target = null,}) {
  return _then(UpdateFollowRequest(
activityCopyLimit: freezed == activityCopyLimit ? _self.activityCopyLimit : activityCopyLimit // ignore: cast_nullable_to_non_nullable
as int?,copyCustomToNotification: freezed == copyCustomToNotification ? _self.copyCustomToNotification : copyCustomToNotification // ignore: cast_nullable_to_non_nullable
as bool?,createNotificationActivity: freezed == createNotificationActivity ? _self.createNotificationActivity : createNotificationActivity // ignore: cast_nullable_to_non_nullable
as bool?,custom: freezed == custom ? _self.custom : custom // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,enrichOwnFields: freezed == enrichOwnFields ? _self.enrichOwnFields : enrichOwnFields // ignore: cast_nullable_to_non_nullable
as bool?,followerRole: freezed == followerRole ? _self.followerRole : followerRole // ignore: cast_nullable_to_non_nullable
as String?,pushPreference: freezed == pushPreference ? _self.pushPreference : pushPreference // ignore: cast_nullable_to_non_nullable
as UpdateFollowRequestPushPreference?,skipPush: freezed == skipPush ? _self.skipPush : skipPush // ignore: cast_nullable_to_non_nullable
as bool?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



// dart format on
