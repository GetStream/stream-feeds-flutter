// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unfollow_batch_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnfollowBatchRequest {
  bool? get deleteNotificationActivity;
  bool? get enrichOwnFields;
  List<UnfollowPair> get follows;

  /// Create a copy of UnfollowBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnfollowBatchRequestCopyWith<UnfollowBatchRequest> get copyWith =>
      _$UnfollowBatchRequestCopyWithImpl<UnfollowBatchRequest>(
        this as UnfollowBatchRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnfollowBatchRequest &&
            (identical(
                  other.deleteNotificationActivity,
                  deleteNotificationActivity,
                ) ||
                other.deleteNotificationActivity == deleteNotificationActivity) &&
            (identical(other.enrichOwnFields, enrichOwnFields) || other.enrichOwnFields == enrichOwnFields) &&
            const DeepCollectionEquality().equals(other.follows, follows));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    deleteNotificationActivity,
    enrichOwnFields,
    const DeepCollectionEquality().hash(follows),
  );

  @override
  String toString() {
    return 'UnfollowBatchRequest(deleteNotificationActivity: $deleteNotificationActivity, enrichOwnFields: $enrichOwnFields, follows: $follows)';
  }
}

/// @nodoc
abstract mixin class $UnfollowBatchRequestCopyWith<$Res> {
  factory $UnfollowBatchRequestCopyWith(
    UnfollowBatchRequest value,
    $Res Function(UnfollowBatchRequest) _then,
  ) = _$UnfollowBatchRequestCopyWithImpl;
  @useResult
  $Res call({
    bool? deleteNotificationActivity,
    bool? enrichOwnFields,
    List<UnfollowPair> follows,
  });
}

/// @nodoc
class _$UnfollowBatchRequestCopyWithImpl<$Res> implements $UnfollowBatchRequestCopyWith<$Res> {
  _$UnfollowBatchRequestCopyWithImpl(this._self, this._then);

  final UnfollowBatchRequest _self;
  final $Res Function(UnfollowBatchRequest) _then;

  /// Create a copy of UnfollowBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleteNotificationActivity = freezed,
    Object? enrichOwnFields = freezed,
    Object? follows = null,
  }) {
    return _then(
      UnfollowBatchRequest(
        deleteNotificationActivity: freezed == deleteNotificationActivity
            ? _self.deleteNotificationActivity
            : deleteNotificationActivity // ignore: cast_nullable_to_non_nullable
                  as bool?,
        enrichOwnFields: freezed == enrichOwnFields
            ? _self.enrichOwnFields
            : enrichOwnFields // ignore: cast_nullable_to_non_nullable
                  as bool?,
        follows: null == follows
            ? _self.follows
            : follows // ignore: cast_nullable_to_non_nullable
                  as List<UnfollowPair>,
      ),
    );
  }
}
