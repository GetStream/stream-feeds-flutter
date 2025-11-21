// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_collection_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCollectionRequest {
  Map<String, Object?> get custom;
  String get id;
  String get name;

  /// Create a copy of UpdateCollectionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCollectionRequestCopyWith<UpdateCollectionRequest> get copyWith =>
      _$UpdateCollectionRequestCopyWithImpl<UpdateCollectionRequest>(
          this as UpdateCollectionRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCollectionRequest &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(custom), id, name);

  @override
  String toString() {
    return 'UpdateCollectionRequest(custom: $custom, id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $UpdateCollectionRequestCopyWith<$Res> {
  factory $UpdateCollectionRequestCopyWith(UpdateCollectionRequest value,
          $Res Function(UpdateCollectionRequest) _then) =
      _$UpdateCollectionRequestCopyWithImpl;
  @useResult
  $Res call({Map<String, Object?> custom, String id, String name});
}

/// @nodoc
class _$UpdateCollectionRequestCopyWithImpl<$Res>
    implements $UpdateCollectionRequestCopyWith<$Res> {
  _$UpdateCollectionRequestCopyWithImpl(this._self, this._then);

  final UpdateCollectionRequest _self;
  final $Res Function(UpdateCollectionRequest) _then;

  /// Create a copy of UpdateCollectionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custom = null,
    Object? id = null,
    Object? name = null,
  }) {
    return _then(UpdateCollectionRequest(
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
