// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageReminder {
  Channel? get channel;
  String get channelCid;
  DateTime get createdAt;
  Message? get message;
  String get messageId;
  DateTime? get remindAt;
  String get taskId;
  DateTime get updatedAt;
  User? get user;
  String get userId;

  /// Create a copy of MessageReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageReminderCopyWith<MessageReminder> get copyWith =>
      _$MessageReminderCopyWithImpl<MessageReminder>(
          this as MessageReminder, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageReminder &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.channelCid, channelCid) ||
                other.channelCid == channelCid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.remindAt, remindAt) ||
                other.remindAt == remindAt) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, channelCid, createdAt,
      message, messageId, remindAt, taskId, updatedAt, user, userId);

  @override
  String toString() {
    return 'MessageReminder(channel: $channel, channelCid: $channelCid, createdAt: $createdAt, message: $message, messageId: $messageId, remindAt: $remindAt, taskId: $taskId, updatedAt: $updatedAt, user: $user, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $MessageReminderCopyWith<$Res> {
  factory $MessageReminderCopyWith(
          MessageReminder value, $Res Function(MessageReminder) _then) =
      _$MessageReminderCopyWithImpl;
  @useResult
  $Res call(
      {Channel? channel,
      String channelCid,
      DateTime createdAt,
      Message? message,
      String messageId,
      DateTime? remindAt,
      String taskId,
      DateTime updatedAt,
      User? user,
      String userId});
}

/// @nodoc
class _$MessageReminderCopyWithImpl<$Res>
    implements $MessageReminderCopyWith<$Res> {
  _$MessageReminderCopyWithImpl(this._self, this._then);

  final MessageReminder _self;
  final $Res Function(MessageReminder) _then;

  /// Create a copy of MessageReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? channelCid = null,
    Object? createdAt = null,
    Object? message = freezed,
    Object? messageId = null,
    Object? remindAt = freezed,
    Object? taskId = null,
    Object? updatedAt = null,
    Object? user = freezed,
    Object? userId = null,
  }) {
    return _then(MessageReminder(
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      channelCid: null == channelCid
          ? _self.channelCid
          : channelCid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
      messageId: null == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      remindAt: freezed == remindAt
          ? _self.remindAt
          : remindAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      taskId: null == taskId
          ? _self.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
