// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_folder_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkFolderData {
  DateTime get createdAt;
  String get id;
  String get name;
  UserData get user;
  DateTime get updatedAt;
  Map<String, Object?>? get custom;

  /// Create a copy of BookmarkFolderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkFolderDataCopyWith<BookmarkFolderData> get copyWith =>
      _$BookmarkFolderDataCopyWithImpl<BookmarkFolderData>(
          this as BookmarkFolderData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkFolderData &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, id, name, user,
      updatedAt, const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'BookmarkFolderData(createdAt: $createdAt, id: $id, name: $name, user: $user, updatedAt: $updatedAt, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $BookmarkFolderDataCopyWith<$Res> {
  factory $BookmarkFolderDataCopyWith(
          BookmarkFolderData value, $Res Function(BookmarkFolderData) _then) =
      _$BookmarkFolderDataCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      String id,
      String name,
      UserData user,
      DateTime updatedAt,
      Map<String, Object?>? custom});
}

/// @nodoc
class _$BookmarkFolderDataCopyWithImpl<$Res>
    implements $BookmarkFolderDataCopyWith<$Res> {
  _$BookmarkFolderDataCopyWithImpl(this._self, this._then);

  final BookmarkFolderData _self;
  final $Res Function(BookmarkFolderData) _then;

  /// Create a copy of BookmarkFolderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? name = null,
    Object? user = null,
    Object? updatedAt = null,
    Object? custom = freezed,
  }) {
    return _then(BookmarkFolderData(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

// dart format on
