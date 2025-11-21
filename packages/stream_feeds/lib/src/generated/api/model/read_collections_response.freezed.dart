// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read_collections_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadCollectionsResponse {
  List<CollectionResponse> get collections;
  String get duration;

  /// Create a copy of ReadCollectionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReadCollectionsResponseCopyWith<ReadCollectionsResponse> get copyWith =>
      _$ReadCollectionsResponseCopyWithImpl<ReadCollectionsResponse>(
          this as ReadCollectionsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReadCollectionsResponse &&
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
    return 'ReadCollectionsResponse(collections: $collections, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $ReadCollectionsResponseCopyWith<$Res> {
  factory $ReadCollectionsResponseCopyWith(ReadCollectionsResponse value,
          $Res Function(ReadCollectionsResponse) _then) =
      _$ReadCollectionsResponseCopyWithImpl;
  @useResult
  $Res call({List<CollectionResponse> collections, String duration});
}

/// @nodoc
class _$ReadCollectionsResponseCopyWithImpl<$Res>
    implements $ReadCollectionsResponseCopyWith<$Res> {
  _$ReadCollectionsResponseCopyWithImpl(this._self, this._then);

  final ReadCollectionsResponse _self;
  final $Res Function(ReadCollectionsResponse) _then;

  /// Create a copy of ReadCollectionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? duration = null,
  }) {
    return _then(ReadCollectionsResponse(
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
