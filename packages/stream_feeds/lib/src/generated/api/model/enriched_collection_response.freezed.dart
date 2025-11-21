// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enriched_collection_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EnrichedCollectionResponse {
  DateTime? get createdAt;
  Map<String, Object?>? get custom;
  String get id;
  String get name;
  EnrichedCollectionResponseStatus get status;
  DateTime? get updatedAt;
  String? get userId;

  /// Create a copy of EnrichedCollectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnrichedCollectionResponseCopyWith<EnrichedCollectionResponse>
      get copyWith =>
          _$EnrichedCollectionResponseCopyWithImpl<EnrichedCollectionResponse>(
              this as EnrichedCollectionResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnrichedCollectionResponse &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      id,
      name,
      status,
      updatedAt,
      userId);

  @override
  String toString() {
    return 'EnrichedCollectionResponse(createdAt: $createdAt, custom: $custom, id: $id, name: $name, status: $status, updatedAt: $updatedAt, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $EnrichedCollectionResponseCopyWith<$Res> {
  factory $EnrichedCollectionResponseCopyWith(EnrichedCollectionResponse value,
          $Res Function(EnrichedCollectionResponse) _then) =
      _$EnrichedCollectionResponseCopyWithImpl;
  @useResult
  $Res call(
      {DateTime? createdAt,
      Map<String, Object?>? custom,
      String id,
      String name,
      EnrichedCollectionResponseStatus status,
      DateTime? updatedAt,
      String? userId});
}

/// @nodoc
class _$EnrichedCollectionResponseCopyWithImpl<$Res>
    implements $EnrichedCollectionResponseCopyWith<$Res> {
  _$EnrichedCollectionResponseCopyWithImpl(this._self, this._then);

  final EnrichedCollectionResponse _self;
  final $Res Function(EnrichedCollectionResponse) _then;

  /// Create a copy of EnrichedCollectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? custom = freezed,
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? updatedAt = freezed,
    Object? userId = freezed,
  }) {
    return _then(EnrichedCollectionResponse(
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnrichedCollectionResponseStatus,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
