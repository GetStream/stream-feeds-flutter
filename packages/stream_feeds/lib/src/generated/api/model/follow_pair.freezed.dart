// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowPair {
  String get source;
  String get target;

  /// Create a copy of FollowPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowPairCopyWith<FollowPair> get copyWith =>
      _$FollowPairCopyWithImpl<FollowPair>(this as FollowPair, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowPair &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, target);

  @override
  String toString() {
    return 'FollowPair(source: $source, target: $target)';
  }
}

/// @nodoc
abstract mixin class $FollowPairCopyWith<$Res> {
  factory $FollowPairCopyWith(
          FollowPair value, $Res Function(FollowPair) _then) =
      _$FollowPairCopyWithImpl;
  @useResult
  $Res call({String source, String target});
}

/// @nodoc
class _$FollowPairCopyWithImpl<$Res> implements $FollowPairCopyWith<$Res> {
  _$FollowPairCopyWithImpl(this._self, this._then);

  final FollowPair _self;
  final $Res Function(FollowPair) _then;

  /// Create a copy of FollowPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? target = null,
  }) {
    return _then(FollowPair(
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
