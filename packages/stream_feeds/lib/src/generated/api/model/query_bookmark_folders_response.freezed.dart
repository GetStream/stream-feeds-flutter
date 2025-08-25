// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_bookmark_folders_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryBookmarkFoldersResponse {
  List<BookmarkFolderResponse> get bookmarkFolders;
  String get duration;
  String? get next;
  String? get prev;

  /// Create a copy of QueryBookmarkFoldersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryBookmarkFoldersResponseCopyWith<QueryBookmarkFoldersResponse>
      get copyWith => _$QueryBookmarkFoldersResponseCopyWithImpl<
              QueryBookmarkFoldersResponse>(
          this as QueryBookmarkFoldersResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryBookmarkFoldersResponse &&
            const DeepCollectionEquality()
                .equals(other.bookmarkFolders, bookmarkFolders) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bookmarkFolders),
      duration,
      next,
      prev);

  @override
  String toString() {
    return 'QueryBookmarkFoldersResponse(bookmarkFolders: $bookmarkFolders, duration: $duration, next: $next, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $QueryBookmarkFoldersResponseCopyWith<$Res> {
  factory $QueryBookmarkFoldersResponseCopyWith(
          QueryBookmarkFoldersResponse value,
          $Res Function(QueryBookmarkFoldersResponse) _then) =
      _$QueryBookmarkFoldersResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<BookmarkFolderResponse> bookmarkFolders,
      String duration,
      String? next,
      String? prev});
}

/// @nodoc
class _$QueryBookmarkFoldersResponseCopyWithImpl<$Res>
    implements $QueryBookmarkFoldersResponseCopyWith<$Res> {
  _$QueryBookmarkFoldersResponseCopyWithImpl(this._self, this._then);

  final QueryBookmarkFoldersResponse _self;
  final $Res Function(QueryBookmarkFoldersResponse) _then;

  /// Create a copy of QueryBookmarkFoldersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkFolders = null,
    Object? duration = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(QueryBookmarkFoldersResponse(
      bookmarkFolders: null == bookmarkFolders
          ? _self.bookmarkFolders
          : bookmarkFolders // ignore: cast_nullable_to_non_nullable
              as List<BookmarkFolderResponse>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
