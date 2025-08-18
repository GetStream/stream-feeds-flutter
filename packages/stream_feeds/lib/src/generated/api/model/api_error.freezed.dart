// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$APIError {
  int get code;
  List<int> get details;
  String get duration;
  Map<String, String>? get exceptionFields;
  String get message;
  String get moreInfo;
  int get statusCode;
  bool? get unrecoverable;

  /// Create a copy of APIError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $APIErrorCopyWith<APIError> get copyWith =>
      _$APIErrorCopyWithImpl<APIError>(this as APIError, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is APIError &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.details, details) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other.exceptionFields, exceptionFields) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.moreInfo, moreInfo) ||
                other.moreInfo == moreInfo) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.unrecoverable, unrecoverable) ||
                other.unrecoverable == unrecoverable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      const DeepCollectionEquality().hash(details),
      duration,
      const DeepCollectionEquality().hash(exceptionFields),
      message,
      moreInfo,
      statusCode,
      unrecoverable);

  @override
  String toString() {
    return 'APIError(code: $code, details: $details, duration: $duration, exceptionFields: $exceptionFields, message: $message, moreInfo: $moreInfo, statusCode: $statusCode, unrecoverable: $unrecoverable)';
  }
}

/// @nodoc
abstract mixin class $APIErrorCopyWith<$Res> {
  factory $APIErrorCopyWith(APIError value, $Res Function(APIError) _then) =
      _$APIErrorCopyWithImpl;
  @useResult
  $Res call(
      {int code,
      List<int> details,
      String duration,
      Map<String, String>? exceptionFields,
      String message,
      String moreInfo,
      int statusCode,
      bool? unrecoverable});
}

/// @nodoc
class _$APIErrorCopyWithImpl<$Res> implements $APIErrorCopyWith<$Res> {
  _$APIErrorCopyWithImpl(this._self, this._then);

  final APIError _self;
  final $Res Function(APIError) _then;

  /// Create a copy of APIError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? details = null,
    Object? duration = null,
    Object? exceptionFields = freezed,
    Object? message = null,
    Object? moreInfo = null,
    Object? statusCode = null,
    Object? unrecoverable = freezed,
  }) {
    return _then(APIError(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<int>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      exceptionFields: freezed == exceptionFields
          ? _self.exceptionFields
          : exceptionFields // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      moreInfo: null == moreInfo
          ? _self.moreInfo
          : moreInfo // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      unrecoverable: freezed == unrecoverable
          ? _self.unrecoverable
          : unrecoverable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
