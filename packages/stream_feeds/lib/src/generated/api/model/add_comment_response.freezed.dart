// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddCommentResponse {

 CommentResponse get comment; String get duration; int? get mentionNotificationsCreated; bool? get notificationCreated;
/// Create a copy of AddCommentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddCommentResponseCopyWith<AddCommentResponse> get copyWith => _$AddCommentResponseCopyWithImpl<AddCommentResponse>(this as AddCommentResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddCommentResponse&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.mentionNotificationsCreated, mentionNotificationsCreated) || other.mentionNotificationsCreated == mentionNotificationsCreated)&&(identical(other.notificationCreated, notificationCreated) || other.notificationCreated == notificationCreated));
}


@override
int get hashCode => Object.hash(runtimeType,comment,duration,mentionNotificationsCreated,notificationCreated);

@override
String toString() {
  return 'AddCommentResponse(comment: $comment, duration: $duration, mentionNotificationsCreated: $mentionNotificationsCreated, notificationCreated: $notificationCreated)';
}


}

/// @nodoc
abstract mixin class $AddCommentResponseCopyWith<$Res>  {
  factory $AddCommentResponseCopyWith(AddCommentResponse value, $Res Function(AddCommentResponse) _then) = _$AddCommentResponseCopyWithImpl;
@useResult
$Res call({
 CommentResponse comment, String duration, int? mentionNotificationsCreated, bool? notificationCreated
});




}
/// @nodoc
class _$AddCommentResponseCopyWithImpl<$Res>
    implements $AddCommentResponseCopyWith<$Res> {
  _$AddCommentResponseCopyWithImpl(this._self, this._then);

  final AddCommentResponse _self;
  final $Res Function(AddCommentResponse) _then;

/// Create a copy of AddCommentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comment = null,Object? duration = null,Object? mentionNotificationsCreated = freezed,Object? notificationCreated = freezed,}) {
  return _then(AddCommentResponse(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as CommentResponse,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,mentionNotificationsCreated: freezed == mentionNotificationsCreated ? _self.mentionNotificationsCreated : mentionNotificationsCreated // ignore: cast_nullable_to_non_nullable
as int?,notificationCreated: freezed == notificationCreated ? _self.notificationCreated : notificationCreated // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}



// dart format on
