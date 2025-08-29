// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reaction_group_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReactionGroupData {
  int get count;
  DateTime get firstReactionAt;
  DateTime get lastReactionAt;

  /// Create a copy of ReactionGroupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReactionGroupDataCopyWith<ReactionGroupData> get copyWith =>
      _$ReactionGroupDataCopyWithImpl<ReactionGroupData>(
          this as ReactionGroupData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReactionGroupData &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.firstReactionAt, firstReactionAt) ||
                other.firstReactionAt == firstReactionAt) &&
            (identical(other.lastReactionAt, lastReactionAt) ||
                other.lastReactionAt == lastReactionAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, count, firstReactionAt, lastReactionAt);

  @override
  String toString() {
    return 'ReactionGroupData(count: $count, firstReactionAt: $firstReactionAt, lastReactionAt: $lastReactionAt)';
  }
}

/// @nodoc
abstract mixin class $ReactionGroupDataCopyWith<$Res> {
  factory $ReactionGroupDataCopyWith(
          ReactionGroupData value, $Res Function(ReactionGroupData) _then) =
      _$ReactionGroupDataCopyWithImpl;
  @useResult
  $Res call({int count, DateTime firstReactionAt, DateTime lastReactionAt});
}

/// @nodoc
class _$ReactionGroupDataCopyWithImpl<$Res>
    implements $ReactionGroupDataCopyWith<$Res> {
  _$ReactionGroupDataCopyWithImpl(this._self, this._then);

  final ReactionGroupData _self;
  final $Res Function(ReactionGroupData) _then;

  /// Create a copy of ReactionGroupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? firstReactionAt = null,
    Object? lastReactionAt = null,
  }) {
    return _then(ReactionGroupData(
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      firstReactionAt: null == firstReactionAt
          ? _self.firstReactionAt
          : firstReactionAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastReactionAt: null == lastReactionAt
          ? _self.lastReactionAt
          : lastReactionAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
