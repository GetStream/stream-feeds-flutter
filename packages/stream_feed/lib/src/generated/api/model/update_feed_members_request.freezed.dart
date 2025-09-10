// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_feed_members_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateFeedMembersRequest {
  int? get limit;
  List<FeedMemberRequest>? get members;
  String? get next;
  UpdateFeedMembersRequestOperation get operation;
  String? get prev;

  /// Create a copy of UpdateFeedMembersRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateFeedMembersRequestCopyWith<UpdateFeedMembersRequest> get copyWith =>
      _$UpdateFeedMembersRequestCopyWithImpl<UpdateFeedMembersRequest>(
          this as UpdateFeedMembersRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateFeedMembersRequest &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit,
      const DeepCollectionEquality().hash(members), next, operation, prev);

  @override
  String toString() {
    return 'UpdateFeedMembersRequest(limit: $limit, members: $members, next: $next, operation: $operation, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $UpdateFeedMembersRequestCopyWith<$Res> {
  factory $UpdateFeedMembersRequestCopyWith(UpdateFeedMembersRequest value,
          $Res Function(UpdateFeedMembersRequest) _then) =
      _$UpdateFeedMembersRequestCopyWithImpl;
  @useResult
  $Res call(
      {int? limit,
      List<FeedMemberRequest>? members,
      String? next,
      UpdateFeedMembersRequestOperation operation,
      String? prev});
}

/// @nodoc
class _$UpdateFeedMembersRequestCopyWithImpl<$Res>
    implements $UpdateFeedMembersRequestCopyWith<$Res> {
  _$UpdateFeedMembersRequestCopyWithImpl(this._self, this._then);

  final UpdateFeedMembersRequest _self;
  final $Res Function(UpdateFeedMembersRequest) _then;

  /// Create a copy of UpdateFeedMembersRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? members = freezed,
    Object? next = freezed,
    Object? operation = null,
    Object? prev = freezed,
  }) {
    return _then(UpdateFeedMembersRequest(
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      members: freezed == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<FeedMemberRequest>?,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      operation: null == operation
          ? _self.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as UpdateFeedMembersRequestOperation,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
