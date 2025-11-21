// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_collections_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCollectionsResponse {
  List<CollectionResponse> get collections;
  String get duration;

  /// Create a copy of CreateCollectionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateCollectionsResponseCopyWith<CreateCollectionsResponse> get copyWith =>
      _$CreateCollectionsResponseCopyWithImpl<CreateCollectionsResponse>(
          this as CreateCollectionsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCollectionsResponse &&
            const DeepCollectionEquality()
                .equals(other.collections, collections) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(collections), duration);

  @override
  String toString() {
    return 'CreateCollectionsResponse(collections: $collections, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $CreateCollectionsResponseCopyWith<$Res> {
  factory $CreateCollectionsResponseCopyWith(CreateCollectionsResponse value,
          $Res Function(CreateCollectionsResponse) _then) =
      _$CreateCollectionsResponseCopyWithImpl;
  @useResult
  $Res call({List<CollectionResponse> collections, String duration});
}

/// @nodoc
class _$CreateCollectionsResponseCopyWithImpl<$Res>
    implements $CreateCollectionsResponseCopyWith<$Res> {
  _$CreateCollectionsResponseCopyWithImpl(this._self, this._then);

  final CreateCollectionsResponse _self;
  final $Res Function(CreateCollectionsResponse) _then;

  /// Create a copy of CreateCollectionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? duration = null,
  }) {
    return _then(CreateCollectionsResponse(
      collections: null == collections
          ? _self.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionResponse>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
