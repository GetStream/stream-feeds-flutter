// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_bookmark_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentBookmarkRequest _$AddCommentBookmarkRequestFromJson(Map<String, dynamic> json) => AddCommentBookmarkRequest(
  custom: json['custom'] as Map<String, dynamic>?,
  folderId: json['folder_id'] as String?,
  newFolder: json['new_folder'] == null ? null : AddFolderRequest.fromJson(json['new_folder'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddCommentBookmarkRequestToJson(AddCommentBookmarkRequest instance) => <String, dynamic>{
  'custom': instance.custom,
  'folder_id': instance.folderId,
  'new_folder': instance.newFolder?.toJson(),
};
