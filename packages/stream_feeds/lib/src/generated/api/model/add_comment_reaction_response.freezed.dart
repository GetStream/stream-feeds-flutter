// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_comment_reaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCommentReactionResponse {
  CommentResponse get comment;
  int get counterDelta;
  String get duration;
  bool? get notificationAccepted;
  bool? get notificationCreated;
  String? get notificationTaskId;
  String get outcome;
  String? get previousReactionType;
  FeedsReactionResponse get reaction;
  ActivityResponse? get referenceActivity;

  /// Create a copy of AddCommentReactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddCommentReactionResponseCopyWith<AddCommentReactionResponse> get copyWith =>
      _$AddCommentReactionResponseCopyWithImpl<AddCommentReactionResponse>(
        this as AddCommentReactionResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCommentReactionResponse &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.counterDelta, counterDelta) || other.counterDelta == counterDelta) &&
            (identical(other.duration, duration) || other.duration == duration) &&
            (identical(other.notificationAccepted, notificationAccepted) ||
                other.notificationAccepted == notificationAccepted) &&
            (identical(other.notificationCreated, notificationCreated) ||
                other.notificationCreated == notificationCreated) &&
            (identical(other.notificationTaskId, notificationTaskId) ||
                other.notificationTaskId == notificationTaskId) &&
            (identical(other.outcome, outcome) || other.outcome == outcome) &&
            (identical(other.previousReactionType, previousReactionType) ||
                other.previousReactionType == previousReactionType) &&
            (identical(other.reaction, reaction) || other.reaction == reaction) &&
            (identical(other.referenceActivity, referenceActivity) || other.referenceActivity == referenceActivity));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    comment,
    counterDelta,
    duration,
    notificationAccepted,
    notificationCreated,
    notificationTaskId,
    outcome,
    previousReactionType,
    reaction,
    referenceActivity,
  );

  @override
  String toString() {
    return 'AddCommentReactionResponse(comment: $comment, counterDelta: $counterDelta, duration: $duration, notificationAccepted: $notificationAccepted, notificationCreated: $notificationCreated, notificationTaskId: $notificationTaskId, outcome: $outcome, previousReactionType: $previousReactionType, reaction: $reaction, referenceActivity: $referenceActivity)';
  }
}

/// @nodoc
abstract mixin class $AddCommentReactionResponseCopyWith<$Res> {
  factory $AddCommentReactionResponseCopyWith(
    AddCommentReactionResponse value,
    $Res Function(AddCommentReactionResponse) _then,
  ) = _$AddCommentReactionResponseCopyWithImpl;
  @useResult
  $Res call({
    CommentResponse comment,
    int counterDelta,
    String duration,
    bool? notificationAccepted,
    bool? notificationCreated,
    String? notificationTaskId,
    String outcome,
    String? previousReactionType,
    FeedsReactionResponse reaction,
    ActivityResponse? referenceActivity,
  });
}

/// @nodoc
class _$AddCommentReactionResponseCopyWithImpl<$Res> implements $AddCommentReactionResponseCopyWith<$Res> {
  _$AddCommentReactionResponseCopyWithImpl(this._self, this._then);

  final AddCommentReactionResponse _self;
  final $Res Function(AddCommentReactionResponse) _then;

  /// Create a copy of AddCommentReactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? counterDelta = null,
    Object? duration = null,
    Object? notificationAccepted = freezed,
    Object? notificationCreated = freezed,
    Object? notificationTaskId = freezed,
    Object? outcome = null,
    Object? previousReactionType = freezed,
    Object? reaction = null,
    Object? referenceActivity = freezed,
  }) {
    return _then(
      AddCommentReactionResponse(
        comment: null == comment
            ? _self.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as CommentResponse,
        counterDelta: null == counterDelta
            ? _self.counterDelta
            : counterDelta // ignore: cast_nullable_to_non_nullable
                  as int,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        notificationAccepted: freezed == notificationAccepted
            ? _self.notificationAccepted
            : notificationAccepted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        notificationCreated: freezed == notificationCreated
            ? _self.notificationCreated
            : notificationCreated // ignore: cast_nullable_to_non_nullable
                  as bool?,
        notificationTaskId: freezed == notificationTaskId
            ? _self.notificationTaskId
            : notificationTaskId // ignore: cast_nullable_to_non_nullable
                  as String?,
        outcome: null == outcome
            ? _self.outcome
            : outcome // ignore: cast_nullable_to_non_nullable
                  as String,
        previousReactionType: freezed == previousReactionType
            ? _self.previousReactionType
            : previousReactionType // ignore: cast_nullable_to_non_nullable
                  as String?,
        reaction: null == reaction
            ? _self.reaction
            : reaction // ignore: cast_nullable_to_non_nullable
                  as FeedsReactionResponse,
        referenceActivity: freezed == referenceActivity
            ? _self.referenceActivity
            : referenceActivity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse?,
      ),
    );
  }
}
