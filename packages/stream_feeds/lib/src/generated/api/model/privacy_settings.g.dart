// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) =>
    PrivacySettings(
      readReceipts: json['read_receipts'] == null
          ? null
          : ReadReceipts.fromJson(
              json['read_receipts'] as Map<String, dynamic>),
      typingIndicators: json['typing_indicators'] == null
          ? null
          : TypingIndicators.fromJson(
              json['typing_indicators'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrivacySettingsToJson(PrivacySettings instance) =>
    <String, dynamic>{
      'read_receipts': instance.readReceipts?.toJson(),
      'typing_indicators': instance.typingIndicators?.toJson(),
    };
