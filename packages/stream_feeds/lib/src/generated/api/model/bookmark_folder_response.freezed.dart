// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_folder_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkFolderResponse {
  DateTime get createdAt;
  Map<String, Object>? get custom;
  String get id;
  String get name;
  DateTime get updatedAt;

  /// Create a copy of BookmarkFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkFolderResponseCopyWith<BookmarkFolderResponse> get copyWith =>
      _$BookmarkFolderResponseCopyWithImpl<BookmarkFolderResponse>(
          this as BookmarkFolderResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkFolderResponse &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt,
      const DeepCollectionEquality().hash(custom), id, name, updatedAt);

  @override
  String toString() {
    return 'BookmarkFolderResponse(createdAt: $createdAt, custom: $custom, id: $id, name: $name, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $BookmarkFolderResponseCopyWith<$Res> {
  factory $BookmarkFolderResponseCopyWith(BookmarkFolderResponse value,
          $Res Function(BookmarkFolderResponse) _then) =
      _$BookmarkFolderResponseCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object>? custom,
      String id,
      String name,
      DateTime updatedAt});
}

/// @nodoc
class _$BookmarkFolderResponseCopyWithImpl<$Res>
    implements $BookmarkFolderResponseCopyWith<$Res> {
  _$BookmarkFolderResponseCopyWithImpl(this._self, this._then);

  final BookmarkFolderResponse _self;
  final $Res Function(BookmarkFolderResponse) _then;

  /// Create a copy of BookmarkFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = freezed,
    Object? id = null,
    Object? name = null,
    Object? updatedAt = null,
  }) {
    return _then(BookmarkFolderResponse(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
