// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_activity_partial_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateActivityPartialRequest _$UpdateActivityPartialRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateActivityPartialRequest(
      set: (json['set'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      unset:
          (json['unset'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UpdateActivityPartialRequestToJson(
        UpdateActivityPartialRequest instance) =>
    <String, dynamic>{
      'set': instance.set,
      'unset': instance.unset,
    };
