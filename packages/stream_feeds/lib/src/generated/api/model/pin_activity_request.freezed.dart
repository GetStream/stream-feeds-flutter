// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_activity_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PinActivityRequest {
  bool? get enrichOwnFields;

  /// Create a copy of PinActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PinActivityRequestCopyWith<PinActivityRequest> get copyWith => _$PinActivityRequestCopyWithImpl<PinActivityRequest>(
    this as PinActivityRequest,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PinActivityRequest &&
            (identical(other.enrichOwnFields, enrichOwnFields) || other.enrichOwnFields == enrichOwnFields));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enrichOwnFields);

  @override
  String toString() {
    return 'PinActivityRequest(enrichOwnFields: $enrichOwnFields)';
  }
}

/// @nodoc
abstract mixin class $PinActivityRequestCopyWith<$Res> {
  factory $PinActivityRequestCopyWith(
    PinActivityRequest value,
    $Res Function(PinActivityRequest) _then,
  ) = _$PinActivityRequestCopyWithImpl;
  @useResult
  $Res call({bool? enrichOwnFields});
}

/// @nodoc
class _$PinActivityRequestCopyWithImpl<$Res> implements $PinActivityRequestCopyWith<$Res> {
  _$PinActivityRequestCopyWithImpl(this._self, this._then);

  final PinActivityRequest _self;
  final $Res Function(PinActivityRequest) _then;

  /// Create a copy of PinActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? enrichOwnFields = freezed}) {
    return _then(
      PinActivityRequest(
        enrichOwnFields: freezed == enrichOwnFields
            ? _self.enrichOwnFields
            : enrichOwnFields // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}
