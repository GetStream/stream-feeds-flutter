// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_folder_deleted_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkFolderDeletedEvent {
  BookmarkFolderResponse get bookmarkFolder;
  DateTime get createdAt;
  Map<String, Object> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of BookmarkFolderDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkFolderDeletedEventCopyWith<BookmarkFolderDeletedEvent>
      get copyWith =>
          _$BookmarkFolderDeletedEventCopyWithImpl<BookmarkFolderDeletedEvent>(
              this as BookmarkFolderDeletedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkFolderDeletedEvent &&
            (identical(other.bookmarkFolder, bookmarkFolder) ||
                other.bookmarkFolder == bookmarkFolder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookmarkFolder, createdAt,
      const DeepCollectionEquality().hash(custom), receivedAt, type, user);

  @override
  String toString() {
    return 'BookmarkFolderDeletedEvent(bookmarkFolder: $bookmarkFolder, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $BookmarkFolderDeletedEventCopyWith<$Res> {
  factory $BookmarkFolderDeletedEventCopyWith(BookmarkFolderDeletedEvent value,
          $Res Function(BookmarkFolderDeletedEvent) _then) =
      _$BookmarkFolderDeletedEventCopyWithImpl;
  @useResult
  $Res call(
      {BookmarkFolderResponse bookmarkFolder,
      DateTime createdAt,
      Map<String, Object> custom,
      DateTime? receivedAt,
      String type,
      UserResponseCommonFields? user});
}

/// @nodoc
class _$BookmarkFolderDeletedEventCopyWithImpl<$Res>
    implements $BookmarkFolderDeletedEventCopyWith<$Res> {
  _$BookmarkFolderDeletedEventCopyWithImpl(this._self, this._then);

  final BookmarkFolderDeletedEvent _self;
  final $Res Function(BookmarkFolderDeletedEvent) _then;

  /// Create a copy of BookmarkFolderDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkFolder = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(BookmarkFolderDeletedEvent(
      bookmarkFolder: null == bookmarkFolder
          ? _self.bookmarkFolder
          : bookmarkFolder // ignore: cast_nullable_to_non_nullable
              as BookmarkFolderResponse,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
      receivedAt: freezed == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponseCommonFields?,
    ));
  }
}

// dart format on
