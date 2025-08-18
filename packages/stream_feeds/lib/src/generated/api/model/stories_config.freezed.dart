// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoriesConfig {
  StoriesConfigExpirationBehaviour? get expirationBehaviour;
  bool? get skipWatched;

  /// Create a copy of StoriesConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoriesConfigCopyWith<StoriesConfig> get copyWith =>
      _$StoriesConfigCopyWithImpl<StoriesConfig>(
          this as StoriesConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoriesConfig &&
            (identical(other.expirationBehaviour, expirationBehaviour) ||
                other.expirationBehaviour == expirationBehaviour) &&
            (identical(other.skipWatched, skipWatched) ||
                other.skipWatched == skipWatched));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, expirationBehaviour, skipWatched);

  @override
  String toString() {
    return 'StoriesConfig(expirationBehaviour: $expirationBehaviour, skipWatched: $skipWatched)';
  }
}

/// @nodoc
abstract mixin class $StoriesConfigCopyWith<$Res> {
  factory $StoriesConfigCopyWith(
          StoriesConfig value, $Res Function(StoriesConfig) _then) =
      _$StoriesConfigCopyWithImpl;
  @useResult
  $Res call(
      {StoriesConfigExpirationBehaviour? expirationBehaviour,
      bool? skipWatched});
}

/// @nodoc
class _$StoriesConfigCopyWithImpl<$Res>
    implements $StoriesConfigCopyWith<$Res> {
  _$StoriesConfigCopyWithImpl(this._self, this._then);

  final StoriesConfig _self;
  final $Res Function(StoriesConfig) _then;

  /// Create a copy of StoriesConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expirationBehaviour = freezed,
    Object? skipWatched = freezed,
  }) {
    return _then(StoriesConfig(
      expirationBehaviour: freezed == expirationBehaviour
          ? _self.expirationBehaviour
          : expirationBehaviour // ignore: cast_nullable_to_non_nullable
              as StoriesConfigExpirationBehaviour?,
      skipWatched: freezed == skipWatched
          ? _self.skipWatched
          : skipWatched // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
