// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_activity_partial_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateActivityPartialRequest {

 bool? get copyCustomToNotification; bool? get enrichOwnFields; bool? get handleMentionNotifications; bool? get runActivityProcessors; Map<String, Object?>? get set; List<String>? get unset;
/// Create a copy of UpdateActivityPartialRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateActivityPartialRequestCopyWith<UpdateActivityPartialRequest> get copyWith => _$UpdateActivityPartialRequestCopyWithImpl<UpdateActivityPartialRequest>(this as UpdateActivityPartialRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateActivityPartialRequest&&(identical(other.copyCustomToNotification, copyCustomToNotification) || other.copyCustomToNotification == copyCustomToNotification)&&(identical(other.enrichOwnFields, enrichOwnFields) || other.enrichOwnFields == enrichOwnFields)&&(identical(other.handleMentionNotifications, handleMentionNotifications) || other.handleMentionNotifications == handleMentionNotifications)&&(identical(other.runActivityProcessors, runActivityProcessors) || other.runActivityProcessors == runActivityProcessors)&&const DeepCollectionEquality().equals(other.set, set)&&const DeepCollectionEquality().equals(other.unset, unset));
}


@override
int get hashCode => Object.hash(runtimeType,copyCustomToNotification,enrichOwnFields,handleMentionNotifications,runActivityProcessors,const DeepCollectionEquality().hash(set),const DeepCollectionEquality().hash(unset));

@override
String toString() {
  return 'UpdateActivityPartialRequest(copyCustomToNotification: $copyCustomToNotification, enrichOwnFields: $enrichOwnFields, handleMentionNotifications: $handleMentionNotifications, runActivityProcessors: $runActivityProcessors, set: $set, unset: $unset)';
}


}

/// @nodoc
abstract mixin class $UpdateActivityPartialRequestCopyWith<$Res>  {
  factory $UpdateActivityPartialRequestCopyWith(UpdateActivityPartialRequest value, $Res Function(UpdateActivityPartialRequest) _then) = _$UpdateActivityPartialRequestCopyWithImpl;
@useResult
$Res call({
 bool? copyCustomToNotification, bool? enrichOwnFields, bool? handleMentionNotifications, bool? runActivityProcessors, Map<String, Object?>? set, List<String>? unset
});




}
/// @nodoc
class _$UpdateActivityPartialRequestCopyWithImpl<$Res>
    implements $UpdateActivityPartialRequestCopyWith<$Res> {
  _$UpdateActivityPartialRequestCopyWithImpl(this._self, this._then);

  final UpdateActivityPartialRequest _self;
  final $Res Function(UpdateActivityPartialRequest) _then;

/// Create a copy of UpdateActivityPartialRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? copyCustomToNotification = freezed,Object? enrichOwnFields = freezed,Object? handleMentionNotifications = freezed,Object? runActivityProcessors = freezed,Object? set = freezed,Object? unset = freezed,}) {
  return _then(UpdateActivityPartialRequest(
copyCustomToNotification: freezed == copyCustomToNotification ? _self.copyCustomToNotification : copyCustomToNotification // ignore: cast_nullable_to_non_nullable
as bool?,enrichOwnFields: freezed == enrichOwnFields ? _self.enrichOwnFields : enrichOwnFields // ignore: cast_nullable_to_non_nullable
as bool?,handleMentionNotifications: freezed == handleMentionNotifications ? _self.handleMentionNotifications : handleMentionNotifications // ignore: cast_nullable_to_non_nullable
as bool?,runActivityProcessors: freezed == runActivityProcessors ? _self.runActivityProcessors : runActivityProcessors // ignore: cast_nullable_to_non_nullable
as bool?,set: freezed == set ? _self.set : set // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,unset: freezed == unset ? _self.unset : unset // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}



// dart format on
