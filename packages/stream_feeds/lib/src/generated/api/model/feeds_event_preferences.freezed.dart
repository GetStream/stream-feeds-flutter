// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feeds_event_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedsEventPreferences {
  String? get comments;
  String? get mentions;
  String? get newFollowers;
  String? get reactions;

  /// Create a copy of FeedsEventPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedsEventPreferencesCopyWith<FeedsEventPreferences> get copyWith =>
      _$FeedsEventPreferencesCopyWithImpl<FeedsEventPreferences>(
          this as FeedsEventPreferences, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedsEventPreferences &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.mentions, mentions) ||
                other.mentions == mentions) &&
            (identical(other.newFollowers, newFollowers) ||
                other.newFollowers == newFollowers) &&
            (identical(other.reactions, reactions) ||
                other.reactions == reactions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, comments, mentions, newFollowers, reactions);

  @override
  String toString() {
    return 'FeedsEventPreferences(comments: $comments, mentions: $mentions, newFollowers: $newFollowers, reactions: $reactions)';
  }
}

/// @nodoc
abstract mixin class $FeedsEventPreferencesCopyWith<$Res> {
  factory $FeedsEventPreferencesCopyWith(FeedsEventPreferences value,
          $Res Function(FeedsEventPreferences) _then) =
      _$FeedsEventPreferencesCopyWithImpl;
  @useResult
  $Res call(
      {String? comments,
      String? mentions,
      String? newFollowers,
      String? reactions});
}

/// @nodoc
class _$FeedsEventPreferencesCopyWithImpl<$Res>
    implements $FeedsEventPreferencesCopyWith<$Res> {
  _$FeedsEventPreferencesCopyWithImpl(this._self, this._then);

  final FeedsEventPreferences _self;
  final $Res Function(FeedsEventPreferences) _then;

  /// Create a copy of FeedsEventPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = freezed,
    Object? mentions = freezed,
    Object? newFollowers = freezed,
    Object? reactions = freezed,
  }) {
    return _then(FeedsEventPreferences(
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      mentions: freezed == mentions
          ? _self.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as String?,
      newFollowers: freezed == newFollowers
          ? _self.newFollowers
          : newFollowers // ignore: cast_nullable_to_non_nullable
              as String?,
      reactions: freezed == reactions
          ? _self.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
