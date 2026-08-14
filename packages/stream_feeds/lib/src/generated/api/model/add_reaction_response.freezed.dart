// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_reaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddReactionResponse {
  ActivityResponse get activity;
  String get duration;
  bool? get notificationAccepted;
  bool? get notificationCreated;
  String? get notificationTaskId;
  FeedsReactionResponse get reaction;
  ActivityResponse? get referenceActivity;

  /// Create a copy of AddReactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddReactionResponseCopyWith<AddReactionResponse> get copyWith =>
      _$AddReactionResponseCopyWithImpl<AddReactionResponse>(
        this as AddReactionResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddReactionResponse &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.duration, duration) || other.duration == duration) &&
            (identical(other.notificationAccepted, notificationAccepted) ||
                other.notificationAccepted == notificationAccepted) &&
            (identical(other.notificationCreated, notificationCreated) ||
                other.notificationCreated == notificationCreated) &&
            (identical(other.notificationTaskId, notificationTaskId) ||
                other.notificationTaskId == notificationTaskId) &&
            (identical(other.reaction, reaction) || other.reaction == reaction) &&
            (identical(other.referenceActivity, referenceActivity) || other.referenceActivity == referenceActivity));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    duration,
    notificationAccepted,
    notificationCreated,
    notificationTaskId,
    reaction,
    referenceActivity,
  );

  @override
  String toString() {
    return 'AddReactionResponse(activity: $activity, duration: $duration, notificationAccepted: $notificationAccepted, notificationCreated: $notificationCreated, notificationTaskId: $notificationTaskId, reaction: $reaction, referenceActivity: $referenceActivity)';
  }
}

/// @nodoc
abstract mixin class $AddReactionResponseCopyWith<$Res> {
  factory $AddReactionResponseCopyWith(
    AddReactionResponse value,
    $Res Function(AddReactionResponse) _then,
  ) = _$AddReactionResponseCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    String duration,
    bool? notificationAccepted,
    bool? notificationCreated,
    String? notificationTaskId,
    FeedsReactionResponse reaction,
    ActivityResponse? referenceActivity,
  });
}

/// @nodoc
class _$AddReactionResponseCopyWithImpl<$Res> implements $AddReactionResponseCopyWith<$Res> {
  _$AddReactionResponseCopyWithImpl(this._self, this._then);

  final AddReactionResponse _self;
  final $Res Function(AddReactionResponse) _then;

  /// Create a copy of AddReactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? duration = null,
    Object? notificationAccepted = freezed,
    Object? notificationCreated = freezed,
    Object? notificationTaskId = freezed,
    Object? reaction = null,
    Object? referenceActivity = freezed,
  }) {
    return _then(
      AddReactionResponse(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
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
