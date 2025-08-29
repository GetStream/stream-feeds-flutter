// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_moderation_config_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteModerationConfigResponse {
  String get duration;

  /// Create a copy of DeleteModerationConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteModerationConfigResponseCopyWith<DeleteModerationConfigResponse>
      get copyWith => _$DeleteModerationConfigResponseCopyWithImpl<
              DeleteModerationConfigResponse>(
          this as DeleteModerationConfigResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteModerationConfigResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration);

  @override
  String toString() {
    return 'DeleteModerationConfigResponse(duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $DeleteModerationConfigResponseCopyWith<$Res> {
  factory $DeleteModerationConfigResponseCopyWith(
          DeleteModerationConfigResponse value,
          $Res Function(DeleteModerationConfigResponse) _then) =
      _$DeleteModerationConfigResponseCopyWithImpl;
  @useResult
  $Res call({String duration});
}

/// @nodoc
class _$DeleteModerationConfigResponseCopyWithImpl<$Res>
    implements $DeleteModerationConfigResponseCopyWith<$Res> {
  _$DeleteModerationConfigResponseCopyWithImpl(this._self, this._then);

  final DeleteModerationConfigResponse _self;
  final $Res Function(DeleteModerationConfigResponse) _then;

  /// Create a copy of DeleteModerationConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
  }) {
    return _then(DeleteModerationConfigResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
