// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslationSettings {
  bool get enabled;
  List<String> get languages;

  /// Create a copy of TranslationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TranslationSettingsCopyWith<TranslationSettings> get copyWith =>
      _$TranslationSettingsCopyWithImpl<TranslationSettings>(
          this as TranslationSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TranslationSettings &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            const DeepCollectionEquality().equals(other.languages, languages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, enabled, const DeepCollectionEquality().hash(languages));

  @override
  String toString() {
    return 'TranslationSettings(enabled: $enabled, languages: $languages)';
  }
}

/// @nodoc
abstract mixin class $TranslationSettingsCopyWith<$Res> {
  factory $TranslationSettingsCopyWith(
          TranslationSettings value, $Res Function(TranslationSettings) _then) =
      _$TranslationSettingsCopyWithImpl;
  @useResult
  $Res call({bool enabled, List<String> languages});
}

/// @nodoc
class _$TranslationSettingsCopyWithImpl<$Res>
    implements $TranslationSettingsCopyWith<$Res> {
  _$TranslationSettingsCopyWithImpl(this._self, this._then);

  final TranslationSettings _self;
  final $Res Function(TranslationSettings) _then;

  /// Create a copy of TranslationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? languages = null,
  }) {
    return _then(TranslationSettings(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: null == languages
          ? _self.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
