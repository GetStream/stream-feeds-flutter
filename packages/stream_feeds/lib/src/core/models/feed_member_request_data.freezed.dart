// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_member_request_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedMemberRequestData {
  String get userId;
  String? get role;
  bool? get invite;
  Map<String, Object>? get custom;

  /// Create a copy of FeedMemberRequestData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedMemberRequestDataCopyWith<FeedMemberRequestData> get copyWith =>
      _$FeedMemberRequestDataCopyWithImpl<FeedMemberRequestData>(
          this as FeedMemberRequestData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedMemberRequestData &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.invite, invite) || other.invite == invite) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, role, invite,
      const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'FeedMemberRequestData(userId: $userId, role: $role, invite: $invite, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $FeedMemberRequestDataCopyWith<$Res> {
  factory $FeedMemberRequestDataCopyWith(FeedMemberRequestData value,
          $Res Function(FeedMemberRequestData) _then) =
      _$FeedMemberRequestDataCopyWithImpl;
  @useResult
  $Res call(
      {String userId, String? role, bool? invite, Map<String, Object>? custom});
}

/// @nodoc
class _$FeedMemberRequestDataCopyWithImpl<$Res>
    implements $FeedMemberRequestDataCopyWith<$Res> {
  _$FeedMemberRequestDataCopyWithImpl(this._self, this._then);

  final FeedMemberRequestData _self;
  final $Res Function(FeedMemberRequestData) _then;

  /// Create a copy of FeedMemberRequestData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? role = freezed,
    Object? invite = freezed,
    Object? custom = freezed,
  }) {
    return _then(FeedMemberRequestData(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      invite: freezed == invite
          ? _self.invite
          : invite // ignore: cast_nullable_to_non_nullable
              as bool?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
