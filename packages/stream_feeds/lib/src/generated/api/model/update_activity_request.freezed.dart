// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_activity_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateActivityRequest {
  List<Attachment>? get attachments;
  Map<String, Object?>? get custom;
  DateTime? get expiresAt;
  List<String>? get feeds;
  List<String>? get filterTags;
  List<String>? get interestTags;
  ActivityLocation? get location;
  String? get pollId;
  String? get text;
  String? get visibility;

  /// Create a copy of UpdateActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateActivityRequestCopyWith<UpdateActivityRequest> get copyWith =>
      _$UpdateActivityRequestCopyWithImpl<UpdateActivityRequest>(
          this as UpdateActivityRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateActivityRequest &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality().equals(other.feeds, feeds) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            const DeepCollectionEquality()
                .equals(other.interestTags, interestTags) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.pollId, pollId) || other.pollId == pollId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(attachments),
      const DeepCollectionEquality().hash(custom),
      expiresAt,
      const DeepCollectionEquality().hash(feeds),
      const DeepCollectionEquality().hash(filterTags),
      const DeepCollectionEquality().hash(interestTags),
      location,
      pollId,
      text,
      visibility);

  @override
  String toString() {
    return 'UpdateActivityRequest(attachments: $attachments, custom: $custom, expiresAt: $expiresAt, feeds: $feeds, filterTags: $filterTags, interestTags: $interestTags, location: $location, pollId: $pollId, text: $text, visibility: $visibility)';
  }
}

/// @nodoc
abstract mixin class $UpdateActivityRequestCopyWith<$Res> {
  factory $UpdateActivityRequestCopyWith(UpdateActivityRequest value,
          $Res Function(UpdateActivityRequest) _then) =
      _$UpdateActivityRequestCopyWithImpl;
  @useResult
  $Res call(
      {List<Attachment>? attachments,
      Map<String, Object?>? custom,
      DateTime? expiresAt,
      List<String>? feeds,
      List<String>? filterTags,
      List<String>? interestTags,
      ActivityLocation? location,
      String? pollId,
      String? text,
      String? visibility});
}

/// @nodoc
class _$UpdateActivityRequestCopyWithImpl<$Res>
    implements $UpdateActivityRequestCopyWith<$Res> {
  _$UpdateActivityRequestCopyWithImpl(this._self, this._then);

  final UpdateActivityRequest _self;
  final $Res Function(UpdateActivityRequest) _then;

  /// Create a copy of UpdateActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = freezed,
    Object? custom = freezed,
    Object? expiresAt = freezed,
    Object? feeds = freezed,
    Object? filterTags = freezed,
    Object? interestTags = freezed,
    Object? location = freezed,
    Object? pollId = freezed,
    Object? text = freezed,
    Object? visibility = freezed,
  }) {
    return _then(UpdateActivityRequest(
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feeds: freezed == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      filterTags: freezed == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      interestTags: freezed == interestTags
          ? _self.interestTags
          : interestTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as ActivityLocation?,
      pollId: freezed == pollId
          ? _self.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: freezed == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
