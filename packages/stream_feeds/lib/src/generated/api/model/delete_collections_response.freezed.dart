// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_collections_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteCollectionsResponse {
  String get duration;

  /// Create a copy of DeleteCollectionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteCollectionsResponseCopyWith<DeleteCollectionsResponse> get copyWith =>
      _$DeleteCollectionsResponseCopyWithImpl<DeleteCollectionsResponse>(
          this as DeleteCollectionsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteCollectionsResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration);

  @override
  String toString() {
    return 'DeleteCollectionsResponse(duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $DeleteCollectionsResponseCopyWith<$Res> {
  factory $DeleteCollectionsResponseCopyWith(DeleteCollectionsResponse value,
          $Res Function(DeleteCollectionsResponse) _then) =
      _$DeleteCollectionsResponseCopyWithImpl;
  @useResult
  $Res call({String duration});
}

/// @nodoc
class _$DeleteCollectionsResponseCopyWithImpl<$Res>
    implements $DeleteCollectionsResponseCopyWith<$Res> {
  _$DeleteCollectionsResponseCopyWithImpl(this._self, this._then);

  final DeleteCollectionsResponse _self;
  final $Res Function(DeleteCollectionsResponse) _then;

  /// Create a copy of DeleteCollectionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
  }) {
    return _then(DeleteCollectionsResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
