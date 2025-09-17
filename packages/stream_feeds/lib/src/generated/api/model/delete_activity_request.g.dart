// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteActivityRequest _$DeleteActivityRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteActivityRequest(
      hardDelete: json['hard_delete'] as bool?,
    );

Map<String, dynamic> _$DeleteActivityRequestToJson(
        DeleteActivityRequest instance) =>
    <String, dynamic>{
      'hard_delete': instance.hardDelete,
    };
