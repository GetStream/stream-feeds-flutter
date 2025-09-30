// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_poll_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePollState {
  bool get allowAnswers;
  bool get allowUserSuggestedOptions;
  String get description;
  bool get enforceUniqueVote;
  String? get id;
  bool get isClosed;
  int? get maxVotesAllowed;
  String get name;
  List<PollOptionInputState> get options;
  VotingVisibility? get votingVisibility;

  /// Create a copy of CreatePollState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreatePollStateCopyWith<CreatePollState> get copyWith =>
      _$CreatePollStateCopyWithImpl<CreatePollState>(
          this as CreatePollState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreatePollState &&
            (identical(other.allowAnswers, allowAnswers) ||
                other.allowAnswers == allowAnswers) &&
            (identical(other.allowUserSuggestedOptions,
                    allowUserSuggestedOptions) ||
                other.allowUserSuggestedOptions == allowUserSuggestedOptions) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.enforceUniqueVote, enforceUniqueVote) ||
                other.enforceUniqueVote == enforceUniqueVote) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.maxVotesAllowed, maxVotesAllowed) ||
                other.maxVotesAllowed == maxVotesAllowed) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.votingVisibility, votingVisibility) ||
                other.votingVisibility == votingVisibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      allowAnswers,
      allowUserSuggestedOptions,
      description,
      enforceUniqueVote,
      id,
      isClosed,
      maxVotesAllowed,
      name,
      const DeepCollectionEquality().hash(options),
      votingVisibility);

  @override
  String toString() {
    return 'CreatePollState(allowAnswers: $allowAnswers, allowUserSuggestedOptions: $allowUserSuggestedOptions, description: $description, enforceUniqueVote: $enforceUniqueVote, id: $id, isClosed: $isClosed, maxVotesAllowed: $maxVotesAllowed, name: $name, options: $options, votingVisibility: $votingVisibility)';
  }
}

/// @nodoc
abstract mixin class $CreatePollStateCopyWith<$Res> {
  factory $CreatePollStateCopyWith(
          CreatePollState value, $Res Function(CreatePollState) _then) =
      _$CreatePollStateCopyWithImpl;
  @useResult
  $Res call(
      {bool allowAnswers,
      bool allowUserSuggestedOptions,
      String description,
      bool enforceUniqueVote,
      String? id,
      bool isClosed,
      int? maxVotesAllowed,
      String name,
      List<PollOptionInputState> options,
      VotingVisibility? votingVisibility});
}

/// @nodoc
class _$CreatePollStateCopyWithImpl<$Res>
    implements $CreatePollStateCopyWith<$Res> {
  _$CreatePollStateCopyWithImpl(this._self, this._then);

  final CreatePollState _self;
  final $Res Function(CreatePollState) _then;

  /// Create a copy of CreatePollState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowAnswers = null,
    Object? allowUserSuggestedOptions = null,
    Object? description = null,
    Object? enforceUniqueVote = null,
    Object? id = freezed,
    Object? isClosed = null,
    Object? maxVotesAllowed = freezed,
    Object? name = null,
    Object? options = null,
    Object? votingVisibility = freezed,
  }) {
    return _then(CreatePollState(
      allowAnswers: null == allowAnswers
          ? _self.allowAnswers
          : allowAnswers // ignore: cast_nullable_to_non_nullable
              as bool,
      allowUserSuggestedOptions: null == allowUserSuggestedOptions
          ? _self.allowUserSuggestedOptions
          : allowUserSuggestedOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      enforceUniqueVote: null == enforceUniqueVote
          ? _self.enforceUniqueVote
          : enforceUniqueVote // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isClosed: null == isClosed
          ? _self.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      maxVotesAllowed: freezed == maxVotesAllowed
          ? _self.maxVotesAllowed
          : maxVotesAllowed // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PollOptionInputState>,
      votingVisibility: freezed == votingVisibility
          ? _self.votingVisibility
          : votingVisibility // ignore: cast_nullable_to_non_nullable
              as VotingVisibility?,
    ));
  }
}

/// @nodoc
mixin _$PollOptionInputState {
  Key get key;
  String? get originalId;
  String get text;

  /// Create a copy of PollOptionInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollOptionInputStateCopyWith<PollOptionInputState> get copyWith =>
      _$PollOptionInputStateCopyWithImpl<PollOptionInputState>(
          this as PollOptionInputState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollOptionInputState &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.originalId, originalId) ||
                other.originalId == originalId) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, originalId, text);

  @override
  String toString() {
    return 'PollOptionInputState(key: $key, originalId: $originalId, text: $text)';
  }
}

/// @nodoc
abstract mixin class $PollOptionInputStateCopyWith<$Res> {
  factory $PollOptionInputStateCopyWith(PollOptionInputState value,
          $Res Function(PollOptionInputState) _then) =
      _$PollOptionInputStateCopyWithImpl;
  @useResult
  $Res call({Key? key, String? originalId, String text});
}

/// @nodoc
class _$PollOptionInputStateCopyWithImpl<$Res>
    implements $PollOptionInputStateCopyWith<$Res> {
  _$PollOptionInputStateCopyWithImpl(this._self, this._then);

  final PollOptionInputState _self;
  final $Res Function(PollOptionInputState) _then;

  /// Create a copy of PollOptionInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? originalId = freezed,
    Object? text = null,
  }) {
    return _then(PollOptionInputState(
      key: freezed == key
          ? _self.key!
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
      originalId: freezed == originalId
          ? _self.originalId
          : originalId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
