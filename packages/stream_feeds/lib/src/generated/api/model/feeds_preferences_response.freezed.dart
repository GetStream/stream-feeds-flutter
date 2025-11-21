// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feeds_preferences_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedsPreferencesResponse {
  String? get comment;
  String? get commentReaction;
  Map<String, String>? get customActivityTypes;
  String? get follow;
  String? get mention;
  String? get reaction;

  /// Create a copy of FeedsPreferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedsPreferencesResponseCopyWith<FeedsPreferencesResponse> get copyWith =>
      _$FeedsPreferencesResponseCopyWithImpl<FeedsPreferencesResponse>(
          this as FeedsPreferencesResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedsPreferencesResponse &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.commentReaction, commentReaction) ||
                other.commentReaction == commentReaction) &&
            const DeepCollectionEquality()
                .equals(other.customActivityTypes, customActivityTypes) &&
            (identical(other.follow, follow) || other.follow == follow) &&
            (identical(other.mention, mention) || other.mention == mention) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      comment,
      commentReaction,
      const DeepCollectionEquality().hash(customActivityTypes),
      follow,
      mention,
      reaction);

  @override
  String toString() {
    return 'FeedsPreferencesResponse(comment: $comment, commentReaction: $commentReaction, customActivityTypes: $customActivityTypes, follow: $follow, mention: $mention, reaction: $reaction)';
  }
}

/// @nodoc
abstract mixin class $FeedsPreferencesResponseCopyWith<$Res> {
  factory $FeedsPreferencesResponseCopyWith(FeedsPreferencesResponse value,
          $Res Function(FeedsPreferencesResponse) _then) =
      _$FeedsPreferencesResponseCopyWithImpl;
  @useResult
  $Res call(
      {String? comment,
      String? commentReaction,
      Map<String, String>? customActivityTypes,
      String? follow,
      String? mention,
      String? reaction});
}

/// @nodoc
class _$FeedsPreferencesResponseCopyWithImpl<$Res>
    implements $FeedsPreferencesResponseCopyWith<$Res> {
  _$FeedsPreferencesResponseCopyWithImpl(this._self, this._then);

  final FeedsPreferencesResponse _self;
  final $Res Function(FeedsPreferencesResponse) _then;

  /// Create a copy of FeedsPreferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
    Object? commentReaction = freezed,
    Object? customActivityTypes = freezed,
    Object? follow = freezed,
    Object? mention = freezed,
    Object? reaction = freezed,
  }) {
    return _then(FeedsPreferencesResponse(
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      commentReaction: freezed == commentReaction
          ? _self.commentReaction
          : commentReaction // ignore: cast_nullable_to_non_nullable
              as String?,
      customActivityTypes: freezed == customActivityTypes
          ? _self.customActivityTypes
          : customActivityTypes // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      follow: freezed == follow
          ? _self.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as String?,
      mention: freezed == mention
          ? _self.mention
          : mention // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: freezed == reaction
          ? _self.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
