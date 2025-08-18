// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_deleted_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkDeletedEvent {
  BookmarkResponse get bookmark;
  DateTime get createdAt;
  Map<String, Object> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of BookmarkDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkDeletedEventCopyWith<BookmarkDeletedEvent> get copyWith =>
      _$BookmarkDeletedEventCopyWithImpl<BookmarkDeletedEvent>(
          this as BookmarkDeletedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkDeletedEvent &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookmark, createdAt,
      const DeepCollectionEquality().hash(custom), receivedAt, type, user);

  @override
  String toString() {
    return 'BookmarkDeletedEvent(bookmark: $bookmark, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $BookmarkDeletedEventCopyWith<$Res> {
  factory $BookmarkDeletedEventCopyWith(BookmarkDeletedEvent value,
          $Res Function(BookmarkDeletedEvent) _then) =
      _$BookmarkDeletedEventCopyWithImpl;
  @useResult
  $Res call(
      {BookmarkResponse bookmark,
      DateTime createdAt,
      Map<String, Object> custom,
      DateTime? receivedAt,
      String type,
      UserResponseCommonFields? user});
}

/// @nodoc
class _$BookmarkDeletedEventCopyWithImpl<$Res>
    implements $BookmarkDeletedEventCopyWith<$Res> {
  _$BookmarkDeletedEventCopyWithImpl(this._self, this._then);

  final BookmarkDeletedEvent _self;
  final $Res Function(BookmarkDeletedEvent) _then;

  /// Create a copy of BookmarkDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(BookmarkDeletedEvent(
      bookmark: null == bookmark
          ? _self.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as BookmarkResponse,
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
