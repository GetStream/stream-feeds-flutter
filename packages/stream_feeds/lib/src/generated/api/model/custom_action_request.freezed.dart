// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_action_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomActionRequest {
  String? get id;
  Map<String, Object>? get options;

  /// Create a copy of CustomActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomActionRequestCopyWith<CustomActionRequest> get copyWith =>
      _$CustomActionRequestCopyWithImpl<CustomActionRequest>(
          this as CustomActionRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomActionRequest &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.options, options));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(options));

  @override
  String toString() {
    return 'CustomActionRequest(id: $id, options: $options)';
  }
}

/// @nodoc
abstract mixin class $CustomActionRequestCopyWith<$Res> {
  factory $CustomActionRequestCopyWith(
          CustomActionRequest value, $Res Function(CustomActionRequest) _then) =
      _$CustomActionRequestCopyWithImpl;
  @useResult
  $Res call({String? id, Map<String, Object>? options});
}

/// @nodoc
class _$CustomActionRequestCopyWithImpl<$Res>
    implements $CustomActionRequestCopyWith<$Res> {
  _$CustomActionRequestCopyWithImpl(this._self, this._then);

  final CustomActionRequest _self;
  final $Res Function(CustomActionRequest) _then;

  /// Create a copy of CustomActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? options = freezed,
  }) {
    return _then(CustomActionRequest(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
