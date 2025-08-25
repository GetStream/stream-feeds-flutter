// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_vote_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollVoteData {
  String? get answerText;
  DateTime get createdAt;
  String get id;
  bool? get isAnswer;
  String get optionId;
  String get pollId;
  DateTime get updatedAt;
  UserData? get user;
  String? get userId;

  /// Create a copy of PollVoteData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollVoteDataCopyWith<PollVoteData> get copyWith =>
      _$PollVoteDataCopyWithImpl<PollVoteData>(
          this as PollVoteData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollVoteData &&
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
    return 'PollVoteData(answerText: $answerText, createdAt: $createdAt, id: $id, isAnswer: $isAnswer, optionId: $optionId, pollId: $pollId, updatedAt: $updatedAt, user: $user, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $PollVoteDataCopyWith<$Res> {
  factory $PollVoteDataCopyWith(
          PollVoteData value, $Res Function(PollVoteData) _then) =
      _$PollVoteDataCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      String id,
      String optionId,
      String pollId,
      DateTime updatedAt,
      String? answerText,
      bool? isAnswer,
      UserData? user,
      String? userId});
}

/// @nodoc
class _$PollVoteDataCopyWithImpl<$Res> implements $PollVoteDataCopyWith<$Res> {
  _$PollVoteDataCopyWithImpl(this._self, this._then);

  final PollVoteData _self;
  final $Res Function(PollVoteData) _then;

  /// Create a copy of PollVoteData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? optionId = null,
    Object? pollId = null,
    Object? updatedAt = null,
    Object? answerText = freezed,
    Object? isAnswer = freezed,
    Object? user = freezed,
    Object? userId = freezed,
  }) {
    return _then(PollVoteData(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      answerText: freezed == answerText
          ? _self.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnswer: freezed == isAnswer
          ? _self.isAnswer
          : isAnswer // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
