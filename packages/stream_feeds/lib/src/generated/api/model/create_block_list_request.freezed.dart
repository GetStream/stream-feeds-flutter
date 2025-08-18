// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_block_list_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateBlockListRequest {
  String get name;
  String? get team;
  CreateBlockListRequestType? get type;
  List<String> get words;

  /// Create a copy of CreateBlockListRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateBlockListRequestCopyWith<CreateBlockListRequest> get copyWith =>
      _$CreateBlockListRequestCopyWithImpl<CreateBlockListRequest>(
          this as CreateBlockListRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateBlockListRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.words, words));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, team, type,
      const DeepCollectionEquality().hash(words));

  @override
  String toString() {
    return 'CreateBlockListRequest(name: $name, team: $team, type: $type, words: $words)';
  }
}

/// @nodoc
abstract mixin class $CreateBlockListRequestCopyWith<$Res> {
  factory $CreateBlockListRequestCopyWith(CreateBlockListRequest value,
          $Res Function(CreateBlockListRequest) _then) =
      _$CreateBlockListRequestCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String? team,
      CreateBlockListRequestType? type,
      List<String> words});
}

/// @nodoc
class _$CreateBlockListRequestCopyWithImpl<$Res>
    implements $CreateBlockListRequestCopyWith<$Res> {
  _$CreateBlockListRequestCopyWithImpl(this._self, this._then);

  final CreateBlockListRequest _self;
  final $Res Function(CreateBlockListRequest) _then;

  /// Create a copy of CreateBlockListRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? team = freezed,
    Object? type = freezed,
    Object? words = null,
  }) {
    return _then(CreateBlockListRequest(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      team: freezed == team
          ? _self.team
          : team // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as CreateBlockListRequestType?,
      words: null == words
          ? _self.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
