// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteUserRequest {
  bool? get deleteConversationChannels;
  bool? get deleteFeedsContent;
  bool? get hardDelete;
  bool? get markMessagesDeleted;

  /// Create a copy of DeleteUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteUserRequestCopyWith<DeleteUserRequest> get copyWith =>
      _$DeleteUserRequestCopyWithImpl<DeleteUserRequest>(
          this as DeleteUserRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteUserRequest &&
            (identical(other.deleteConversationChannels,
                    deleteConversationChannels) ||
                other.deleteConversationChannels ==
                    deleteConversationChannels) &&
            (identical(other.deleteFeedsContent, deleteFeedsContent) ||
                other.deleteFeedsContent == deleteFeedsContent) &&
            (identical(other.hardDelete, hardDelete) ||
                other.hardDelete == hardDelete) &&
            (identical(other.markMessagesDeleted, markMessagesDeleted) ||
                other.markMessagesDeleted == markMessagesDeleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deleteConversationChannels,
      deleteFeedsContent, hardDelete, markMessagesDeleted);

  @override
  String toString() {
    return 'DeleteUserRequest(deleteConversationChannels: $deleteConversationChannels, deleteFeedsContent: $deleteFeedsContent, hardDelete: $hardDelete, markMessagesDeleted: $markMessagesDeleted)';
  }
}

/// @nodoc
abstract mixin class $DeleteUserRequestCopyWith<$Res> {
  factory $DeleteUserRequestCopyWith(
          DeleteUserRequest value, $Res Function(DeleteUserRequest) _then) =
      _$DeleteUserRequestCopyWithImpl;
  @useResult
  $Res call(
      {bool? deleteConversationChannels,
      bool? deleteFeedsContent,
      bool? hardDelete,
      bool? markMessagesDeleted});
}

/// @nodoc
class _$DeleteUserRequestCopyWithImpl<$Res>
    implements $DeleteUserRequestCopyWith<$Res> {
  _$DeleteUserRequestCopyWithImpl(this._self, this._then);

  final DeleteUserRequest _self;
  final $Res Function(DeleteUserRequest) _then;

  /// Create a copy of DeleteUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleteConversationChannels = freezed,
    Object? deleteFeedsContent = freezed,
    Object? hardDelete = freezed,
    Object? markMessagesDeleted = freezed,
  }) {
    return _then(DeleteUserRequest(
      deleteConversationChannels: freezed == deleteConversationChannels
          ? _self.deleteConversationChannels
          : deleteConversationChannels // ignore: cast_nullable_to_non_nullable
              as bool?,
      deleteFeedsContent: freezed == deleteFeedsContent
          ? _self.deleteFeedsContent
          : deleteFeedsContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      hardDelete: freezed == hardDelete
          ? _self.hardDelete
          : hardDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      markMessagesDeleted: freezed == markMessagesDeleted
          ? _self.markMessagesDeleted
          : markMessagesDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
