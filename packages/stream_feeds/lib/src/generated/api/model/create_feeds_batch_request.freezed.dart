// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_feeds_batch_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateFeedsBatchRequest {
  List<FeedRequest> get feeds;

  /// Create a copy of CreateFeedsBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateFeedsBatchRequestCopyWith<CreateFeedsBatchRequest> get copyWith =>
      _$CreateFeedsBatchRequestCopyWithImpl<CreateFeedsBatchRequest>(
          this as CreateFeedsBatchRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateFeedsBatchRequest &&
            const DeepCollectionEquality().equals(other.feeds, feeds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(feeds));

  @override
  String toString() {
    return 'CreateFeedsBatchRequest(feeds: $feeds)';
  }
}

/// @nodoc
abstract mixin class $CreateFeedsBatchRequestCopyWith<$Res> {
  factory $CreateFeedsBatchRequestCopyWith(CreateFeedsBatchRequest value,
          $Res Function(CreateFeedsBatchRequest) _then) =
      _$CreateFeedsBatchRequestCopyWithImpl;
  @useResult
  $Res call({List<FeedRequest> feeds});
}

/// @nodoc
class _$CreateFeedsBatchRequestCopyWithImpl<$Res>
    implements $CreateFeedsBatchRequestCopyWith<$Res> {
  _$CreateFeedsBatchRequestCopyWithImpl(this._self, this._then);

  final CreateFeedsBatchRequest _self;
  final $Res Function(CreateFeedsBatchRequest) _then;

  /// Create a copy of CreateFeedsBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feeds = null,
  }) {
    return _then(CreateFeedsBatchRequest(
      feeds: null == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<FeedRequest>,
    ));
  }
}

// dart format on
