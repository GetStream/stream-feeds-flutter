// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_follow_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchFollowData {
  List<FollowData> get created;
  List<FollowData> get follows;

  /// Create a copy of BatchFollowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchFollowDataCopyWith<BatchFollowData> get copyWith =>
      _$BatchFollowDataCopyWithImpl<BatchFollowData>(
          this as BatchFollowData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchFollowData &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.follows, follows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(follows));

  @override
  String toString() {
    return 'BatchFollowData(created: $created, follows: $follows)';
  }
}

/// @nodoc
abstract mixin class $BatchFollowDataCopyWith<$Res> {
  factory $BatchFollowDataCopyWith(
          BatchFollowData value, $Res Function(BatchFollowData) _then) =
      _$BatchFollowDataCopyWithImpl;
  @useResult
  $Res call({List<FollowData> created, List<FollowData> follows});
}

/// @nodoc
class _$BatchFollowDataCopyWithImpl<$Res>
    implements $BatchFollowDataCopyWith<$Res> {
  _$BatchFollowDataCopyWithImpl(this._self, this._then);

  final BatchFollowData _self;
  final $Res Function(BatchFollowData) _then;

  /// Create a copy of BatchFollowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? follows = null,
  }) {
    return _then(BatchFollowData(
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as List<FollowData>,
      follows: null == follows
          ? _self.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<FollowData>,
    ));
  }
}

// dart format on
