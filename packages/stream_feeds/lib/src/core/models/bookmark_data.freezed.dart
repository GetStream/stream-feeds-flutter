// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkData {
  ActivityData get activity;
  DateTime get createdAt;
  BookmarkFolderData? get folder;
  DateTime get updatedAt;
  UserData get user;
  Map<String, Object>? get custom;

  /// Create a copy of BookmarkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkDataCopyWith<BookmarkData> get copyWith =>
      _$BookmarkDataCopyWithImpl<BookmarkData>(
          this as BookmarkData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkData &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, createdAt, folder,
      updatedAt, user, const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'BookmarkData(activity: $activity, createdAt: $createdAt, folder: $folder, updatedAt: $updatedAt, user: $user, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $BookmarkDataCopyWith<$Res> {
  factory $BookmarkDataCopyWith(
          BookmarkData value, $Res Function(BookmarkData) _then) =
      _$BookmarkDataCopyWithImpl;
  @useResult
  $Res call(
      {ActivityData activity,
      DateTime createdAt,
      BookmarkFolderData? folder,
      DateTime updatedAt,
      UserData user,
      Map<String, Object>? custom});
}

/// @nodoc
class _$BookmarkDataCopyWithImpl<$Res> implements $BookmarkDataCopyWith<$Res> {
  _$BookmarkDataCopyWithImpl(this._self, this._then);

  final BookmarkData _self;
  final $Res Function(BookmarkData) _then;

  /// Create a copy of BookmarkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? folder = freezed,
    Object? updatedAt = null,
    Object? user = null,
    Object? custom = freezed,
  }) {
    return _then(BookmarkData(
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityData,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      folder: freezed == folder
          ? _self.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as BookmarkFolderData?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
