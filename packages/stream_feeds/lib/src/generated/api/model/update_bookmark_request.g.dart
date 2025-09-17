// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bookmark_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBookmarkRequest _$UpdateBookmarkRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateBookmarkRequest(
      custom: json['custom'] as Map<String, dynamic>?,
      folderId: json['folder_id'] as String?,
      newFolder: json['new_folder'] == null
          ? null
          : AddFolderRequest.fromJson(
              json['new_folder'] as Map<String, dynamic>),
      newFolderId: json['new_folder_id'] as String?,
    );

Map<String, dynamic> _$UpdateBookmarkRequestToJson(
        UpdateBookmarkRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'folder_id': instance.folderId,
      'new_folder': instance.newFolder?.toJson(),
      'new_folder_id': instance.newFolderId,
    };
