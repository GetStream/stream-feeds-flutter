// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connect_user_details_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectUserDetailsRequest {
  Map<String, Object>? get custom;
  String get id;
  String? get image;
  bool? get invisible;
  String? get language;
  String? get name;
  PrivacySettingsResponse? get privacySettings;

  /// Create a copy of ConnectUserDetailsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConnectUserDetailsRequestCopyWith<ConnectUserDetailsRequest> get copyWith =>
      _$ConnectUserDetailsRequestCopyWithImpl<ConnectUserDetailsRequest>(
          this as ConnectUserDetailsRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectUserDetailsRequest &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.invisible, invisible) ||
                other.invisible == invisible) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.privacySettings, privacySettings) ||
                other.privacySettings == privacySettings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(custom),
      id,
      image,
      invisible,
      language,
      name,
      privacySettings);

  @override
  String toString() {
    return 'ConnectUserDetailsRequest(custom: $custom, id: $id, image: $image, invisible: $invisible, language: $language, name: $name, privacySettings: $privacySettings)';
  }
}

/// @nodoc
abstract mixin class $ConnectUserDetailsRequestCopyWith<$Res> {
  factory $ConnectUserDetailsRequestCopyWith(ConnectUserDetailsRequest value,
          $Res Function(ConnectUserDetailsRequest) _then) =
      _$ConnectUserDetailsRequestCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object>? custom,
      String id,
      String? image,
      bool? invisible,
      String? language,
      String? name,
      PrivacySettingsResponse? privacySettings});
}

/// @nodoc
class _$ConnectUserDetailsRequestCopyWithImpl<$Res>
    implements $ConnectUserDetailsRequestCopyWith<$Res> {
  _$ConnectUserDetailsRequestCopyWithImpl(this._self, this._then);

  final ConnectUserDetailsRequest _self;
  final $Res Function(ConnectUserDetailsRequest) _then;

  /// Create a copy of ConnectUserDetailsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custom = freezed,
    Object? id = null,
    Object? image = freezed,
    Object? invisible = freezed,
    Object? language = freezed,
    Object? name = freezed,
    Object? privacySettings = freezed,
  }) {
    return _then(ConnectUserDetailsRequest(
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      invisible: freezed == invisible
          ? _self.invisible
          : invisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      privacySettings: freezed == privacySettings
          ? _self.privacySettings
          : privacySettings // ignore: cast_nullable_to_non_nullable
              as PrivacySettingsResponse?,
    ));
  }
}

// dart format on
