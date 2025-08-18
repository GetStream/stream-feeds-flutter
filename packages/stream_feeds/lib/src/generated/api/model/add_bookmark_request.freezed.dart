// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_bookmark_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddBookmarkRequest {
  Map<String, Object>? get custom;
  String? get folderId;
  AddFolderRequest? get newFolder;

  /// Create a copy of AddBookmarkRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddBookmarkRequestCopyWith<AddBookmarkRequest> get copyWith =>
      _$AddBookmarkRequestCopyWithImpl<AddBookmarkRequest>(
          this as AddBookmarkRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddBookmarkRequest &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.newFolder, newFolder) ||
                other.newFolder == newFolder));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(custom), folderId, newFolder);

  @override
  String toString() {
    return 'AddBookmarkRequest(custom: $custom, folderId: $folderId, newFolder: $newFolder)';
  }
}

/// @nodoc
abstract mixin class $AddBookmarkRequestCopyWith<$Res> {
  factory $AddBookmarkRequestCopyWith(
          AddBookmarkRequest value, $Res Function(AddBookmarkRequest) _then) =
      _$AddBookmarkRequestCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object>? custom,
      String? folderId,
      AddFolderRequest? newFolder});
}

/// @nodoc
class _$AddBookmarkRequestCopyWithImpl<$Res>
    implements $AddBookmarkRequestCopyWith<$Res> {
  _$AddBookmarkRequestCopyWithImpl(this._self, this._then);

  final AddBookmarkRequest _self;
  final $Res Function(AddBookmarkRequest) _then;

  /// Create a copy of AddBookmarkRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custom = freezed,
    Object? folderId = freezed,
    Object? newFolder = freezed,
  }) {
    return _then(AddBookmarkRequest(
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
    ));
  }
}

// dart format on
