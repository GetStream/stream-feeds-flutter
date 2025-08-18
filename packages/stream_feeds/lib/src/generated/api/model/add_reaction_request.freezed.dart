// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_reaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddReactionRequest {
  bool? get createNotificationActivity;
  Map<String, Object>? get custom;
  String get type;

  /// Create a copy of AddReactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddReactionRequestCopyWith<AddReactionRequest> get copyWith =>
      _$AddReactionRequestCopyWithImpl<AddReactionRequest>(
          this as AddReactionRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddReactionRequest &&
            (identical(other.createNotificationActivity,
                    createNotificationActivity) ||
                other.createNotificationActivity ==
                    createNotificationActivity) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createNotificationActivity,
      const DeepCollectionEquality().hash(custom), type);

  @override
  String toString() {
    return 'AddReactionRequest(createNotificationActivity: $createNotificationActivity, custom: $custom, type: $type)';
  }
}

/// @nodoc
abstract mixin class $AddReactionRequestCopyWith<$Res> {
  factory $AddReactionRequestCopyWith(
          AddReactionRequest value, $Res Function(AddReactionRequest) _then) =
      _$AddReactionRequestCopyWithImpl;
  @useResult
  $Res call(
      {bool? createNotificationActivity,
      Map<String, Object>? custom,
      String type});
}

/// @nodoc
class _$AddReactionRequestCopyWithImpl<$Res>
    implements $AddReactionRequestCopyWith<$Res> {
  _$AddReactionRequestCopyWithImpl(this._self, this._then);

  final AddReactionRequest _self;
  final $Res Function(AddReactionRequest) _then;

  /// Create a copy of AddReactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createNotificationActivity = freezed,
    Object? custom = freezed,
    Object? type = null,
  }) {
    return _then(AddReactionRequest(
      createNotificationActivity: freezed == createNotificationActivity
          ? _self.createNotificationActivity
          : createNotificationActivity // ignore: cast_nullable_to_non_nullable
              as bool?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
