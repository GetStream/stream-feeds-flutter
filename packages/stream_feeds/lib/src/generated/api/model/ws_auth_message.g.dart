// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_auth_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WSAuthMessage _$WSAuthMessageFromJson(Map<String, dynamic> json) =>
    WSAuthMessage(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$WSAuthMessageToJson(WSAuthMessage instance) =>
    <String, dynamic>{
      'products': instance.products,
      'token': instance.token,
    };
