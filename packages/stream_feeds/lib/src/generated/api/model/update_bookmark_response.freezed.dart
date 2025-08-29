// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_bookmark_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateBookmarkResponse {
  BookmarkResponse get bookmark;
  String get duration;

  /// Create a copy of UpdateBookmarkResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateBookmarkResponseCopyWith<UpdateBookmarkResponse> get copyWith =>
      _$UpdateBookmarkResponseCopyWithImpl<UpdateBookmarkResponse>(
          this as UpdateBookmarkResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateBookmarkResponse &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookmark, duration);

  @override
  String toString() {
    return 'UpdateBookmarkResponse(bookmark: $bookmark, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $UpdateBookmarkResponseCopyWith<$Res> {
  factory $UpdateBookmarkResponseCopyWith(UpdateBookmarkResponse value,
          $Res Function(UpdateBookmarkResponse) _then) =
      _$UpdateBookmarkResponseCopyWithImpl;
  @useResult
  $Res call({BookmarkResponse bookmark, String duration});
}

/// @nodoc
class _$UpdateBookmarkResponseCopyWithImpl<$Res>
    implements $UpdateBookmarkResponseCopyWith<$Res> {
  _$UpdateBookmarkResponseCopyWithImpl(this._self, this._then);

  final UpdateBookmarkResponse _self;
  final $Res Function(UpdateBookmarkResponse) _then;

  /// Create a copy of UpdateBookmarkResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = null,
    Object? duration = null,
  }) {
    return _then(UpdateBookmarkResponse(
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
