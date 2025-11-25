// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationTarget {
  List<Attachment>? get attachments;
  NotificationComment? get comment;
  String get id;
  String? get name;
  String? get text;
  String? get type;
  String? get userId;

  /// Create a copy of NotificationTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationTargetCopyWith<NotificationTarget> get copyWith =>
      _$NotificationTargetCopyWithImpl<NotificationTarget>(
          this as NotificationTarget, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationTarget &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(attachments),
      comment,
      id,
      name,
      text,
      type,
      userId);

  @override
  String toString() {
    return 'NotificationTarget(attachments: $attachments, comment: $comment, id: $id, name: $name, text: $text, type: $type, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $NotificationTargetCopyWith<$Res> {
  factory $NotificationTargetCopyWith(
          NotificationTarget value, $Res Function(NotificationTarget) _then) =
      _$NotificationTargetCopyWithImpl;
  @useResult
  $Res call(
      {List<Attachment>? attachments,
      NotificationComment? comment,
      String id,
      String? name,
      String? text,
      String? type,
      String? userId});
}

/// @nodoc
class _$NotificationTargetCopyWithImpl<$Res>
    implements $NotificationTargetCopyWith<$Res> {
  _$NotificationTargetCopyWithImpl(this._self, this._then);

  final NotificationTarget _self;
  final $Res Function(NotificationTarget) _then;

  /// Create a copy of NotificationTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = freezed,
    Object? comment = freezed,
    Object? id = null,
    Object? name = freezed,
    Object? text = freezed,
    Object? type = freezed,
    Object? userId = freezed,
  }) {
    return _then(NotificationTarget(
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as NotificationComment?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
