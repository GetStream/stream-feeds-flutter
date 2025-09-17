// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accept_feed_member_invite_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AcceptFeedMemberInviteResponse {
  String get duration;
  FeedMemberResponse get member;

  /// Create a copy of AcceptFeedMemberInviteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AcceptFeedMemberInviteResponseCopyWith<AcceptFeedMemberInviteResponse>
      get copyWith => _$AcceptFeedMemberInviteResponseCopyWithImpl<
              AcceptFeedMemberInviteResponse>(
          this as AcceptFeedMemberInviteResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AcceptFeedMemberInviteResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.member, member) || other.member == member));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, member);

  @override
  String toString() {
    return 'AcceptFeedMemberInviteResponse(duration: $duration, member: $member)';
  }
}

/// @nodoc
abstract mixin class $AcceptFeedMemberInviteResponseCopyWith<$Res> {
  factory $AcceptFeedMemberInviteResponseCopyWith(
          AcceptFeedMemberInviteResponse value,
          $Res Function(AcceptFeedMemberInviteResponse) _then) =
      _$AcceptFeedMemberInviteResponseCopyWithImpl;
  @useResult
  $Res call({String duration, FeedMemberResponse member});
}

/// @nodoc
class _$AcceptFeedMemberInviteResponseCopyWithImpl<$Res>
    implements $AcceptFeedMemberInviteResponseCopyWith<$Res> {
  _$AcceptFeedMemberInviteResponseCopyWithImpl(this._self, this._then);

  final AcceptFeedMemberInviteResponse _self;
  final $Res Function(AcceptFeedMemberInviteResponse) _then;

  /// Create a copy of AcceptFeedMemberInviteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? member = null,
  }) {
    return _then(AcceptFeedMemberInviteResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      member: null == member
          ? _self.member
          : member // ignore: cast_nullable_to_non_nullable
              as FeedMemberResponse,
    ));
  }
}

// dart format on
