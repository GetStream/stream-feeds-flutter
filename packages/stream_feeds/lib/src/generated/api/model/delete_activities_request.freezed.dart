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
  bool? get hardDelete;
  List<String> get ids;

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
            (identical(other.hardDelete, hardDelete) ||
                other.hardDelete == hardDelete) &&
            const DeepCollectionEquality().equals(other.ids, ids));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hardDelete, const DeepCollectionEquality().hash(ids));

  @override
  String toString() {
    return 'DeleteActivitiesRequest(hardDelete: $hardDelete, ids: $ids)';
  }
}

/// @nodoc
abstract mixin class $DeleteActivitiesRequestCopyWith<$Res> {
  factory $DeleteActivitiesRequestCopyWith(DeleteActivitiesRequest value,
          $Res Function(DeleteActivitiesRequest) _then) =
      _$DeleteActivitiesRequestCopyWithImpl;
  @useResult
  $Res call({bool? hardDelete, List<String> ids});
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
    Object? hardDelete = freezed,
    Object? ids = null,
  }) {
    return _then(DeleteActivitiesRequest(
      hardDelete: freezed == hardDelete
          ? _self.hardDelete
          : hardDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      ids: null == ids
          ? _self.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
