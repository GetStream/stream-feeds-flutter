// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedListState {
  List<FeedData> get feeds;
  PaginationData? get pagination;

  /// Create a copy of FeedListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedListStateCopyWith<FeedListState> get copyWith =>
      _$FeedListStateCopyWithImpl<FeedListState>(
          this as FeedListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedListState &&
            const DeepCollectionEquality().equals(other.feeds, feeds) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(feeds), pagination);

  @override
  String toString() {
    return 'FeedListState(feeds: $feeds, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $FeedListStateCopyWith<$Res> {
  factory $FeedListStateCopyWith(
          FeedListState value, $Res Function(FeedListState) _then) =
      _$FeedListStateCopyWithImpl;
  @useResult
  $Res call({List<FeedData> feeds, PaginationData? pagination});
}

/// @nodoc
class _$FeedListStateCopyWithImpl<$Res>
    implements $FeedListStateCopyWith<$Res> {
  _$FeedListStateCopyWithImpl(this._self, this._then);

  final FeedListState _self;
  final $Res Function(FeedListState) _then;

  /// Create a copy of FeedListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feeds = null,
    Object? pagination = freezed,
  }) {
    return _then(FeedListState(
      feeds: null == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<FeedData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on
