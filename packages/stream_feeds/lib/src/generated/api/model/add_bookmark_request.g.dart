// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bookmark_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBookmarkRequest _$AddBookmarkRequestFromJson(Map<String, dynamic> json) =>
    AddBookmarkRequest(
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      folderId: json['folder_id'] as String?,
      newFolder: json['new_folder'] == null
          ? null
          : AddFolderRequest.fromJson(
              json['new_folder'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddBookmarkRequestToJson(AddBookmarkRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'folder_id': instance.folderId,
      'new_folder': instance.newFolder?.toJson(),
    };
