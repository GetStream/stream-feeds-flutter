// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_message_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteMessageRequest {
  bool? get hardDelete;

  /// Create a copy of DeleteMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteMessageRequestCopyWith<DeleteMessageRequest> get copyWith =>
      _$DeleteMessageRequestCopyWithImpl<DeleteMessageRequest>(
          this as DeleteMessageRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteMessageRequest &&
            (identical(other.hardDelete, hardDelete) ||
                other.hardDelete == hardDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hardDelete);

  @override
  String toString() {
    return 'DeleteMessageRequest(hardDelete: $hardDelete)';
  }
}

/// @nodoc
abstract mixin class $DeleteMessageRequestCopyWith<$Res> {
  factory $DeleteMessageRequestCopyWith(DeleteMessageRequest value,
          $Res Function(DeleteMessageRequest) _then) =
      _$DeleteMessageRequestCopyWithImpl;
  @useResult
  $Res call({bool? hardDelete});
}

/// @nodoc
class _$DeleteMessageRequestCopyWithImpl<$Res>
    implements $DeleteMessageRequestCopyWith<$Res> {
  _$DeleteMessageRequestCopyWithImpl(this._self, this._then);

  final DeleteMessageRequest _self;
  final $Res Function(DeleteMessageRequest) _then;

  /// Create a copy of DeleteMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hardDelete = freezed,
  }) {
    return _then(DeleteMessageRequest(
      hardDelete: freezed == hardDelete
          ? _self.hardDelete
          : hardDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
