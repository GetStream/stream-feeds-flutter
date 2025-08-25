// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSize _$ImageSizeFromJson(Map<String, dynamic> json) => ImageSize(
      crop: $enumDecodeNullable(_$ImageSizeCropEnumMap, json['crop'],
          unknownValue: ImageSizeCrop.unknown),
      height: (json['height'] as num?)?.toInt(),
      resize: $enumDecodeNullable(_$ImageSizeResizeEnumMap, json['resize'],
          unknownValue: ImageSizeResize.unknown),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImageSizeToJson(ImageSize instance) => <String, dynamic>{
      'crop': _$ImageSizeCropEnumMap[instance.crop],
      'height': instance.height,
      'resize': _$ImageSizeResizeEnumMap[instance.resize],
      'width': instance.width,
    };

const _$ImageSizeCropEnumMap = {
  ImageSizeCrop.bottom: 'bottom',
  ImageSizeCrop.center: 'center',
  ImageSizeCrop.left: 'left',
  ImageSizeCrop.right: 'right',
  ImageSizeCrop.top: 'top',
  ImageSizeCrop.unknown: '_unknown',
};

const _$ImageSizeResizeEnumMap = {
  ImageSizeResize.clip: 'clip',
  ImageSizeResize.crop: 'crop',
  ImageSizeResize.fill: 'fill',
  ImageSizeResize.scale: 'scale',
  ImageSizeResize.unknown: '_unknown',
};
