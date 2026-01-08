// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'own_batch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OwnBatchResponse {
  Map<String, FeedOwnData> get data;
  String get duration;

  /// Create a copy of OwnBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OwnBatchResponseCopyWith<OwnBatchResponse> get copyWith =>
      _$OwnBatchResponseCopyWithImpl<OwnBatchResponse>(
          this as OwnBatchResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OwnBatchResponse &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), duration);

  @override
  String toString() {
    return 'OwnBatchResponse(data: $data, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $OwnBatchResponseCopyWith<$Res> {
  factory $OwnBatchResponseCopyWith(
          OwnBatchResponse value, $Res Function(OwnBatchResponse) _then) =
      _$OwnBatchResponseCopyWithImpl;
  @useResult
  $Res call({Map<String, FeedOwnData> data, String duration});
}

/// @nodoc
class _$OwnBatchResponseCopyWithImpl<$Res>
    implements $OwnBatchResponseCopyWith<$Res> {
  _$OwnBatchResponseCopyWithImpl(this._self, this._then);

  final OwnBatchResponse _self;
  final $Res Function(OwnBatchResponse) _then;

  /// Create a copy of OwnBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? duration = null,
  }) {
    return _then(OwnBatchResponse(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, FeedOwnData>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
