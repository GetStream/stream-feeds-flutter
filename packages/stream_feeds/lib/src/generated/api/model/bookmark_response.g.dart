// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkResponse _$BookmarkResponseFromJson(Map<String, dynamic> json) => BookmarkResponse(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  activityId: json['activity_id'] as String?,
  comment: json['comment'] == null ? null : CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
  createdAt: const EpochDateTimeConverter().fromJson((json['created_at'] as num).toInt()),
  custom: json['custom'] as Map<String, dynamic>?,
  folder: json['folder'] == null ? null : BookmarkFolderResponse.fromJson(json['folder'] as Map<String, dynamic>),
  objectId: json['object_id'] as String,
  objectType: json['object_type'] as String,
  updatedAt: const EpochDateTimeConverter().fromJson((json['updated_at'] as num).toInt()),
  user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkResponseToJson(BookmarkResponse instance) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'activity_id': instance.activityId,
  'comment': instance.comment?.toJson(),
  'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'folder': instance.folder?.toJson(),
  'object_id': instance.objectId,
  'object_type': instance.objectType,
  'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
  'user': instance.user.toJson(),
};
