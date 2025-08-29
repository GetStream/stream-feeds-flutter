// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_activity_reaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteActivityReactionResponse {
  ActivityResponse get activity;
  String get duration;
  FeedsReactionResponse get reaction;

  /// Create a copy of DeleteActivityReactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteActivityReactionResponseCopyWith<DeleteActivityReactionResponse>
      get copyWith => _$DeleteActivityReactionResponseCopyWithImpl<
              DeleteActivityReactionResponse>(
          this as DeleteActivityReactionResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteActivityReactionResponse &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, duration, reaction);

  @override
  String toString() {
    return 'DeleteActivityReactionResponse(activity: $activity, duration: $duration, reaction: $reaction)';
  }
}

/// @nodoc
abstract mixin class $DeleteActivityReactionResponseCopyWith<$Res> {
  factory $DeleteActivityReactionResponseCopyWith(
          DeleteActivityReactionResponse value,
          $Res Function(DeleteActivityReactionResponse) _then) =
      _$DeleteActivityReactionResponseCopyWithImpl;
  @useResult
  $Res call(
      {ActivityResponse activity,
      String duration,
      FeedsReactionResponse reaction});
}

/// @nodoc
class _$DeleteActivityReactionResponseCopyWithImpl<$Res>
    implements $DeleteActivityReactionResponseCopyWith<$Res> {
  _$DeleteActivityReactionResponseCopyWithImpl(this._self, this._then);

  final DeleteActivityReactionResponse _self;
  final $Res Function(DeleteActivityReactionResponse) _then;

  /// Create a copy of DeleteActivityReactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? duration = null,
    Object? reaction = null,
  }) {
    return _then(DeleteActivityReactionResponse(
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityResponse,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      reaction: null == reaction
          ? _self.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as FeedsReactionResponse,
    ));
  }
}

// dart format on
