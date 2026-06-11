// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_parent_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationParentActivity {

 List<Attachment>? get attachments; String get id; String? get text; String? get type; String? get userId;
/// Create a copy of NotificationParentActivity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationParentActivityCopyWith<NotificationParentActivity> get copyWith => _$NotificationParentActivityCopyWithImpl<NotificationParentActivity>(this as NotificationParentActivity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationParentActivity&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(attachments),id,text,type,userId);

@override
String toString() {
  return 'NotificationParentActivity(attachments: $attachments, id: $id, text: $text, type: $type, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $NotificationParentActivityCopyWith<$Res>  {
  factory $NotificationParentActivityCopyWith(NotificationParentActivity value, $Res Function(NotificationParentActivity) _then) = _$NotificationParentActivityCopyWithImpl;
@useResult
$Res call({
 List<Attachment>? attachments, String id, String? text, String? type, String? userId
});




}
/// @nodoc
class _$NotificationParentActivityCopyWithImpl<$Res>
    implements $NotificationParentActivityCopyWith<$Res> {
  _$NotificationParentActivityCopyWithImpl(this._self, this._then);

  final NotificationParentActivity _self;
  final $Res Function(NotificationParentActivity) _then;

/// Create a copy of NotificationParentActivity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attachments = freezed,Object? id = null,Object? text = freezed,Object? type = freezed,Object? userId = freezed,}) {
  return _then(NotificationParentActivity(
attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<Attachment>?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}



// dart format on
