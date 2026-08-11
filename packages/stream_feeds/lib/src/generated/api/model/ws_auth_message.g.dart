// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_auth_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WSAuthMessage _$WSAuthMessageFromJson(Map<String, dynamic> json) => WSAuthMessage(
  memberCustomInclude: (json['member_custom_include'] as List<dynamic>?)?.map((e) => e as String).toList(),
  products: (json['products'] as List<dynamic>?)
      ?.map(
        (e) => $enumDecode(
          _$WSAuthMessageProductsEnumMap,
          e,
          unknownValue: WSAuthMessageProducts.unknown,
        ),
      )
      .toList(),
  token: json['token'] as String,
);

Map<String, dynamic> _$WSAuthMessageToJson(WSAuthMessage instance) => <String, dynamic>{
  'member_custom_include': instance.memberCustomInclude,
  'products': instance.products?.map((e) => _$WSAuthMessageProductsEnumMap[e]!).toList(),
  'token': instance.token,
};

const _$WSAuthMessageProductsEnumMap = {
  WSAuthMessageProducts.chat: 'chat',
  WSAuthMessageProducts.feeds: 'feeds',
  WSAuthMessageProducts.video: 'video',
  WSAuthMessageProducts.unknown: '_unknown',
};
