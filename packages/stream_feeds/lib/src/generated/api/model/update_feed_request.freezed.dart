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
  Map<String, Object?>? get custom;
  String? get description;
  List<String>? get filterTags;
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
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(custom),
      description,
      const DeepCollectionEquality().hash(filterTags),
      name);

  @override
  String toString() {
    return 'UpdateFeedRequest(custom: $custom, description: $description, filterTags: $filterTags, name: $name)';
  }
}

/// @nodoc
abstract mixin class $UpdateFeedRequestCopyWith<$Res> {
  factory $UpdateFeedRequestCopyWith(
          UpdateFeedRequest value, $Res Function(UpdateFeedRequest) _then) =
      _$UpdateFeedRequestCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object?>? custom,
      String? description,
      List<String>? filterTags,
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
    Object? custom = freezed,
    Object? description = freezed,
    Object? filterTags = freezed,
    Object? name = freezed,
  }) {
    return _then(UpdateFeedRequest(
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      filterTags: freezed == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
