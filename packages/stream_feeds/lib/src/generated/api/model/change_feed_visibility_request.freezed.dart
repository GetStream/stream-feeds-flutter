// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_feed_visibility_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangeFeedVisibilityRequest {
  ChangeFeedVisibilityRequestPendingFollowsAction? get pendingFollowsAction;
  ChangeFeedVisibilityRequestVisibility get visibility;

  /// Create a copy of ChangeFeedVisibilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangeFeedVisibilityRequestCopyWith<ChangeFeedVisibilityRequest> get copyWith =>
      _$ChangeFeedVisibilityRequestCopyWithImpl<ChangeFeedVisibilityRequest>(
        this as ChangeFeedVisibilityRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeFeedVisibilityRequest &&
            (identical(other.pendingFollowsAction, pendingFollowsAction) ||
                other.pendingFollowsAction == pendingFollowsAction) &&
            (identical(other.visibility, visibility) || other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pendingFollowsAction, visibility);

  @override
  String toString() {
    return 'ChangeFeedVisibilityRequest(pendingFollowsAction: $pendingFollowsAction, visibility: $visibility)';
  }
}

/// @nodoc
abstract mixin class $ChangeFeedVisibilityRequestCopyWith<$Res> {
  factory $ChangeFeedVisibilityRequestCopyWith(
    ChangeFeedVisibilityRequest value,
    $Res Function(ChangeFeedVisibilityRequest) _then,
  ) = _$ChangeFeedVisibilityRequestCopyWithImpl;
  @useResult
  $Res call({
    ChangeFeedVisibilityRequestPendingFollowsAction? pendingFollowsAction,
    ChangeFeedVisibilityRequestVisibility visibility,
  });
}

/// @nodoc
class _$ChangeFeedVisibilityRequestCopyWithImpl<$Res> implements $ChangeFeedVisibilityRequestCopyWith<$Res> {
  _$ChangeFeedVisibilityRequestCopyWithImpl(this._self, this._then);

  final ChangeFeedVisibilityRequest _self;
  final $Res Function(ChangeFeedVisibilityRequest) _then;

  /// Create a copy of ChangeFeedVisibilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingFollowsAction = freezed,
    Object? visibility = null,
  }) {
    return _then(
      ChangeFeedVisibilityRequest(
        pendingFollowsAction: freezed == pendingFollowsAction
            ? _self.pendingFollowsAction
            : pendingFollowsAction // ignore: cast_nullable_to_non_nullable
                  as ChangeFeedVisibilityRequestPendingFollowsAction?,
        visibility: null == visibility
            ? _self.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as ChangeFeedVisibilityRequestVisibility,
      ),
    );
  }
}
