// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_suggestion_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedSuggestionData {
  FeedData get feed;
  Map<String, double>? get algorithmScores;
  String? get reason;
  double? get recommendationScore;

  /// Create a copy of FeedSuggestionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedSuggestionDataCopyWith<FeedSuggestionData> get copyWith =>
      _$FeedSuggestionDataCopyWithImpl<FeedSuggestionData>(
          this as FeedSuggestionData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedSuggestionData &&
            (identical(other.feed, feed) || other.feed == feed) &&
            const DeepCollectionEquality()
                .equals(other.algorithmScores, algorithmScores) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.recommendationScore, recommendationScore) ||
                other.recommendationScore == recommendationScore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      feed,
      const DeepCollectionEquality().hash(algorithmScores),
      reason,
      recommendationScore);

  @override
  String toString() {
    return 'FeedSuggestionData(feed: $feed, algorithmScores: $algorithmScores, reason: $reason, recommendationScore: $recommendationScore)';
  }
}

/// @nodoc
abstract mixin class $FeedSuggestionDataCopyWith<$Res> {
  factory $FeedSuggestionDataCopyWith(
          FeedSuggestionData value, $Res Function(FeedSuggestionData) _then) =
      _$FeedSuggestionDataCopyWithImpl;
  @useResult
  $Res call(
      {FeedData feed,
      Map<String, double>? algorithmScores,
      String? reason,
      double? recommendationScore});
}

/// @nodoc
class _$FeedSuggestionDataCopyWithImpl<$Res>
    implements $FeedSuggestionDataCopyWith<$Res> {
  _$FeedSuggestionDataCopyWithImpl(this._self, this._then);

  final FeedSuggestionData _self;
  final $Res Function(FeedSuggestionData) _then;

  /// Create a copy of FeedSuggestionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feed = null,
    Object? algorithmScores = freezed,
    Object? reason = freezed,
    Object? recommendationScore = freezed,
  }) {
    return _then(FeedSuggestionData(
      feed: null == feed
          ? _self.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as FeedData,
      algorithmScores: freezed == algorithmScores
          ? _self.algorithmScores
          : algorithmScores // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendationScore: freezed == recommendationScore
          ? _self.recommendationScore
          : recommendationScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
