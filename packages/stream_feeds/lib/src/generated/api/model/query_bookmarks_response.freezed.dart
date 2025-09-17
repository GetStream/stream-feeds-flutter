// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_bookmarks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryBookmarksResponse {
  List<BookmarkResponse> get bookmarks;
  String get duration;
  String? get next;
  String? get prev;

  /// Create a copy of QueryBookmarksResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryBookmarksResponseCopyWith<QueryBookmarksResponse> get copyWith =>
      _$QueryBookmarksResponseCopyWithImpl<QueryBookmarksResponse>(
          this as QueryBookmarksResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryBookmarksResponse &&
            const DeepCollectionEquality().equals(other.bookmarks, bookmarks) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(bookmarks), duration, next, prev);

  @override
  String toString() {
    return 'QueryBookmarksResponse(bookmarks: $bookmarks, duration: $duration, next: $next, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $QueryBookmarksResponseCopyWith<$Res> {
  factory $QueryBookmarksResponseCopyWith(QueryBookmarksResponse value,
          $Res Function(QueryBookmarksResponse) _then) =
      _$QueryBookmarksResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<BookmarkResponse> bookmarks,
      String duration,
      String? next,
      String? prev});
}

/// @nodoc
class _$QueryBookmarksResponseCopyWithImpl<$Res>
    implements $QueryBookmarksResponseCopyWith<$Res> {
  _$QueryBookmarksResponseCopyWithImpl(this._self, this._then);

  final QueryBookmarksResponse _self;
  final $Res Function(QueryBookmarksResponse) _then;

  /// Create a copy of QueryBookmarksResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarks = null,
    Object? duration = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(QueryBookmarksResponse(
      bookmarks: null == bookmarks
          ? _self.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<BookmarkResponse>,
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
