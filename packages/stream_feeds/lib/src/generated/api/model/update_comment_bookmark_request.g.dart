// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment_bookmark_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommentBookmarkRequest _$UpdateCommentBookmarkRequestFromJson(Map<String, dynamic> json) =>
    UpdateCommentBookmarkRequest(
      custom: json['custom'] as Map<String, dynamic>?,
      folderId: json['folder_id'] as String?,
      newFolder: json['new_folder'] == null
          ? null
          : AddFolderRequest.fromJson(json['new_folder'] as Map<String, dynamic>),
      newFolderId: json['new_folder_id'] as String?,
    );

Map<String, dynamic> _$UpdateCommentBookmarkRequestToJson(UpdateCommentBookmarkRequest instance) => <String, dynamic>{
  'custom': instance.custom,
  'folder_id': instance.folderId,
  'new_folder': instance.newFolder?.toJson(),
  'new_folder_id': instance.newFolderId,
};
