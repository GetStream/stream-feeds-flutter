// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_content_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageContentParameters _$ImageContentParametersFromJson(
        Map<String, dynamic> json) =>
    ImageContentParameters(
      harmLabels: (json['harm_labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ImageContentParametersToJson(
        ImageContentParameters instance) =>
    <String, dynamic>{
      'harm_labels': instance.harmLabels,
    };
