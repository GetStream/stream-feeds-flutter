// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_vote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollVote {
  String? get answerText;
  DateTime get createdAt;
  String get id;
  bool? get isAnswer;
  String get optionId;
  String get pollId;
  DateTime get updatedAt;
  User? get user;
  String? get userId;

  /// Create a copy of PollVote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollVoteCopyWith<PollVote> get copyWith =>
      _$PollVoteCopyWithImpl<PollVote>(this as PollVote, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollVote &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isAnswer, isAnswer) ||
                other.isAnswer == isAnswer) &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.pollId, pollId) || other.pollId == pollId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answerText, createdAt, id,
      isAnswer, optionId, pollId, updatedAt, user, userId);

  @override
  String toString() {
    return 'PollVote(answerText: $answerText, createdAt: $createdAt, id: $id, isAnswer: $isAnswer, optionId: $optionId, pollId: $pollId, updatedAt: $updatedAt, user: $user, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $PollVoteCopyWith<$Res> {
  factory $PollVoteCopyWith(PollVote value, $Res Function(PollVote) _then) =
      _$PollVoteCopyWithImpl;
  @useResult
  $Res call(
      {String? answerText,
      DateTime createdAt,
      String id,
      bool? isAnswer,
      String optionId,
      String pollId,
      DateTime updatedAt,
      User? user,
      String? userId});
}

/// @nodoc
class _$PollVoteCopyWithImpl<$Res> implements $PollVoteCopyWith<$Res> {
  _$PollVoteCopyWithImpl(this._self, this._then);

  final PollVote _self;
  final $Res Function(PollVote) _then;

  /// Create a copy of PollVote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerText = freezed,
    Object? createdAt = null,
    Object? id = null,
    Object? isAnswer = freezed,
    Object? optionId = null,
    Object? pollId = null,
    Object? updatedAt = null,
    Object? user = freezed,
    Object? userId = freezed,
  }) {
    return _then(PollVote(
      answerText: freezed == answerText
          ? _self.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isAnswer: freezed == isAnswer
          ? _self.isAnswer
          : isAnswer // ignore: cast_nullable_to_non_nullable
              as bool?,
      optionId: null == optionId
          ? _self.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      pollId: null == pollId
          ? _self.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
