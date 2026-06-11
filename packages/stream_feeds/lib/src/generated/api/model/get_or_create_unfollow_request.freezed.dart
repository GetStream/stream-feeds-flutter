// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_or_create_unfollow_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetOrCreateUnfollowRequest {

 bool? get deleteNotificationActivity; bool? get enrichOwnFields; bool? get keepHistory; String get source; String get target;
/// Create a copy of GetOrCreateUnfollowRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetOrCreateUnfollowRequestCopyWith<GetOrCreateUnfollowRequest> get copyWith => _$GetOrCreateUnfollowRequestCopyWithImpl<GetOrCreateUnfollowRequest>(this as GetOrCreateUnfollowRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetOrCreateUnfollowRequest&&(identical(other.deleteNotificationActivity, deleteNotificationActivity) || other.deleteNotificationActivity == deleteNotificationActivity)&&(identical(other.enrichOwnFields, enrichOwnFields) || other.enrichOwnFields == enrichOwnFields)&&(identical(other.keepHistory, keepHistory) || other.keepHistory == keepHistory)&&(identical(other.source, source) || other.source == source)&&(identical(other.target, target) || other.target == target));
}


@override
int get hashCode => Object.hash(runtimeType,deleteNotificationActivity,enrichOwnFields,keepHistory,source,target);

@override
String toString() {
  return 'GetOrCreateUnfollowRequest(deleteNotificationActivity: $deleteNotificationActivity, enrichOwnFields: $enrichOwnFields, keepHistory: $keepHistory, source: $source, target: $target)';
}


}

/// @nodoc
abstract mixin class $GetOrCreateUnfollowRequestCopyWith<$Res>  {
  factory $GetOrCreateUnfollowRequestCopyWith(GetOrCreateUnfollowRequest value, $Res Function(GetOrCreateUnfollowRequest) _then) = _$GetOrCreateUnfollowRequestCopyWithImpl;
@useResult
$Res call({
 bool? deleteNotificationActivity, bool? enrichOwnFields, bool? keepHistory, String source, String target
});




}
/// @nodoc
class _$GetOrCreateUnfollowRequestCopyWithImpl<$Res>
    implements $GetOrCreateUnfollowRequestCopyWith<$Res> {
  _$GetOrCreateUnfollowRequestCopyWithImpl(this._self, this._then);

  final GetOrCreateUnfollowRequest _self;
  final $Res Function(GetOrCreateUnfollowRequest) _then;

/// Create a copy of GetOrCreateUnfollowRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deleteNotificationActivity = freezed,Object? enrichOwnFields = freezed,Object? keepHistory = freezed,Object? source = null,Object? target = null,}) {
  return _then(GetOrCreateUnfollowRequest(
deleteNotificationActivity: freezed == deleteNotificationActivity ? _self.deleteNotificationActivity : deleteNotificationActivity // ignore: cast_nullable_to_non_nullable
as bool?,enrichOwnFields: freezed == enrichOwnFields ? _self.enrichOwnFields : enrichOwnFields // ignore: cast_nullable_to_non_nullable
as bool?,keepHistory: freezed == keepHistory ? _self.keepHistory : keepHistory // ignore: cast_nullable_to_non_nullable
as bool?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



// dart format on
