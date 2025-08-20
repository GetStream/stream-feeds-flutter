// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_input_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedInputData {
  String? get description;
  String? get name;
  FeedVisibility? get visibility;
  List<String> get filterTags;
  List<FeedMemberRequestData> get members;
  Map<String, Object>? get custom;

  /// Create a copy of FeedInputData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedInputDataCopyWith<FeedInputData> get copyWith =>
      _$FeedInputDataCopyWithImpl<FeedInputData>(
          this as FeedInputData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedInputData &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      name,
      visibility,
      const DeepCollectionEquality().hash(filterTags),
      const DeepCollectionEquality().hash(members),
      const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'FeedInputData(description: $description, name: $name, visibility: $visibility, filterTags: $filterTags, members: $members, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $FeedInputDataCopyWith<$Res> {
  factory $FeedInputDataCopyWith(
          FeedInputData value, $Res Function(FeedInputData) _then) =
      _$FeedInputDataCopyWithImpl;
  @useResult
  $Res call(
      {String? description,
      String? name,
      FeedVisibility? visibility,
      List<String> filterTags,
      List<FeedMemberRequestData> members,
      Map<String, Object>? custom});
}

/// @nodoc
class _$FeedInputDataCopyWithImpl<$Res>
    implements $FeedInputDataCopyWith<$Res> {
  _$FeedInputDataCopyWithImpl(this._self, this._then);

  final FeedInputData _self;
  final $Res Function(FeedInputData) _then;

  /// Create a copy of FeedInputData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? name = freezed,
    Object? visibility = freezed,
    Object? filterTags = null,
    Object? members = null,
    Object? custom = freezed,
  }) {
    return _then(FeedInputData(
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: freezed == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as FeedVisibility?,
      filterTags: null == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<FeedMemberRequestData>,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
