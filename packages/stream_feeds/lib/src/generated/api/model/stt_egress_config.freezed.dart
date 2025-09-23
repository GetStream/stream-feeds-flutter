// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stt_egress_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$STTEgressConfig {
  bool? get closedCaptionsEnabled;
  ExternalStorage? get externalStorage;
  String? get language;
  SpeechSegmentConfig? get speechSegmentConfig;
  String? get storageName;
  List<String>? get translationLanguages;
  bool? get translationsEnabled;
  bool? get uploadTranscriptions;
  String? get whisperServerBaseUrl;

  /// Create a copy of STTEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $STTEgressConfigCopyWith<STTEgressConfig> get copyWith =>
      _$STTEgressConfigCopyWithImpl<STTEgressConfig>(
          this as STTEgressConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is STTEgressConfig &&
            (identical(other.closedCaptionsEnabled, closedCaptionsEnabled) ||
                other.closedCaptionsEnabled == closedCaptionsEnabled) &&
            (identical(other.externalStorage, externalStorage) ||
                other.externalStorage == externalStorage) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.speechSegmentConfig, speechSegmentConfig) ||
                other.speechSegmentConfig == speechSegmentConfig) &&
            (identical(other.storageName, storageName) ||
                other.storageName == storageName) &&
            const DeepCollectionEquality()
                .equals(other.translationLanguages, translationLanguages) &&
            (identical(other.translationsEnabled, translationsEnabled) ||
                other.translationsEnabled == translationsEnabled) &&
            (identical(other.uploadTranscriptions, uploadTranscriptions) ||
                other.uploadTranscriptions == uploadTranscriptions) &&
            (identical(other.whisperServerBaseUrl, whisperServerBaseUrl) ||
                other.whisperServerBaseUrl == whisperServerBaseUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      closedCaptionsEnabled,
      externalStorage,
      language,
      speechSegmentConfig,
      storageName,
      const DeepCollectionEquality().hash(translationLanguages),
      translationsEnabled,
      uploadTranscriptions,
      whisperServerBaseUrl);

  @override
  String toString() {
    return 'STTEgressConfig(closedCaptionsEnabled: $closedCaptionsEnabled, externalStorage: $externalStorage, language: $language, speechSegmentConfig: $speechSegmentConfig, storageName: $storageName, translationLanguages: $translationLanguages, translationsEnabled: $translationsEnabled, uploadTranscriptions: $uploadTranscriptions, whisperServerBaseUrl: $whisperServerBaseUrl)';
  }
}

/// @nodoc
abstract mixin class $STTEgressConfigCopyWith<$Res> {
  factory $STTEgressConfigCopyWith(
          STTEgressConfig value, $Res Function(STTEgressConfig) _then) =
      _$STTEgressConfigCopyWithImpl;
  @useResult
  $Res call(
      {bool? closedCaptionsEnabled,
      ExternalStorage? externalStorage,
      String? language,
      SpeechSegmentConfig? speechSegmentConfig,
      String? storageName,
      List<String>? translationLanguages,
      bool? translationsEnabled,
      bool? uploadTranscriptions,
      String? whisperServerBaseUrl});
}

/// @nodoc
class _$STTEgressConfigCopyWithImpl<$Res>
    implements $STTEgressConfigCopyWith<$Res> {
  _$STTEgressConfigCopyWithImpl(this._self, this._then);

  final STTEgressConfig _self;
  final $Res Function(STTEgressConfig) _then;

  /// Create a copy of STTEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closedCaptionsEnabled = freezed,
    Object? externalStorage = freezed,
    Object? language = freezed,
    Object? speechSegmentConfig = freezed,
    Object? storageName = freezed,
    Object? translationLanguages = freezed,
    Object? translationsEnabled = freezed,
    Object? uploadTranscriptions = freezed,
    Object? whisperServerBaseUrl = freezed,
  }) {
    return _then(STTEgressConfig(
      closedCaptionsEnabled: freezed == closedCaptionsEnabled
          ? _self.closedCaptionsEnabled
          : closedCaptionsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      externalStorage: freezed == externalStorage
          ? _self.externalStorage
          : externalStorage // ignore: cast_nullable_to_non_nullable
              as ExternalStorage?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      speechSegmentConfig: freezed == speechSegmentConfig
          ? _self.speechSegmentConfig
          : speechSegmentConfig // ignore: cast_nullable_to_non_nullable
              as SpeechSegmentConfig?,
      storageName: freezed == storageName
          ? _self.storageName
          : storageName // ignore: cast_nullable_to_non_nullable
              as String?,
      translationLanguages: freezed == translationLanguages
          ? _self.translationLanguages
          : translationLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      translationsEnabled: freezed == translationsEnabled
          ? _self.translationsEnabled
          : translationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      uploadTranscriptions: freezed == uploadTranscriptions
          ? _self.uploadTranscriptions
          : uploadTranscriptions // ignore: cast_nullable_to_non_nullable
              as bool?,
      whisperServerBaseUrl: freezed == whisperServerBaseUrl
          ? _self.whisperServerBaseUrl
          : whisperServerBaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
