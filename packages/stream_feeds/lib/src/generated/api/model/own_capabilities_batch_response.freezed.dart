// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'own_capabilities_batch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OwnCapabilitiesBatchResponse {
  Map<String, List<String>> get capabilities;
  String get duration;

  /// Create a copy of OwnCapabilitiesBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OwnCapabilitiesBatchResponseCopyWith<OwnCapabilitiesBatchResponse>
      get copyWith => _$OwnCapabilitiesBatchResponseCopyWithImpl<
              OwnCapabilitiesBatchResponse>(
          this as OwnCapabilitiesBatchResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OwnCapabilitiesBatchResponse &&
            const DeepCollectionEquality()
                .equals(other.capabilities, capabilities) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(capabilities), duration);

  @override
  String toString() {
    return 'OwnCapabilitiesBatchResponse(capabilities: $capabilities, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $OwnCapabilitiesBatchResponseCopyWith<$Res> {
  factory $OwnCapabilitiesBatchResponseCopyWith(
          OwnCapabilitiesBatchResponse value,
          $Res Function(OwnCapabilitiesBatchResponse) _then) =
      _$OwnCapabilitiesBatchResponseCopyWithImpl;
  @useResult
  $Res call({Map<String, List<String>> capabilities, String duration});
}

/// @nodoc
class _$OwnCapabilitiesBatchResponseCopyWithImpl<$Res>
    implements $OwnCapabilitiesBatchResponseCopyWith<$Res> {
  _$OwnCapabilitiesBatchResponseCopyWithImpl(this._self, this._then);

  final OwnCapabilitiesBatchResponse _self;
  final $Res Function(OwnCapabilitiesBatchResponse) _then;

  /// Create a copy of OwnCapabilitiesBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capabilities = null,
    Object? duration = null,
  }) {
    return _then(OwnCapabilitiesBatchResponse(
      capabilities: null == capabilities
          ? _self.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
