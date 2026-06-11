// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_comment_bookmark_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCommentBookmarkRequest {
  Map<String, Object?>? get custom;
  String? get folderId;
  AddFolderRequest? get newFolder;
  String? get newFolderId;

  /// Create a copy of UpdateCommentBookmarkRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCommentBookmarkRequestCopyWith<UpdateCommentBookmarkRequest>
      get copyWith => _$UpdateCommentBookmarkRequestCopyWithImpl<
              UpdateCommentBookmarkRequest>(
          this as UpdateCommentBookmarkRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCommentBookmarkRequest &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.newFolder, newFolder) ||
                other.newFolder == newFolder) &&
            (identical(other.newFolderId, newFolderId) ||
                other.newFolderId == newFolderId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(custom),
      folderId,
      newFolder,
      newFolderId);

  @override
  String toString() {
    return 'UpdateCommentBookmarkRequest(custom: $custom, folderId: $folderId, newFolder: $newFolder, newFolderId: $newFolderId)';
  }
}

/// @nodoc
abstract mixin class $UpdateCommentBookmarkRequestCopyWith<$Res> {
  factory $UpdateCommentBookmarkRequestCopyWith(
          UpdateCommentBookmarkRequest value,
          $Res Function(UpdateCommentBookmarkRequest) _then) =
      _$UpdateCommentBookmarkRequestCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object?>? custom,
      String? folderId,
      AddFolderRequest? newFolder,
      String? newFolderId});
}

/// @nodoc
class _$UpdateCommentBookmarkRequestCopyWithImpl<$Res>
    implements $UpdateCommentBookmarkRequestCopyWith<$Res> {
  _$UpdateCommentBookmarkRequestCopyWithImpl(this._self, this._then);

  final UpdateCommentBookmarkRequest _self;
  final $Res Function(UpdateCommentBookmarkRequest) _then;

  /// Create a copy of UpdateCommentBookmarkRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custom = freezed,
    Object? folderId = freezed,
    Object? newFolder = freezed,
    Object? newFolderId = freezed,
  }) {
    return _then(UpdateCommentBookmarkRequest(
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      folderId: freezed == folderId
          ? _self.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String?,
      newFolder: freezed == newFolder
          ? _self.newFolder
          : newFolder // ignore: cast_nullable_to_non_nullable
              as AddFolderRequest?,
      newFolderId: freezed == newFolderId
          ? _self.newFolderId
          : newFolderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
