// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_bookmark_folder_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateBookmarkFolderResponse {
  BookmarkFolderResponse get bookmarkFolder;
  String get duration;

  /// Create a copy of UpdateBookmarkFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateBookmarkFolderResponseCopyWith<UpdateBookmarkFolderResponse>
      get copyWith => _$UpdateBookmarkFolderResponseCopyWithImpl<
              UpdateBookmarkFolderResponse>(
          this as UpdateBookmarkFolderResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateBookmarkFolderResponse &&
            (identical(other.bookmarkFolder, bookmarkFolder) ||
                other.bookmarkFolder == bookmarkFolder) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookmarkFolder, duration);

  @override
  String toString() {
    return 'UpdateBookmarkFolderResponse(bookmarkFolder: $bookmarkFolder, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $UpdateBookmarkFolderResponseCopyWith<$Res> {
  factory $UpdateBookmarkFolderResponseCopyWith(
          UpdateBookmarkFolderResponse value,
          $Res Function(UpdateBookmarkFolderResponse) _then) =
      _$UpdateBookmarkFolderResponseCopyWithImpl;
  @useResult
  $Res call({BookmarkFolderResponse bookmarkFolder, String duration});
}

/// @nodoc
class _$UpdateBookmarkFolderResponseCopyWithImpl<$Res>
    implements $UpdateBookmarkFolderResponseCopyWith<$Res> {
  _$UpdateBookmarkFolderResponseCopyWithImpl(this._self, this._then);

  final UpdateBookmarkFolderResponse _self;
  final $Res Function(UpdateBookmarkFolderResponse) _then;

  /// Create a copy of UpdateBookmarkFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkFolder = null,
    Object? duration = null,
  }) {
    return _then(UpdateBookmarkFolderResponse(
      bookmarkFolder: null == bookmarkFolder
          ? _self.bookmarkFolder
          : bookmarkFolder // ignore: cast_nullable_to_non_nullable
              as BookmarkFolderResponse,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
