// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_folder_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddFolderRequest {
  Map<String, Object?>? get custom;
  String get name;

  /// Create a copy of AddFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddFolderRequestCopyWith<AddFolderRequest> get copyWith =>
      _$AddFolderRequestCopyWithImpl<AddFolderRequest>(
          this as AddFolderRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddFolderRequest &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(custom), name);

  @override
  String toString() {
    return 'AddFolderRequest(custom: $custom, name: $name)';
  }
}

/// @nodoc
abstract mixin class $AddFolderRequestCopyWith<$Res> {
  factory $AddFolderRequestCopyWith(
          AddFolderRequest value, $Res Function(AddFolderRequest) _then) =
      _$AddFolderRequestCopyWithImpl;
  @useResult
  $Res call({Map<String, Object?>? custom, String name});
}

/// @nodoc
class _$AddFolderRequestCopyWithImpl<$Res>
    implements $AddFolderRequestCopyWith<$Res> {
  _$AddFolderRequestCopyWithImpl(this._self, this._then);

  final AddFolderRequest _self;
  final $Res Function(AddFolderRequest) _then;

  /// Create a copy of AddFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custom = freezed,
    Object? name = null,
  }) {
    return _then(AddFolderRequest(
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
