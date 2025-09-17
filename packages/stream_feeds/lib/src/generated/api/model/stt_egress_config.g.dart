// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stt_egress_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

STTEgressConfig _$STTEgressConfigFromJson(Map<String, dynamic> json) =>
    STTEgressConfig(
      closedCaptionsEnabled: json['closed_captions_enabled'] as bool?,
      externalStorage: json['external_storage'] == null
          ? null
          : ExternalStorage.fromJson(
              json['external_storage'] as Map<String, dynamic>),
      language: json['language'] as String?,
      storageName: json['storage_name'] as String?,
      translationLanguages: (json['translation_languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      translationsEnabled: json['translations_enabled'] as bool?,
      uploadTranscriptions: json['upload_transcriptions'] as bool?,
      whisperServerBaseUrl: json['whisper_server_base_url'] as String?,
    );

Map<String, dynamic> _$STTEgressConfigToJson(STTEgressConfig instance) =>
    <String, dynamic>{
      'closed_captions_enabled': instance.closedCaptionsEnabled,
      'external_storage': instance.externalStorage?.toJson(),
      'language': instance.language,
      'storage_name': instance.storageName,
      'translation_languages': instance.translationLanguages,
      'translations_enabled': instance.translationsEnabled,
      'upload_transcriptions': instance.uploadTranscriptions,
      'whisper_server_base_url': instance.whisperServerBaseUrl,
    };
