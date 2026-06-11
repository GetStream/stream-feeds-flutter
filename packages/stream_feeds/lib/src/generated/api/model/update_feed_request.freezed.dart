// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_feed_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateFeedRequest {
  bool? get clearLocation;
  Map<String, Object?>? get custom;
  String? get description;
  bool? get enrichOwnFields;
  List<String>? get filterTags;
  Location? get location;
  String? get name;

  /// Create a copy of UpdateFeedRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateFeedRequestCopyWith<UpdateFeedRequest> get copyWith =>
      _$UpdateFeedRequestCopyWithImpl<UpdateFeedRequest>(
          this as UpdateFeedRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateFeedRequest &&
            (identical(other.clearLocation, clearLocation) ||
                other.clearLocation == clearLocation) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.enrichOwnFields, enrichOwnFields) ||
                other.enrichOwnFields == enrichOwnFields) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      clearLocation,
      const DeepCollectionEquality().hash(custom),
      description,
      enrichOwnFields,
      const DeepCollectionEquality().hash(filterTags),
      location,
      name);

  @override
  String toString() {
    return 'UpdateFeedRequest(clearLocation: $clearLocation, custom: $custom, description: $description, enrichOwnFields: $enrichOwnFields, filterTags: $filterTags, location: $location, name: $name)';
  }
}

/// @nodoc
abstract mixin class $UpdateFeedRequestCopyWith<$Res> {
  factory $UpdateFeedRequestCopyWith(
          UpdateFeedRequest value, $Res Function(UpdateFeedRequest) _then) =
      _$UpdateFeedRequestCopyWithImpl;
  @useResult
  $Res call(
      {bool? clearLocation,
      Map<String, Object?>? custom,
      String? description,
      bool? enrichOwnFields,
      List<String>? filterTags,
      Location? location,
      String? name});
}

/// @nodoc
class _$UpdateFeedRequestCopyWithImpl<$Res>
    implements $UpdateFeedRequestCopyWith<$Res> {
  _$UpdateFeedRequestCopyWithImpl(this._self, this._then);

  final UpdateFeedRequest _self;
  final $Res Function(UpdateFeedRequest) _then;

  /// Create a copy of UpdateFeedRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clearLocation = freezed,
    Object? custom = freezed,
    Object? description = freezed,
    Object? enrichOwnFields = freezed,
    Object? filterTags = freezed,
    Object? location = freezed,
    Object? name = freezed,
  }) {
    return _then(UpdateFeedRequest(
      clearLocation: freezed == clearLocation
          ? _self.clearLocation
          : clearLocation // ignore: cast_nullable_to_non_nullable
              as bool?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      enrichOwnFields: freezed == enrichOwnFields
          ? _self.enrichOwnFields
          : enrichOwnFields // ignore: cast_nullable_to_non_nullable
              as bool?,
      filterTags: freezed == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
