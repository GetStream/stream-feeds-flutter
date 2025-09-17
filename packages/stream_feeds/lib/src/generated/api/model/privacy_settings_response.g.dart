// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacySettingsResponse _$PrivacySettingsResponseFromJson(
        Map<String, dynamic> json) =>
    PrivacySettingsResponse(
      readReceipts: json['read_receipts'] == null
          ? null
          : ReadReceiptsResponse.fromJson(
              json['read_receipts'] as Map<String, dynamic>),
      typingIndicators: json['typing_indicators'] == null
          ? null
          : TypingIndicatorsResponse.fromJson(
              json['typing_indicators'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrivacySettingsResponseToJson(
        PrivacySettingsResponse instance) =>
    <String, dynamic>{
      'read_receipts': instance.readReceipts?.toJson(),
      'typing_indicators': instance.typingIndicators?.toJson(),
    };
