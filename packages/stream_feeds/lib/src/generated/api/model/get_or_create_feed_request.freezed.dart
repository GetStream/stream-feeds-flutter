// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_or_create_feed_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetOrCreateFeedRequest {
  Map<String, Object>? get activitySelectorOptions;
  FeedInput? get data;
  Map<String, Object>? get externalRanking;
  Map<String, Object>? get filter;
  PagerRequest? get followersPagination;
  PagerRequest? get followingPagination;
  Map<String, double>? get interestWeights;
  int? get limit;
  PagerRequest? get memberPagination;
  String? get next;
  String? get prev;
  String? get view;
  bool? get watch;

  /// Create a copy of GetOrCreateFeedRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetOrCreateFeedRequestCopyWith<GetOrCreateFeedRequest> get copyWith =>
      _$GetOrCreateFeedRequestCopyWithImpl<GetOrCreateFeedRequest>(
          this as GetOrCreateFeedRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetOrCreateFeedRequest &&
            const DeepCollectionEquality().equals(
                other.activitySelectorOptions, activitySelectorOptions) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality()
                .equals(other.externalRanking, externalRanking) &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            (identical(other.followersPagination, followersPagination) ||
                other.followersPagination == followersPagination) &&
            (identical(other.followingPagination, followingPagination) ||
                other.followingPagination == followingPagination) &&
            const DeepCollectionEquality()
                .equals(other.interestWeights, interestWeights) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.memberPagination, memberPagination) ||
                other.memberPagination == memberPagination) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.watch, watch) || other.watch == watch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activitySelectorOptions),
      data,
      const DeepCollectionEquality().hash(externalRanking),
      const DeepCollectionEquality().hash(filter),
      followersPagination,
      followingPagination,
      const DeepCollectionEquality().hash(interestWeights),
      limit,
      memberPagination,
      next,
      prev,
      view,
      watch);

  @override
  String toString() {
    return 'GetOrCreateFeedRequest(activitySelectorOptions: $activitySelectorOptions, data: $data, externalRanking: $externalRanking, filter: $filter, followersPagination: $followersPagination, followingPagination: $followingPagination, interestWeights: $interestWeights, limit: $limit, memberPagination: $memberPagination, next: $next, prev: $prev, view: $view, watch: $watch)';
  }
}

/// @nodoc
abstract mixin class $GetOrCreateFeedRequestCopyWith<$Res> {
  factory $GetOrCreateFeedRequestCopyWith(GetOrCreateFeedRequest value,
          $Res Function(GetOrCreateFeedRequest) _then) =
      _$GetOrCreateFeedRequestCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object>? activitySelectorOptions,
      FeedInput? data,
      Map<String, Object>? externalRanking,
      Map<String, Object>? filter,
      PagerRequest? followersPagination,
      PagerRequest? followingPagination,
      Map<String, double>? interestWeights,
      int? limit,
      PagerRequest? memberPagination,
      String? next,
      String? prev,
      String? view,
      bool? watch});
}

/// @nodoc
class _$GetOrCreateFeedRequestCopyWithImpl<$Res>
    implements $GetOrCreateFeedRequestCopyWith<$Res> {
  _$GetOrCreateFeedRequestCopyWithImpl(this._self, this._then);

  final GetOrCreateFeedRequest _self;
  final $Res Function(GetOrCreateFeedRequest) _then;

  /// Create a copy of GetOrCreateFeedRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activitySelectorOptions = freezed,
    Object? data = freezed,
    Object? externalRanking = freezed,
    Object? filter = freezed,
    Object? followersPagination = freezed,
    Object? followingPagination = freezed,
    Object? interestWeights = freezed,
    Object? limit = freezed,
    Object? memberPagination = freezed,
    Object? next = freezed,
    Object? prev = freezed,
    Object? view = freezed,
    Object? watch = freezed,
  }) {
    return _then(GetOrCreateFeedRequest(
      activitySelectorOptions: freezed == activitySelectorOptions
          ? _self.activitySelectorOptions
          : activitySelectorOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as FeedInput?,
      externalRanking: freezed == externalRanking
          ? _self.externalRanking
          : externalRanking // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      followersPagination: freezed == followersPagination
          ? _self.followersPagination
          : followersPagination // ignore: cast_nullable_to_non_nullable
              as PagerRequest?,
      followingPagination: freezed == followingPagination
          ? _self.followingPagination
          : followingPagination // ignore: cast_nullable_to_non_nullable
              as PagerRequest?,
      interestWeights: freezed == interestWeights
          ? _self.interestWeights
          : interestWeights // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      memberPagination: freezed == memberPagination
          ? _self.memberPagination
          : memberPagination // ignore: cast_nullable_to_non_nullable
              as PagerRequest?,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
      watch: freezed == watch
          ? _self.watch
          : watch // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
