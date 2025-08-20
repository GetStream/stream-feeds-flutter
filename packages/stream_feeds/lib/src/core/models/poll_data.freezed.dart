// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollData {
  bool get allowAnswers;
  bool get allowUserSuggestedOptions;
  int get answersCount;
  DateTime get createdAt;
  UserData? get createdBy;
  String get createdById;
  String get description;
  bool get enforceUniqueVote;
  String get id;
  bool get isClosed;
  List<PollVoteData> get latestAnswers;
  Map<String, List<PollVoteData>> get latestVotesByOption;
  int? get maxVotesAllowed;
  String get name;
  List<PollOptionData> get options;
  List<PollVoteData> get ownVotes;
  DateTime get updatedAt;
  int get voteCount;
  Map<String, int> get voteCountsByOption;
  String get votingVisibility;
  Map<String, Object>? get custom;

  /// Create a copy of PollData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollDataCopyWith<PollData> get copyWith =>
      _$PollDataCopyWithImpl<PollData>(this as PollData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollData &&
            (identical(other.allowAnswers, allowAnswers) ||
                other.allowAnswers == allowAnswers) &&
            (identical(other.allowUserSuggestedOptions,
                    allowUserSuggestedOptions) ||
                other.allowUserSuggestedOptions == allowUserSuggestedOptions) &&
            (identical(other.answersCount, answersCount) ||
                other.answersCount == answersCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.enforceUniqueVote, enforceUniqueVote) ||
                other.enforceUniqueVote == enforceUniqueVote) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            const DeepCollectionEquality()
                .equals(other.latestAnswers, latestAnswers) &&
            const DeepCollectionEquality()
                .equals(other.latestVotesByOption, latestVotesByOption) &&
            (identical(other.maxVotesAllowed, maxVotesAllowed) ||
                other.maxVotesAllowed == maxVotesAllowed) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            const DeepCollectionEquality().equals(other.ownVotes, ownVotes) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            const DeepCollectionEquality()
                .equals(other.voteCountsByOption, voteCountsByOption) &&
            (identical(other.votingVisibility, votingVisibility) ||
                other.votingVisibility == votingVisibility) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        allowAnswers,
        allowUserSuggestedOptions,
        answersCount,
        createdAt,
        createdBy,
        createdById,
        description,
        enforceUniqueVote,
        id,
        isClosed,
        const DeepCollectionEquality().hash(latestAnswers),
        const DeepCollectionEquality().hash(latestVotesByOption),
        maxVotesAllowed,
        name,
        const DeepCollectionEquality().hash(options),
        const DeepCollectionEquality().hash(ownVotes),
        updatedAt,
        voteCount,
        const DeepCollectionEquality().hash(voteCountsByOption),
        votingVisibility,
        const DeepCollectionEquality().hash(custom)
      ]);

  @override
  String toString() {
    return 'PollData(allowAnswers: $allowAnswers, allowUserSuggestedOptions: $allowUserSuggestedOptions, answersCount: $answersCount, createdAt: $createdAt, createdBy: $createdBy, createdById: $createdById, description: $description, enforceUniqueVote: $enforceUniqueVote, id: $id, isClosed: $isClosed, latestAnswers: $latestAnswers, latestVotesByOption: $latestVotesByOption, maxVotesAllowed: $maxVotesAllowed, name: $name, options: $options, ownVotes: $ownVotes, updatedAt: $updatedAt, voteCount: $voteCount, voteCountsByOption: $voteCountsByOption, votingVisibility: $votingVisibility, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $PollDataCopyWith<$Res> {
  factory $PollDataCopyWith(PollData value, $Res Function(PollData) _then) =
      _$PollDataCopyWithImpl;
  @useResult
  $Res call(
      {bool allowAnswers,
      bool allowUserSuggestedOptions,
      int answersCount,
      DateTime createdAt,
      String createdById,
      String description,
      bool enforceUniqueVote,
      String id,
      bool isClosed,
      List<PollVoteData> latestAnswers,
      Map<String, List<PollVoteData>> latestVotesByOption,
      String name,
      List<PollOptionData> options,
      List<PollVoteData> ownVotes,
      DateTime updatedAt,
      int voteCount,
      Map<String, int> voteCountsByOption,
      String votingVisibility,
      UserData? createdBy,
      int? maxVotesAllowed,
      Map<String, Object>? custom});
}

/// @nodoc
class _$PollDataCopyWithImpl<$Res> implements $PollDataCopyWith<$Res> {
  _$PollDataCopyWithImpl(this._self, this._then);

  final PollData _self;
  final $Res Function(PollData) _then;

  /// Create a copy of PollData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowAnswers = null,
    Object? allowUserSuggestedOptions = null,
    Object? answersCount = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? description = null,
    Object? enforceUniqueVote = null,
    Object? id = null,
    Object? isClosed = null,
    Object? latestAnswers = null,
    Object? latestVotesByOption = null,
    Object? name = null,
    Object? options = null,
    Object? ownVotes = null,
    Object? updatedAt = null,
    Object? voteCount = null,
    Object? voteCountsByOption = null,
    Object? votingVisibility = null,
    Object? createdBy = freezed,
    Object? maxVotesAllowed = freezed,
    Object? custom = freezed,
  }) {
    return _then(PollData(
      allowAnswers: null == allowAnswers
          ? _self.allowAnswers
          : allowAnswers // ignore: cast_nullable_to_non_nullable
              as bool,
      allowUserSuggestedOptions: null == allowUserSuggestedOptions
          ? _self.allowUserSuggestedOptions
          : allowUserSuggestedOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      answersCount: null == answersCount
          ? _self.answersCount
          : answersCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _self.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      enforceUniqueVote: null == enforceUniqueVote
          ? _self.enforceUniqueVote
          : enforceUniqueVote // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isClosed: null == isClosed
          ? _self.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      latestAnswers: null == latestAnswers
          ? _self.latestAnswers
          : latestAnswers // ignore: cast_nullable_to_non_nullable
              as List<PollVoteData>,
      latestVotesByOption: null == latestVotesByOption
          ? _self.latestVotesByOption
          : latestVotesByOption // ignore: cast_nullable_to_non_nullable
              as Map<String, List<PollVoteData>>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PollOptionData>,
      ownVotes: null == ownVotes
          ? _self.ownVotes
          : ownVotes // ignore: cast_nullable_to_non_nullable
              as List<PollVoteData>,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      voteCount: null == voteCount
          ? _self.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      voteCountsByOption: null == voteCountsByOption
          ? _self.voteCountsByOption
          : voteCountsByOption // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      votingVisibility: null == votingVisibility
          ? _self.votingVisibility
          : votingVisibility // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserData?,
      maxVotesAllowed: freezed == maxVotesAllowed
          ? _self.maxVotesAllowed
          : maxVotesAllowed // ignore: cast_nullable_to_non_nullable
              as int?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
