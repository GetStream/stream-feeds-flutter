// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_feed_member_invite_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RejectFeedMemberInviteResponse {
  String get duration;
  FeedMemberResponse get member;

  /// Create a copy of RejectFeedMemberInviteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RejectFeedMemberInviteResponseCopyWith<RejectFeedMemberInviteResponse>
      get copyWith => _$RejectFeedMemberInviteResponseCopyWithImpl<
              RejectFeedMemberInviteResponse>(
          this as RejectFeedMemberInviteResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RejectFeedMemberInviteResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.member, member) || other.member == member));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, member);

  @override
  String toString() {
    return 'RejectFeedMemberInviteResponse(duration: $duration, member: $member)';
  }
}

/// @nodoc
abstract mixin class $RejectFeedMemberInviteResponseCopyWith<$Res> {
  factory $RejectFeedMemberInviteResponseCopyWith(
          RejectFeedMemberInviteResponse value,
          $Res Function(RejectFeedMemberInviteResponse) _then) =
      _$RejectFeedMemberInviteResponseCopyWithImpl;
  @useResult
  $Res call({String duration, FeedMemberResponse member});
}

/// @nodoc
class _$RejectFeedMemberInviteResponseCopyWithImpl<$Res>
    implements $RejectFeedMemberInviteResponseCopyWith<$Res> {
  _$RejectFeedMemberInviteResponseCopyWithImpl(this._self, this._then);

  final RejectFeedMemberInviteResponse _self;
  final $Res Function(RejectFeedMemberInviteResponse) _then;

  /// Create a copy of RejectFeedMemberInviteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? member = null,
  }) {
    return _then(RejectFeedMemberInviteResponse(
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
