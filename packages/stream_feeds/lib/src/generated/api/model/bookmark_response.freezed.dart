// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookmarkResponse {

 ActivityResponse get activity; String? get activityId; CommentResponse? get comment; DateTime get createdAt; Map<String, Object?>? get custom; BookmarkFolderResponse? get folder; String get objectId; String get objectType; DateTime get updatedAt; UserResponse get user;
/// Create a copy of BookmarkResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkResponseCopyWith<BookmarkResponse> get copyWith => _$BookmarkResponseCopyWithImpl<BookmarkResponse>(this as BookmarkResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkResponse&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.custom, custom)&&(identical(other.folder, folder) || other.folder == folder)&&(identical(other.objectId, objectId) || other.objectId == objectId)&&(identical(other.objectType, objectType) || other.objectType == objectType)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,activity,activityId,comment,createdAt,const DeepCollectionEquality().hash(custom),folder,objectId,objectType,updatedAt,user);

@override
String toString() {
  return 'BookmarkResponse(activity: $activity, activityId: $activityId, comment: $comment, createdAt: $createdAt, custom: $custom, folder: $folder, objectId: $objectId, objectType: $objectType, updatedAt: $updatedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $BookmarkResponseCopyWith<$Res>  {
  factory $BookmarkResponseCopyWith(BookmarkResponse value, $Res Function(BookmarkResponse) _then) = _$BookmarkResponseCopyWithImpl;
@useResult
$Res call({
 ActivityResponse activity, String? activityId, CommentResponse? comment, DateTime createdAt, Map<String, Object?>? custom, BookmarkFolderResponse? folder, String objectId, String objectType, DateTime updatedAt, UserResponse user
});




}
/// @nodoc
class _$BookmarkResponseCopyWithImpl<$Res>
    implements $BookmarkResponseCopyWith<$Res> {
  _$BookmarkResponseCopyWithImpl(this._self, this._then);

  final BookmarkResponse _self;
  final $Res Function(BookmarkResponse) _then;

/// Create a copy of BookmarkResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activity = null,Object? activityId = freezed,Object? comment = freezed,Object? createdAt = null,Object? custom = freezed,Object? folder = freezed,Object? objectId = null,Object? objectType = null,Object? updatedAt = null,Object? user = null,}) {
  return _then(BookmarkResponse(
activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as ActivityResponse,activityId: freezed == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as CommentResponse?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,custom: freezed == custom ? _self.custom : custom // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,folder: freezed == folder ? _self.folder : folder // ignore: cast_nullable_to_non_nullable
as BookmarkFolderResponse?,objectId: null == objectId ? _self.objectId : objectId // ignore: cast_nullable_to_non_nullable
as String,objectType: null == objectType ? _self.objectType : objectType // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserResponse,
  ));
}

}



// dart format on
