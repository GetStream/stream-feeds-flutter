// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_feeds_batch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateFeedsBatchResponse {
  String get duration;
  List<FeedResponse> get feeds;

  /// Create a copy of CreateFeedsBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateFeedsBatchResponseCopyWith<CreateFeedsBatchResponse> get copyWith =>
      _$CreateFeedsBatchResponseCopyWithImpl<CreateFeedsBatchResponse>(
          this as CreateFeedsBatchResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateFeedsBatchResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other.feeds, feeds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, duration, const DeepCollectionEquality().hash(feeds));

  @override
  String toString() {
    return 'CreateFeedsBatchResponse(duration: $duration, feeds: $feeds)';
  }
}

/// @nodoc
abstract mixin class $CreateFeedsBatchResponseCopyWith<$Res> {
  factory $CreateFeedsBatchResponseCopyWith(CreateFeedsBatchResponse value,
          $Res Function(CreateFeedsBatchResponse) _then) =
      _$CreateFeedsBatchResponseCopyWithImpl;
  @useResult
  $Res call({String duration, List<FeedResponse> feeds});
}

/// @nodoc
class _$CreateFeedsBatchResponseCopyWithImpl<$Res>
    implements $CreateFeedsBatchResponseCopyWith<$Res> {
  _$CreateFeedsBatchResponseCopyWithImpl(this._self, this._then);

  final CreateFeedsBatchResponse _self;
  final $Res Function(CreateFeedsBatchResponse) _then;

  /// Create a copy of CreateFeedsBatchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? feeds = null,
  }) {
    return _then(CreateFeedsBatchResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      feeds: null == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<FeedResponse>,
    ));
  }
}

// dart format on
