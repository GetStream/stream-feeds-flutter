// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bookmark_folder_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBookmarkFolderRequest _$UpdateBookmarkFolderRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateBookmarkFolderRequest(
      custom: json['custom'] as Map<String, dynamic>?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UpdateBookmarkFolderRequestToJson(
        UpdateBookmarkFolderRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'name': instance.name,
    };
