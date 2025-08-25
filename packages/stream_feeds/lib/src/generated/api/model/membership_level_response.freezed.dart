// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_level_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MembershipLevelResponse {
  DateTime get createdAt;
  Map<String, Object?>? get custom;
  String? get description;
  String get id;
  String get name;
  int get priority;
  List<String> get tags;
  DateTime get updatedAt;

  /// Create a copy of MembershipLevelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MembershipLevelResponseCopyWith<MembershipLevelResponse> get copyWith =>
      _$MembershipLevelResponseCopyWithImpl<MembershipLevelResponse>(
          this as MembershipLevelResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MembershipLevelResponse &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      description,
      id,
      name,
      priority,
      const DeepCollectionEquality().hash(tags),
      updatedAt);

  @override
  String toString() {
    return 'MembershipLevelResponse(createdAt: $createdAt, custom: $custom, description: $description, id: $id, name: $name, priority: $priority, tags: $tags, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $MembershipLevelResponseCopyWith<$Res> {
  factory $MembershipLevelResponseCopyWith(MembershipLevelResponse value,
          $Res Function(MembershipLevelResponse) _then) =
      _$MembershipLevelResponseCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object?>? custom,
      String? description,
      String id,
      String name,
      int priority,
      List<String> tags,
      DateTime updatedAt});
}

/// @nodoc
class _$MembershipLevelResponseCopyWithImpl<$Res>
    implements $MembershipLevelResponseCopyWith<$Res> {
  _$MembershipLevelResponseCopyWithImpl(this._self, this._then);

  final MembershipLevelResponse _self;
  final $Res Function(MembershipLevelResponse) _then;

  /// Create a copy of MembershipLevelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = freezed,
    Object? description = freezed,
    Object? id = null,
    Object? name = null,
    Object? priority = null,
    Object? tags = null,
    Object? updatedAt = null,
  }) {
    return _then(MembershipLevelResponse(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
