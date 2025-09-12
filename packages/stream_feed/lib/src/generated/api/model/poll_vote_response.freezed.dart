// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_vote_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollVoteResponse {
  String get duration;
  PollVoteResponseData? get vote;

  /// Create a copy of PollVoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollVoteResponseCopyWith<PollVoteResponse> get copyWith =>
      _$PollVoteResponseCopyWithImpl<PollVoteResponse>(
          this as PollVoteResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollVoteResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.vote, vote) || other.vote == vote));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, vote);

  @override
  String toString() {
    return 'PollVoteResponse(duration: $duration, vote: $vote)';
  }
}

/// @nodoc
abstract mixin class $PollVoteResponseCopyWith<$Res> {
  factory $PollVoteResponseCopyWith(
          PollVoteResponse value, $Res Function(PollVoteResponse) _then) =
      _$PollVoteResponseCopyWithImpl;
  @useResult
  $Res call({String duration, PollVoteResponseData? vote});
}

/// @nodoc
class _$PollVoteResponseCopyWithImpl<$Res>
    implements $PollVoteResponseCopyWith<$Res> {
  _$PollVoteResponseCopyWithImpl(this._self, this._then);

  final PollVoteResponse _self;
  final $Res Function(PollVoteResponse) _then;

  /// Create a copy of PollVoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? vote = freezed,
  }) {
    return _then(PollVoteResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      vote: freezed == vote
          ? _self.vote
          : vote // ignore: cast_nullable_to_non_nullable
              as PollVoteResponseData?,
    ));
  }
}

// dart format on
