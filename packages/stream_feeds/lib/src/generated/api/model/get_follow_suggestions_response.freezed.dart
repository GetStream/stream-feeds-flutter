// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_follow_suggestions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetFollowSuggestionsResponse {
  String get duration;
  List<FeedResponse> get suggestions;

  /// Create a copy of GetFollowSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetFollowSuggestionsResponseCopyWith<GetFollowSuggestionsResponse>
      get copyWith => _$GetFollowSuggestionsResponseCopyWithImpl<
              GetFollowSuggestionsResponse>(
          this as GetFollowSuggestionsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetFollowSuggestionsResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other.suggestions, suggestions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, duration, const DeepCollectionEquality().hash(suggestions));

  @override
  String toString() {
    return 'GetFollowSuggestionsResponse(duration: $duration, suggestions: $suggestions)';
  }
}

/// @nodoc
abstract mixin class $GetFollowSuggestionsResponseCopyWith<$Res> {
  factory $GetFollowSuggestionsResponseCopyWith(
          GetFollowSuggestionsResponse value,
          $Res Function(GetFollowSuggestionsResponse) _then) =
      _$GetFollowSuggestionsResponseCopyWithImpl;
  @useResult
  $Res call({String duration, List<FeedResponse> suggestions});
}

/// @nodoc
class _$GetFollowSuggestionsResponseCopyWithImpl<$Res>
    implements $GetFollowSuggestionsResponseCopyWith<$Res> {
  _$GetFollowSuggestionsResponseCopyWithImpl(this._self, this._then);

  final GetFollowSuggestionsResponse _self;
  final $Res Function(GetFollowSuggestionsResponse) _then;

  /// Create a copy of GetFollowSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? suggestions = null,
  }) {
    return _then(GetFollowSuggestionsResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      suggestions: null == suggestions
          ? _self.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<FeedResponse>,
    ));
  }
}

// dart format on
