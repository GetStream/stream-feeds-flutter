// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivacySettings {
  DeliveryReceipts? get deliveryReceipts;
  ReadReceipts? get readReceipts;
  TypingIndicators? get typingIndicators;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrivacySettingsCopyWith<PrivacySettings> get copyWith =>
      _$PrivacySettingsCopyWithImpl<PrivacySettings>(
          this as PrivacySettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrivacySettings &&
            (identical(other.deliveryReceipts, deliveryReceipts) ||
                other.deliveryReceipts == deliveryReceipts) &&
            (identical(other.readReceipts, readReceipts) ||
                other.readReceipts == readReceipts) &&
            (identical(other.typingIndicators, typingIndicators) ||
                other.typingIndicators == typingIndicators));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, deliveryReceipts, readReceipts, typingIndicators);

  @override
  String toString() {
    return 'PrivacySettings(deliveryReceipts: $deliveryReceipts, readReceipts: $readReceipts, typingIndicators: $typingIndicators)';
  }
}

/// @nodoc
abstract mixin class $PrivacySettingsCopyWith<$Res> {
  factory $PrivacySettingsCopyWith(
          PrivacySettings value, $Res Function(PrivacySettings) _then) =
      _$PrivacySettingsCopyWithImpl;
  @useResult
  $Res call(
      {DeliveryReceipts? deliveryReceipts,
      ReadReceipts? readReceipts,
      TypingIndicators? typingIndicators});
}

/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._self, this._then);

  final PrivacySettings _self;
  final $Res Function(PrivacySettings) _then;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryReceipts = freezed,
    Object? readReceipts = freezed,
    Object? typingIndicators = freezed,
  }) {
    return _then(PrivacySettings(
      deliveryReceipts: freezed == deliveryReceipts
          ? _self.deliveryReceipts
          : deliveryReceipts // ignore: cast_nullable_to_non_nullable
              as DeliveryReceipts?,
      readReceipts: freezed == readReceipts
          ? _self.readReceipts
          : readReceipts // ignore: cast_nullable_to_non_nullable
              as ReadReceipts?,
      typingIndicators: freezed == typingIndicators
          ? _self.typingIndicators
          : typingIndicators // ignore: cast_nullable_to_non_nullable
              as TypingIndicators?,
    ));
  }
}

// dart format on
