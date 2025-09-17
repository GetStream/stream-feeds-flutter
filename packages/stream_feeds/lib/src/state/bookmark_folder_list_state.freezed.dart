// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_folder_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkFolderListState {
  BookmarkFoldersQuery get query;
  List<BookmarkFolderData> get bookmarkFolders;
  PaginationData? get pagination;

  /// Create a copy of BookmarkFolderListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkFolderListStateCopyWith<BookmarkFolderListState> get copyWith =>
      _$BookmarkFolderListStateCopyWithImpl<BookmarkFolderListState>(
          this as BookmarkFolderListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkFolderListState &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other.bookmarkFolders, bookmarkFolders) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query,
      const DeepCollectionEquality().hash(bookmarkFolders), pagination);

  @override
  String toString() {
    return 'BookmarkFolderListState(query: $query, bookmarkFolders: $bookmarkFolders, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $BookmarkFolderListStateCopyWith<$Res> {
  factory $BookmarkFolderListStateCopyWith(BookmarkFolderListState value,
          $Res Function(BookmarkFolderListState) _then) =
      _$BookmarkFolderListStateCopyWithImpl;
  @useResult
  $Res call(
      {BookmarkFoldersQuery query,
      List<BookmarkFolderData> bookmarkFolders,
      PaginationData? pagination});
}

/// @nodoc
class _$BookmarkFolderListStateCopyWithImpl<$Res>
    implements $BookmarkFolderListStateCopyWith<$Res> {
  _$BookmarkFolderListStateCopyWithImpl(this._self, this._then);

  final BookmarkFolderListState _self;
  final $Res Function(BookmarkFolderListState) _then;

  /// Create a copy of BookmarkFolderListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? bookmarkFolders = null,
    Object? pagination = freezed,
  }) {
    return _then(BookmarkFolderListState(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as BookmarkFoldersQuery,
      bookmarkFolders: null == bookmarkFolders
          ? _self.bookmarkFolders
          : bookmarkFolders // ignore: cast_nullable_to_non_nullable
              as List<BookmarkFolderData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on
