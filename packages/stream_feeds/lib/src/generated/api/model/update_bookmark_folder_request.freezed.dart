// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_bookmark_folder_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateBookmarkFolderRequest {
  Map<String, Object>? get custom;
  String? get name;

  /// Create a copy of UpdateBookmarkFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateBookmarkFolderRequestCopyWith<UpdateBookmarkFolderRequest>
      get copyWith => _$UpdateBookmarkFolderRequestCopyWithImpl<
              UpdateBookmarkFolderRequest>(
          this as UpdateBookmarkFolderRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateBookmarkFolderRequest &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(custom), name);

  @override
  String toString() {
    return 'UpdateBookmarkFolderRequest(custom: $custom, name: $name)';
  }
}

/// @nodoc
abstract mixin class $UpdateBookmarkFolderRequestCopyWith<$Res> {
  factory $UpdateBookmarkFolderRequestCopyWith(
          UpdateBookmarkFolderRequest value,
          $Res Function(UpdateBookmarkFolderRequest) _then) =
      _$UpdateBookmarkFolderRequestCopyWithImpl;
  @useResult
  $Res call({Map<String, Object>? custom, String? name});
}

/// @nodoc
class _$UpdateBookmarkFolderRequestCopyWithImpl<$Res>
    implements $UpdateBookmarkFolderRequestCopyWith<$Res> {
  _$UpdateBookmarkFolderRequestCopyWithImpl(this._self, this._then);

  final UpdateBookmarkFolderRequest _self;
  final $Res Function(UpdateBookmarkFolderRequest) _then;

  /// Create a copy of UpdateBookmarkFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custom = freezed,
    Object? name = freezed,
  }) {
    return _then(UpdateBookmarkFolderRequest(
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
