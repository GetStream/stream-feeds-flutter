// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscriptionSettings _$TranscriptionSettingsFromJson(
        Map<String, dynamic> json) =>
    TranscriptionSettings(
      closedCaptionMode: $enumDecode(
          _$TranscriptionSettingsClosedCaptionModeEnumMap,
          json['closed_caption_mode'],
          unknownValue: TranscriptionSettingsClosedCaptionMode.unknown),
      language: $enumDecode(
          _$TranscriptionSettingsLanguageEnumMap, json['language'],
          unknownValue: TranscriptionSettingsLanguage.unknown),
      mode: $enumDecode(_$TranscriptionSettingsModeEnumMap, json['mode'],
          unknownValue: TranscriptionSettingsMode.unknown),
      speechSegmentConfig: json['speech_segment_config'] == null
          ? null
          : SpeechSegmentConfig.fromJson(
              json['speech_segment_config'] as Map<String, dynamic>),
      translation: json['translation'] == null
          ? null
          : TranslationSettings.fromJson(
              json['translation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TranscriptionSettingsToJson(
        TranscriptionSettings instance) =>
    <String, dynamic>{
      'closed_caption_mode': _$TranscriptionSettingsClosedCaptionModeEnumMap[
          instance.closedCaptionMode]!,
      'language': _$TranscriptionSettingsLanguageEnumMap[instance.language]!,
      'mode': _$TranscriptionSettingsModeEnumMap[instance.mode]!,
      'speech_segment_config': instance.speechSegmentConfig?.toJson(),
      'translation': instance.translation?.toJson(),
    };

const _$TranscriptionSettingsClosedCaptionModeEnumMap = {
  TranscriptionSettingsClosedCaptionMode.autoOn: 'auto-on',
  TranscriptionSettingsClosedCaptionMode.available: 'available',
  TranscriptionSettingsClosedCaptionMode.disabled: 'disabled',
  TranscriptionSettingsClosedCaptionMode.unknown: '_unknown',
};

const _$TranscriptionSettingsLanguageEnumMap = {
  TranscriptionSettingsLanguage.ar: 'ar',
  TranscriptionSettingsLanguage.auto: 'auto',
  TranscriptionSettingsLanguage.bg: 'bg',
  TranscriptionSettingsLanguage.ca: 'ca',
  TranscriptionSettingsLanguage.cs: 'cs',
  TranscriptionSettingsLanguage.da: 'da',
  TranscriptionSettingsLanguage.de: 'de',
  TranscriptionSettingsLanguage.el: 'el',
  TranscriptionSettingsLanguage.en: 'en',
  TranscriptionSettingsLanguage.es: 'es',
  TranscriptionSettingsLanguage.et: 'et',
  TranscriptionSettingsLanguage.fi: 'fi',
  TranscriptionSettingsLanguage.fr: 'fr',
  TranscriptionSettingsLanguage.he: 'he',
  TranscriptionSettingsLanguage.hi: 'hi',
  TranscriptionSettingsLanguage.hr: 'hr',
  TranscriptionSettingsLanguage.hu: 'hu',
  TranscriptionSettingsLanguage.id: 'id',
  TranscriptionSettingsLanguage.it: 'it',
  TranscriptionSettingsLanguage.ja: 'ja',
  TranscriptionSettingsLanguage.ko: 'ko',
  TranscriptionSettingsLanguage.ms: 'ms',
  TranscriptionSettingsLanguage.nl: 'nl',
  TranscriptionSettingsLanguage.no: 'no',
  TranscriptionSettingsLanguage.pl: 'pl',
  TranscriptionSettingsLanguage.pt: 'pt',
  TranscriptionSettingsLanguage.ro: 'ro',
  TranscriptionSettingsLanguage.ru: 'ru',
  TranscriptionSettingsLanguage.sk: 'sk',
  TranscriptionSettingsLanguage.sl: 'sl',
  TranscriptionSettingsLanguage.sv: 'sv',
  TranscriptionSettingsLanguage.ta: 'ta',
  TranscriptionSettingsLanguage.th: 'th',
  TranscriptionSettingsLanguage.tl: 'tl',
  TranscriptionSettingsLanguage.tr: 'tr',
  TranscriptionSettingsLanguage.uk: 'uk',
  TranscriptionSettingsLanguage.zh: 'zh',
  TranscriptionSettingsLanguage.unknown: '_unknown',
};

const _$TranscriptionSettingsModeEnumMap = {
  TranscriptionSettingsMode.autoOn: 'auto-on',
  TranscriptionSettingsMode.available: 'available',
  TranscriptionSettingsMode.disabled: 'disabled',
  TranscriptionSettingsMode.unknown: '_unknown',
};
