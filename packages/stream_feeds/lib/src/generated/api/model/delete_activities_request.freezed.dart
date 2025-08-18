// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_activities_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteActivitiesRequest {
  List<String> get activityIds;
  bool? get hardDelete;

  /// Create a copy of DeleteActivitiesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteActivitiesRequestCopyWith<DeleteActivitiesRequest> get copyWith =>
      _$DeleteActivitiesRequestCopyWithImpl<DeleteActivitiesRequest>(
          this as DeleteActivitiesRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteActivitiesRequest &&
            const DeepCollectionEquality()
                .equals(other.activityIds, activityIds) &&
            (identical(other.hardDelete, hardDelete) ||
                other.hardDelete == hardDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(activityIds), hardDelete);

  @override
  String toString() {
    return 'DeleteActivitiesRequest(activityIds: $activityIds, hardDelete: $hardDelete)';
  }
}

/// @nodoc
abstract mixin class $DeleteActivitiesRequestCopyWith<$Res> {
  factory $DeleteActivitiesRequestCopyWith(DeleteActivitiesRequest value,
          $Res Function(DeleteActivitiesRequest) _then) =
      _$DeleteActivitiesRequestCopyWithImpl;
  @useResult
  $Res call({List<String> activityIds, bool? hardDelete});
}

/// @nodoc
class _$DeleteActivitiesRequestCopyWithImpl<$Res>
    implements $DeleteActivitiesRequestCopyWith<$Res> {
  _$DeleteActivitiesRequestCopyWithImpl(this._self, this._then);

  final DeleteActivitiesRequest _self;
  final $Res Function(DeleteActivitiesRequest) _then;

  /// Create a copy of DeleteActivitiesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityIds = null,
    Object? hardDelete = freezed,
  }) {
    return _then(DeleteActivitiesRequest(
      activityIds: null == activityIds
          ? _self.activityIds
          : activityIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hardDelete: freezed == hardDelete
          ? _self.hardDelete
          : hardDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
