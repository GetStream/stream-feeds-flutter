// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_bookmark_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateBookmarkRequest {
  Map<String, Object>? get custom;
  String? get folderId;
  AddFolderRequest? get newFolder;
  String? get newFolderId;

  /// Create a copy of UpdateBookmarkRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateBookmarkRequestCopyWith<UpdateBookmarkRequest> get copyWith =>
      _$UpdateBookmarkRequestCopyWithImpl<UpdateBookmarkRequest>(
          this as UpdateBookmarkRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateBookmarkRequest &&
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
    return 'UpdateBookmarkRequest(custom: $custom, folderId: $folderId, newFolder: $newFolder, newFolderId: $newFolderId)';
  }
}

/// @nodoc
abstract mixin class $UpdateBookmarkRequestCopyWith<$Res> {
  factory $UpdateBookmarkRequestCopyWith(UpdateBookmarkRequest value,
          $Res Function(UpdateBookmarkRequest) _then) =
      _$UpdateBookmarkRequestCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object>? custom,
      String? folderId,
      AddFolderRequest? newFolder,
      String? newFolderId});
}

/// @nodoc
class _$UpdateBookmarkRequestCopyWithImpl<$Res>
    implements $UpdateBookmarkRequestCopyWith<$Res> {
  _$UpdateBookmarkRequestCopyWithImpl(this._self, this._then);

  final UpdateBookmarkRequest _self;
  final $Res Function(UpdateBookmarkRequest) _then;

  /// Create a copy of UpdateBookmarkRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custom = freezed,
    Object? folderId = freezed,
    Object? newFolder = freezed,
    Object? newFolderId = freezed,
  }) {
    return _then(UpdateBookmarkRequest(
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
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
