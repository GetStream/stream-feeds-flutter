// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_folder_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFolderRequest _$AddFolderRequestFromJson(Map<String, dynamic> json) =>
    AddFolderRequest(
      custom: json['custom'] as Map<String, dynamic>?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AddFolderRequestToJson(AddFolderRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'name': instance.name,
    };
