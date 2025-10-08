// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'own_capabilities_batch_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OwnCapabilitiesBatchRequest {
  List<String> get feeds;

  /// Create a copy of OwnCapabilitiesBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OwnCapabilitiesBatchRequestCopyWith<OwnCapabilitiesBatchRequest>
      get copyWith => _$OwnCapabilitiesBatchRequestCopyWithImpl<
              OwnCapabilitiesBatchRequest>(
          this as OwnCapabilitiesBatchRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OwnCapabilitiesBatchRequest &&
            const DeepCollectionEquality().equals(other.feeds, feeds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(feeds));

  @override
  String toString() {
    return 'OwnCapabilitiesBatchRequest(feeds: $feeds)';
  }
}

/// @nodoc
abstract mixin class $OwnCapabilitiesBatchRequestCopyWith<$Res> {
  factory $OwnCapabilitiesBatchRequestCopyWith(
          OwnCapabilitiesBatchRequest value,
          $Res Function(OwnCapabilitiesBatchRequest) _then) =
      _$OwnCapabilitiesBatchRequestCopyWithImpl;
  @useResult
  $Res call({List<String> feeds});
}

/// @nodoc
class _$OwnCapabilitiesBatchRequestCopyWithImpl<$Res>
    implements $OwnCapabilitiesBatchRequestCopyWith<$Res> {
  _$OwnCapabilitiesBatchRequestCopyWithImpl(this._self, this._then);

  final OwnCapabilitiesBatchRequest _self;
  final $Res Function(OwnCapabilitiesBatchRequest) _then;

  /// Create a copy of OwnCapabilitiesBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feeds = null,
  }) {
    return _then(OwnCapabilitiesBatchRequest(
      feeds: null == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
