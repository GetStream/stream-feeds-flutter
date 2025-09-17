// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_bookmark_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddBookmarkResponse {
  BookmarkResponse get bookmark;
  String get duration;

  /// Create a copy of AddBookmarkResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddBookmarkResponseCopyWith<AddBookmarkResponse> get copyWith =>
      _$AddBookmarkResponseCopyWithImpl<AddBookmarkResponse>(
          this as AddBookmarkResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddBookmarkResponse &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookmark, duration);

  @override
  String toString() {
    return 'AddBookmarkResponse(bookmark: $bookmark, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $AddBookmarkResponseCopyWith<$Res> {
  factory $AddBookmarkResponseCopyWith(
          AddBookmarkResponse value, $Res Function(AddBookmarkResponse) _then) =
      _$AddBookmarkResponseCopyWithImpl;
  @useResult
  $Res call({BookmarkResponse bookmark, String duration});
}

/// @nodoc
class _$AddBookmarkResponseCopyWithImpl<$Res>
    implements $AddBookmarkResponseCopyWith<$Res> {
  _$AddBookmarkResponseCopyWithImpl(this._self, this._then);

  final AddBookmarkResponse _self;
  final $Res Function(AddBookmarkResponse) _then;

  /// Create a copy of AddBookmarkResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = null,
    Object? duration = null,
  }) {
    return _then(AddBookmarkResponse(
      bookmark: null == bookmark
          ? _self.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as BookmarkResponse,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
