// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_feed_members_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateFeedMembersResponse {
  List<FeedMemberResponse> get added;
  String get duration;
  List<String> get removedIds;
  List<FeedMemberResponse> get updated;

  /// Create a copy of UpdateFeedMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateFeedMembersResponseCopyWith<UpdateFeedMembersResponse> get copyWith =>
      _$UpdateFeedMembersResponseCopyWithImpl<UpdateFeedMembersResponse>(
          this as UpdateFeedMembersResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateFeedMembersResponse &&
            const DeepCollectionEquality().equals(other.added, added) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other.removedIds, removedIds) &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(added),
      duration,
      const DeepCollectionEquality().hash(removedIds),
      const DeepCollectionEquality().hash(updated));

  @override
  String toString() {
    return 'UpdateFeedMembersResponse(added: $added, duration: $duration, removedIds: $removedIds, updated: $updated)';
  }
}

/// @nodoc
abstract mixin class $UpdateFeedMembersResponseCopyWith<$Res> {
  factory $UpdateFeedMembersResponseCopyWith(UpdateFeedMembersResponse value,
          $Res Function(UpdateFeedMembersResponse) _then) =
      _$UpdateFeedMembersResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<FeedMemberResponse> added,
      String duration,
      List<String> removedIds,
      List<FeedMemberResponse> updated});
}

/// @nodoc
class _$UpdateFeedMembersResponseCopyWithImpl<$Res>
    implements $UpdateFeedMembersResponseCopyWith<$Res> {
  _$UpdateFeedMembersResponseCopyWithImpl(this._self, this._then);

  final UpdateFeedMembersResponse _self;
  final $Res Function(UpdateFeedMembersResponse) _then;

  /// Create a copy of UpdateFeedMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? added = null,
    Object? duration = null,
    Object? removedIds = null,
    Object? updated = null,
  }) {
    return _then(UpdateFeedMembersResponse(
      added: null == added
          ? _self.added
          : added // ignore: cast_nullable_to_non_nullable
              as List<FeedMemberResponse>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      removedIds: null == removedIds
          ? _self.removedIds
          : removedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updated: null == updated
          ? _self.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as List<FeedMemberResponse>,
    ));
  }
}

// dart format on
