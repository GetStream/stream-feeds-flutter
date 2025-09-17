// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_activities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteActivitiesResponse {
  List<String> get deletedIds;
  String get duration;

  /// Create a copy of DeleteActivitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteActivitiesResponseCopyWith<DeleteActivitiesResponse> get copyWith =>
      _$DeleteActivitiesResponseCopyWithImpl<DeleteActivitiesResponse>(
          this as DeleteActivitiesResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteActivitiesResponse &&
            const DeepCollectionEquality()
                .equals(other.deletedIds, deletedIds) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(deletedIds), duration);

  @override
  String toString() {
    return 'DeleteActivitiesResponse(deletedIds: $deletedIds, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $DeleteActivitiesResponseCopyWith<$Res> {
  factory $DeleteActivitiesResponseCopyWith(DeleteActivitiesResponse value,
          $Res Function(DeleteActivitiesResponse) _then) =
      _$DeleteActivitiesResponseCopyWithImpl;
  @useResult
  $Res call({List<String> deletedIds, String duration});
}

/// @nodoc
class _$DeleteActivitiesResponseCopyWithImpl<$Res>
    implements $DeleteActivitiesResponseCopyWith<$Res> {
  _$DeleteActivitiesResponseCopyWithImpl(this._self, this._then);

  final DeleteActivitiesResponse _self;
  final $Res Function(DeleteActivitiesResponse) _then;

  /// Create a copy of DeleteActivitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deletedIds = null,
    Object? duration = null,
  }) {
    return _then(DeleteActivitiesResponse(
      deletedIds: null == deletedIds
          ? _self.deletedIds
          : deletedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
