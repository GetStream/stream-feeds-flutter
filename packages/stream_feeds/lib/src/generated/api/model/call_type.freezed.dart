// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallType {
  int get appPK;
  DateTime get createdAt;
  String get externalStorage;
  String get name;
  NotificationSettings? get notificationSettings;
  int get pK;
  CallSettings? get settings;
  DateTime get updatedAt;

  /// Create a copy of CallType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CallTypeCopyWith<CallType> get copyWith =>
      _$CallTypeCopyWithImpl<CallType>(this as CallType, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CallType &&
            (identical(other.appPK, appPK) || other.appPK == appPK) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.externalStorage, externalStorage) ||
                other.externalStorage == externalStorage) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.notificationSettings, notificationSettings) ||
                other.notificationSettings == notificationSettings) &&
            (identical(other.pK, pK) || other.pK == pK) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPK, createdAt,
      externalStorage, name, notificationSettings, pK, settings, updatedAt);

  @override
  String toString() {
    return 'CallType(appPK: $appPK, createdAt: $createdAt, externalStorage: $externalStorage, name: $name, notificationSettings: $notificationSettings, pK: $pK, settings: $settings, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CallTypeCopyWith<$Res> {
  factory $CallTypeCopyWith(CallType value, $Res Function(CallType) _then) =
      _$CallTypeCopyWithImpl;
  @useResult
  $Res call(
      {int appPK,
      DateTime createdAt,
      String externalStorage,
      String name,
      NotificationSettings? notificationSettings,
      int pK,
      CallSettings? settings,
      DateTime updatedAt});
}

/// @nodoc
class _$CallTypeCopyWithImpl<$Res> implements $CallTypeCopyWith<$Res> {
  _$CallTypeCopyWithImpl(this._self, this._then);

  final CallType _self;
  final $Res Function(CallType) _then;

  /// Create a copy of CallType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPK = null,
    Object? createdAt = null,
    Object? externalStorage = null,
    Object? name = null,
    Object? notificationSettings = freezed,
    Object? pK = null,
    Object? settings = freezed,
    Object? updatedAt = null,
  }) {
    return _then(CallType(
      appPK: null == appPK
          ? _self.appPK
          : appPK // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      externalStorage: null == externalStorage
          ? _self.externalStorage
          : externalStorage // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notificationSettings: freezed == notificationSettings
          ? _self.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      pK: null == pK
          ? _self.pK
          : pK // ignore: cast_nullable_to_non_nullable
              as int,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CallSettings?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
