// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecordSettings {
  bool? get audioOnly;
  LayoutSettings? get layout;
  String get mode;
  String? get quality;

  /// Create a copy of RecordSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecordSettingsCopyWith<RecordSettings> get copyWith =>
      _$RecordSettingsCopyWithImpl<RecordSettings>(
          this as RecordSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecordSettings &&
            (identical(other.audioOnly, audioOnly) ||
                other.audioOnly == audioOnly) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, audioOnly, layout, mode, quality);

  @override
  String toString() {
    return 'RecordSettings(audioOnly: $audioOnly, layout: $layout, mode: $mode, quality: $quality)';
  }
}

/// @nodoc
abstract mixin class $RecordSettingsCopyWith<$Res> {
  factory $RecordSettingsCopyWith(
          RecordSettings value, $Res Function(RecordSettings) _then) =
      _$RecordSettingsCopyWithImpl;
  @useResult
  $Res call(
      {bool? audioOnly, LayoutSettings? layout, String mode, String? quality});
}

/// @nodoc
class _$RecordSettingsCopyWithImpl<$Res>
    implements $RecordSettingsCopyWith<$Res> {
  _$RecordSettingsCopyWithImpl(this._self, this._then);

  final RecordSettings _self;
  final $Res Function(RecordSettings) _then;

  /// Create a copy of RecordSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioOnly = freezed,
    Object? layout = freezed,
    Object? mode = null,
    Object? quality = freezed,
  }) {
    return _then(RecordSettings(
      audioOnly: freezed == audioOnly
          ? _self.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      layout: freezed == layout
          ? _self.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as LayoutSettings?,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      quality: freezed == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
