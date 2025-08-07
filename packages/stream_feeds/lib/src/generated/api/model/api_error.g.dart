// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIError _$APIErrorFromJson(Map<String, dynamic> json) => APIError(
      code: (json['code'] as num).toInt(),
      details: (json['details'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      duration: json['duration'] as String,
      exceptionFields: (json['exception_fields'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      message: json['message'] as String,
      moreInfo: json['more_info'] as String,
      statusCode: (json['status_code'] as num).toInt(),
      unrecoverable: json['unrecoverable'] as bool?,
    );

Map<String, dynamic> _$APIErrorToJson(APIError instance) => <String, dynamic>{
      'code': instance.code,
      'details': instance.details,
      'duration': instance.duration,
      'exception_fields': instance.exceptionFields,
      'message': instance.message,
      'more_info': instance.moreInfo,
      'status_code': instance.statusCode,
      'unrecoverable': instance.unrecoverable,
    };
