// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_auth_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WSAuthMessage {
  List<String>? get products;
  String get token;

  /// Create a copy of WSAuthMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WSAuthMessageCopyWith<WSAuthMessage> get copyWith =>
      _$WSAuthMessageCopyWithImpl<WSAuthMessage>(
          this as WSAuthMessage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WSAuthMessage &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(products), token);

  @override
  String toString() {
    return 'WSAuthMessage(products: $products, token: $token)';
  }
}

/// @nodoc
abstract mixin class $WSAuthMessageCopyWith<$Res> {
  factory $WSAuthMessageCopyWith(
          WSAuthMessage value, $Res Function(WSAuthMessage) _then) =
      _$WSAuthMessageCopyWithImpl;
  @useResult
  $Res call({List<String>? products, String token});
}

/// @nodoc
class _$WSAuthMessageCopyWithImpl<$Res>
    implements $WSAuthMessageCopyWith<$Res> {
  _$WSAuthMessageCopyWithImpl(this._self, this._then);

  final WSAuthMessage _self;
  final $Res Function(WSAuthMessage) _then;

  /// Create a copy of WSAuthMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? token = null,
  }) {
    return _then(WSAuthMessage(
      products: freezed == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
