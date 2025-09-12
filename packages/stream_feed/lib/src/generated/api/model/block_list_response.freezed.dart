// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlockListResponse {
  DateTime? get createdAt;
  String? get id;
  String get name;
  String? get team;
  String get type;
  DateTime? get updatedAt;
  List<String> get words;

  /// Create a copy of BlockListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockListResponseCopyWith<BlockListResponse> get copyWith =>
      _$BlockListResponseCopyWithImpl<BlockListResponse>(
          this as BlockListResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockListResponse &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.words, words));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, id, name, team, type,
      updatedAt, const DeepCollectionEquality().hash(words));

  @override
  String toString() {
    return 'BlockListResponse(createdAt: $createdAt, id: $id, name: $name, team: $team, type: $type, updatedAt: $updatedAt, words: $words)';
  }
}

/// @nodoc
abstract mixin class $BlockListResponseCopyWith<$Res> {
  factory $BlockListResponseCopyWith(
          BlockListResponse value, $Res Function(BlockListResponse) _then) =
      _$BlockListResponseCopyWithImpl;
  @useResult
  $Res call(
      {DateTime? createdAt,
      String? id,
      String name,
      String? team,
      String type,
      DateTime? updatedAt,
      List<String> words});
}

/// @nodoc
class _$BlockListResponseCopyWithImpl<$Res>
    implements $BlockListResponseCopyWith<$Res> {
  _$BlockListResponseCopyWithImpl(this._self, this._then);

  final BlockListResponse _self;
  final $Res Function(BlockListResponse) _then;

  /// Create a copy of BlockListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? name = null,
    Object? team = freezed,
    Object? type = null,
    Object? updatedAt = freezed,
    Object? words = null,
  }) {
    return _then(BlockListResponse(
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      team: freezed == team
          ? _self.team
          : team // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      words: null == words
          ? _self.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
