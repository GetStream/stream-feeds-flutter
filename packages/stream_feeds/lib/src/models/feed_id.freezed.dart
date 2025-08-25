// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedId {
  String get group;
  String get id;
  String get rawValue;

  /// Create a copy of FeedId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedIdCopyWith<FeedId> get copyWith =>
      _$FeedIdCopyWithImpl<FeedId>(this as FeedId, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedId &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rawValue, rawValue) ||
                other.rawValue == rawValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group, id, rawValue);

  @override
  String toString() {
    return 'FeedId(group: $group, id: $id, rawValue: $rawValue)';
  }
}

/// @nodoc
abstract mixin class $FeedIdCopyWith<$Res> {
  factory $FeedIdCopyWith(FeedId value, $Res Function(FeedId) _then) =
      _$FeedIdCopyWithImpl;
  @useResult
  $Res call({String group, String id});
}

/// @nodoc
class _$FeedIdCopyWithImpl<$Res> implements $FeedIdCopyWith<$Res> {
  _$FeedIdCopyWithImpl(this._self, this._then);

  final FeedId _self;
  final $Res Function(FeedId) _then;

  /// Create a copy of FeedId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? id = null,
  }) {
    return _then(FeedId(
      group: null == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
