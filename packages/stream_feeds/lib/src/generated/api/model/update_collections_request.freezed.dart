// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_collections_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCollectionsRequest {
  List<UpdateCollectionRequest> get collections;

  /// Create a copy of UpdateCollectionsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCollectionsRequestCopyWith<UpdateCollectionsRequest> get copyWith =>
      _$UpdateCollectionsRequestCopyWithImpl<UpdateCollectionsRequest>(
          this as UpdateCollectionsRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCollectionsRequest &&
            const DeepCollectionEquality()
                .equals(other.collections, collections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(collections));

  @override
  String toString() {
    return 'UpdateCollectionsRequest(collections: $collections)';
  }
}

/// @nodoc
abstract mixin class $UpdateCollectionsRequestCopyWith<$Res> {
  factory $UpdateCollectionsRequestCopyWith(UpdateCollectionsRequest value,
          $Res Function(UpdateCollectionsRequest) _then) =
      _$UpdateCollectionsRequestCopyWithImpl;
  @useResult
  $Res call({List<UpdateCollectionRequest> collections});
}

/// @nodoc
class _$UpdateCollectionsRequestCopyWithImpl<$Res>
    implements $UpdateCollectionsRequestCopyWith<$Res> {
  _$UpdateCollectionsRequestCopyWithImpl(this._self, this._then);

  final UpdateCollectionsRequest _self;
  final $Res Function(UpdateCollectionsRequest) _then;

  /// Create a copy of UpdateCollectionsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
  }) {
    return _then(UpdateCollectionsRequest(
      collections: null == collections
          ? _self.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<UpdateCollectionRequest>,
    ));
  }
}

// dart format on
