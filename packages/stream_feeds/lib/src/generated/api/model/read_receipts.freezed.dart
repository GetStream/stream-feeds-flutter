// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read_receipts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadReceipts {
  bool get enabled;

  /// Create a copy of ReadReceipts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReadReceiptsCopyWith<ReadReceipts> get copyWith =>
      _$ReadReceiptsCopyWithImpl<ReadReceipts>(
          this as ReadReceipts, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReadReceipts &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'ReadReceipts(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ReadReceiptsCopyWith<$Res> {
  factory $ReadReceiptsCopyWith(
          ReadReceipts value, $Res Function(ReadReceipts) _then) =
      _$ReadReceiptsCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ReadReceiptsCopyWithImpl<$Res> implements $ReadReceiptsCopyWith<$Res> {
  _$ReadReceiptsCopyWithImpl(this._self, this._then);

  final ReadReceipts _self;
  final $Res Function(ReadReceipts) _then;

  /// Create a copy of ReadReceipts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ReadReceipts(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
