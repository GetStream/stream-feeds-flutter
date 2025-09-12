// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apns.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$APNS {
  String get body;
  int? get contentAvailable;
  Map<String, Object?>? get data;
  int? get mutableContent;
  String? get sound;
  String get title;

  /// Create a copy of APNS
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $APNSCopyWith<APNS> get copyWith =>
      _$APNSCopyWithImpl<APNS>(this as APNS, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is APNS &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.contentAvailable, contentAvailable) ||
                other.contentAvailable == contentAvailable) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.mutableContent, mutableContent) ||
                other.mutableContent == mutableContent) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body, contentAvailable,
      const DeepCollectionEquality().hash(data), mutableContent, sound, title);

  @override
  String toString() {
    return 'APNS(body: $body, contentAvailable: $contentAvailable, data: $data, mutableContent: $mutableContent, sound: $sound, title: $title)';
  }
}

/// @nodoc
abstract mixin class $APNSCopyWith<$Res> {
  factory $APNSCopyWith(APNS value, $Res Function(APNS) _then) =
      _$APNSCopyWithImpl;
  @useResult
  $Res call(
      {String body,
      int? contentAvailable,
      Map<String, Object?>? data,
      int? mutableContent,
      String? sound,
      String title});
}

/// @nodoc
class _$APNSCopyWithImpl<$Res> implements $APNSCopyWith<$Res> {
  _$APNSCopyWithImpl(this._self, this._then);

  final APNS _self;
  final $Res Function(APNS) _then;

  /// Create a copy of APNS
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? contentAvailable = freezed,
    Object? data = freezed,
    Object? mutableContent = freezed,
    Object? sound = freezed,
    Object? title = null,
  }) {
    return _then(APNS(
      body: null == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      contentAvailable: freezed == contentAvailable
          ? _self.contentAvailable
          : contentAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      mutableContent: freezed == mutableContent
          ? _self.mutableContent
          : mutableContent // ignore: cast_nullable_to_non_nullable
              as int?,
      sound: freezed == sound
          ? _self.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
