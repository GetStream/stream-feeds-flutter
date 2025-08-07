// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSize _$ImageSizeFromJson(Map<String, dynamic> json) => ImageSize(
      crop: $enumDecodeNullable(_$ImageSizeCropEnumEnumMap, json['crop']),
      height: (json['height'] as num?)?.toInt(),
      resize: $enumDecodeNullable(_$ImageSizeResizeEnumEnumMap, json['resize']),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImageSizeToJson(ImageSize instance) => <String, dynamic>{
      'crop': _$ImageSizeCropEnumEnumMap[instance.crop],
      'height': instance.height,
      'resize': _$ImageSizeResizeEnumEnumMap[instance.resize],
      'width': instance.width,
    };

const _$ImageSizeCropEnumEnumMap = {
  ImageSizeCropEnum.bottom: 'bottom',
  ImageSizeCropEnum.center: 'center',
  ImageSizeCropEnum.left: 'left',
  ImageSizeCropEnum.right: 'right',
  ImageSizeCropEnum.top: 'top',
  ImageSizeCropEnum.unknown: 'unknown',
};

const _$ImageSizeResizeEnumEnumMap = {
  ImageSizeResizeEnum.clip: 'clip',
  ImageSizeResizeEnum.crop: 'crop',
  ImageSizeResizeEnum.fill: 'fill',
  ImageSizeResizeEnum.scale: 'scale',
  ImageSizeResizeEnum.unknown: 'unknown',
};
