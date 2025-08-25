// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_lookup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberLookup {
  int get limit;

  /// Create a copy of MemberLookup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberLookupCopyWith<MemberLookup> get copyWith =>
      _$MemberLookupCopyWithImpl<MemberLookup>(
          this as MemberLookup, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberLookup &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @override
  String toString() {
    return 'MemberLookup(limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $MemberLookupCopyWith<$Res> {
  factory $MemberLookupCopyWith(
          MemberLookup value, $Res Function(MemberLookup) _then) =
      _$MemberLookupCopyWithImpl;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class _$MemberLookupCopyWithImpl<$Res> implements $MemberLookupCopyWith<$Res> {
  _$MemberLookupCopyWithImpl(this._self, this._then);

  final MemberLookup _self;
  final $Res Function(MemberLookup) _then;

  /// Create a copy of MemberLookup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
  }) {
    return _then(MemberLookup(
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
