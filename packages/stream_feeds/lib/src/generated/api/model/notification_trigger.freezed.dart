// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_trigger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationTrigger {
  String get text;
  String get type;

  /// Create a copy of NotificationTrigger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationTriggerCopyWith<NotificationTrigger> get copyWith =>
      _$NotificationTriggerCopyWithImpl<NotificationTrigger>(
          this as NotificationTrigger, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationTrigger &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  @override
  String toString() {
    return 'NotificationTrigger(text: $text, type: $type)';
  }
}

/// @nodoc
abstract mixin class $NotificationTriggerCopyWith<$Res> {
  factory $NotificationTriggerCopyWith(
          NotificationTrigger value, $Res Function(NotificationTrigger) _then) =
      _$NotificationTriggerCopyWithImpl;
  @useResult
  $Res call({String text, String type});
}

/// @nodoc
class _$NotificationTriggerCopyWithImpl<$Res>
    implements $NotificationTriggerCopyWith<$Res> {
  _$NotificationTriggerCopyWithImpl(this._self, this._then);

  final NotificationTrigger _self;
  final $Res Function(NotificationTrigger) _then;

  /// Create a copy of NotificationTrigger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(NotificationTrigger(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
