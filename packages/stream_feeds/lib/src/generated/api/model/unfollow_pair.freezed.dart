// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unfollow_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnfollowPair {
  bool? get keepHistory;
  String get source;
  String get target;

  /// Create a copy of UnfollowPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnfollowPairCopyWith<UnfollowPair> get copyWith =>
      _$UnfollowPairCopyWithImpl<UnfollowPair>(
          this as UnfollowPair, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnfollowPair &&
            (identical(other.keepHistory, keepHistory) ||
                other.keepHistory == keepHistory) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keepHistory, source, target);

  @override
  String toString() {
    return 'UnfollowPair(keepHistory: $keepHistory, source: $source, target: $target)';
  }
}

/// @nodoc
abstract mixin class $UnfollowPairCopyWith<$Res> {
  factory $UnfollowPairCopyWith(
          UnfollowPair value, $Res Function(UnfollowPair) _then) =
      _$UnfollowPairCopyWithImpl;
  @useResult
  $Res call({bool? keepHistory, String source, String target});
}

/// @nodoc
class _$UnfollowPairCopyWithImpl<$Res> implements $UnfollowPairCopyWith<$Res> {
  _$UnfollowPairCopyWithImpl(this._self, this._then);

  final UnfollowPair _self;
  final $Res Function(UnfollowPair) _then;

  /// Create a copy of UnfollowPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keepHistory = freezed,
    Object? source = null,
    Object? target = null,
  }) {
    return _then(UnfollowPair(
      keepHistory: freezed == keepHistory
          ? _self.keepHistory
          : keepHistory // ignore: cast_nullable_to_non_nullable
              as bool?,
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
