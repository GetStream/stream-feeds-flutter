// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedInput {
  Map<String, Object>? get custom;
  String? get description;
  List<String>? get filterTags;
  List<FeedMemberRequest>? get members;
  String? get name;
  FeedInputVisibility? get visibility;

  /// Create a copy of FeedInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedInputCopyWith<FeedInput> get copyWith =>
      _$FeedInputCopyWithImpl<FeedInput>(this as FeedInput, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedInput &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(custom),
      description,
      const DeepCollectionEquality().hash(filterTags),
      const DeepCollectionEquality().hash(members),
      name,
      visibility);

  @override
  String toString() {
    return 'FeedInput(custom: $custom, description: $description, filterTags: $filterTags, members: $members, name: $name, visibility: $visibility)';
  }
}

/// @nodoc
abstract mixin class $FeedInputCopyWith<$Res> {
  factory $FeedInputCopyWith(FeedInput value, $Res Function(FeedInput) _then) =
      _$FeedInputCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object>? custom,
      String? description,
      List<String>? filterTags,
      List<FeedMemberRequest>? members,
      String? name,
      FeedInputVisibility? visibility});
}

/// @nodoc
class _$FeedInputCopyWithImpl<$Res> implements $FeedInputCopyWith<$Res> {
  _$FeedInputCopyWithImpl(this._self, this._then);

  final FeedInput _self;
  final $Res Function(FeedInput) _then;

  /// Create a copy of FeedInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custom = freezed,
    Object? description = freezed,
    Object? filterTags = freezed,
    Object? members = freezed,
    Object? name = freezed,
    Object? visibility = freezed,
  }) {
    return _then(FeedInput(
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      filterTags: freezed == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      members: freezed == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<FeedMemberRequest>?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: freezed == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as FeedInputVisibility?,
    ));
  }
}

// dart format on
