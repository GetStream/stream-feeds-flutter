// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkListState {
  List<BookmarkData> get bookmarks;
  PaginationData? get pagination;

  /// Create a copy of BookmarkListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkListStateCopyWith<BookmarkListState> get copyWith =>
      _$BookmarkListStateCopyWithImpl<BookmarkListState>(
          this as BookmarkListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkListState &&
            const DeepCollectionEquality().equals(other.bookmarks, bookmarks) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(bookmarks), pagination);

  @override
  String toString() {
    return 'BookmarkListState(bookmarks: $bookmarks, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $BookmarkListStateCopyWith<$Res> {
  factory $BookmarkListStateCopyWith(
          BookmarkListState value, $Res Function(BookmarkListState) _then) =
      _$BookmarkListStateCopyWithImpl;
  @useResult
  $Res call({List<BookmarkData> bookmarks, PaginationData? pagination});
}

/// @nodoc
class _$BookmarkListStateCopyWithImpl<$Res>
    implements $BookmarkListStateCopyWith<$Res> {
  _$BookmarkListStateCopyWithImpl(this._self, this._then);

  final BookmarkListState _self;
  final $Res Function(BookmarkListState) _then;

  /// Create a copy of BookmarkListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarks = null,
    Object? pagination = freezed,
  }) {
    return _then(BookmarkListState(
      bookmarks: null == bookmarks
          ? _self.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<BookmarkData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on
