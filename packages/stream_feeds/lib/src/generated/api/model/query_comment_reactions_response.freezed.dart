// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_comment_reactions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryCommentReactionsResponse {
  String get duration;
  String? get next;
  String? get prev;
  List<FeedsReactionResponse> get reactions;

  /// Create a copy of QueryCommentReactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryCommentReactionsResponseCopyWith<QueryCommentReactionsResponse>
      get copyWith => _$QueryCommentReactionsResponseCopyWithImpl<
              QueryCommentReactionsResponse>(
          this as QueryCommentReactionsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryCommentReactionsResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            const DeepCollectionEquality().equals(other.reactions, reactions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, next, prev,
      const DeepCollectionEquality().hash(reactions));

  @override
  String toString() {
    return 'QueryCommentReactionsResponse(duration: $duration, next: $next, prev: $prev, reactions: $reactions)';
  }
}

/// @nodoc
abstract mixin class $QueryCommentReactionsResponseCopyWith<$Res> {
  factory $QueryCommentReactionsResponseCopyWith(
          QueryCommentReactionsResponse value,
          $Res Function(QueryCommentReactionsResponse) _then) =
      _$QueryCommentReactionsResponseCopyWithImpl;
  @useResult
  $Res call(
      {String duration,
      String? next,
      String? prev,
      List<FeedsReactionResponse> reactions});
}

/// @nodoc
class _$QueryCommentReactionsResponseCopyWithImpl<$Res>
    implements $QueryCommentReactionsResponseCopyWith<$Res> {
  _$QueryCommentReactionsResponseCopyWithImpl(this._self, this._then);

  final QueryCommentReactionsResponse _self;
  final $Res Function(QueryCommentReactionsResponse) _then;

  /// Create a copy of QueryCommentReactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? reactions = null,
  }) {
    return _then(QueryCommentReactionsResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      reactions: null == reactions
          ? _self.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<FeedsReactionResponse>,
    ));
  }
}

// dart format on
