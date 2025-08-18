// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkResponse {
  ActivityResponse get activity;
  DateTime get createdAt;
  Map<String, Object>? get custom;
  BookmarkFolderResponse? get folder;
  DateTime get updatedAt;
  UserResponse get user;

  /// Create a copy of BookmarkResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkResponseCopyWith<BookmarkResponse> get copyWith =>
      _$BookmarkResponseCopyWithImpl<BookmarkResponse>(
          this as BookmarkResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkResponse &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, createdAt,
      const DeepCollectionEquality().hash(custom), folder, updatedAt, user);

  @override
  String toString() {
    return 'BookmarkResponse(activity: $activity, createdAt: $createdAt, custom: $custom, folder: $folder, updatedAt: $updatedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $BookmarkResponseCopyWith<$Res> {
  factory $BookmarkResponseCopyWith(
          BookmarkResponse value, $Res Function(BookmarkResponse) _then) =
      _$BookmarkResponseCopyWithImpl;
  @useResult
  $Res call(
      {ActivityResponse activity,
      DateTime createdAt,
      Map<String, Object>? custom,
      BookmarkFolderResponse? folder,
      DateTime updatedAt,
      UserResponse user});
}

/// @nodoc
class _$BookmarkResponseCopyWithImpl<$Res>
    implements $BookmarkResponseCopyWith<$Res> {
  _$BookmarkResponseCopyWithImpl(this._self, this._then);

  final BookmarkResponse _self;
  final $Res Function(BookmarkResponse) _then;

  /// Create a copy of BookmarkResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? custom = freezed,
    Object? folder = freezed,
    Object? updatedAt = null,
    Object? user = null,
  }) {
    return _then(BookmarkResponse(
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityResponse,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      folder: freezed == folder
          ? _self.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as BookmarkFolderResponse?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse,
    ));
  }
}

// dart format on
