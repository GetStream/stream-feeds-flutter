// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_activity_reactions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryActivityReactionsResponse {
  String get duration;
  String? get next;
  String? get prev;
  List<FeedsReactionResponse> get reactions;

  /// Create a copy of QueryActivityReactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryActivityReactionsResponseCopyWith<QueryActivityReactionsResponse>
      get copyWith => _$QueryActivityReactionsResponseCopyWithImpl<
              QueryActivityReactionsResponse>(
          this as QueryActivityReactionsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryActivityReactionsResponse &&
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
    return 'QueryActivityReactionsResponse(duration: $duration, next: $next, prev: $prev, reactions: $reactions)';
  }
}

/// @nodoc
abstract mixin class $QueryActivityReactionsResponseCopyWith<$Res> {
  factory $QueryActivityReactionsResponseCopyWith(
          QueryActivityReactionsResponse value,
          $Res Function(QueryActivityReactionsResponse) _then) =
      _$QueryActivityReactionsResponseCopyWithImpl;
  @useResult
  $Res call(
      {String duration,
      String? next,
      String? prev,
      List<FeedsReactionResponse> reactions});
}

/// @nodoc
class _$QueryActivityReactionsResponseCopyWithImpl<$Res>
    implements $QueryActivityReactionsResponseCopyWith<$Res> {
  _$QueryActivityReactionsResponseCopyWithImpl(this._self, this._then);

  final QueryActivityReactionsResponse _self;
  final $Res Function(QueryActivityReactionsResponse) _then;

  /// Create a copy of QueryActivityReactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? reactions = null,
  }) {
    return _then(QueryActivityReactionsResponse(
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
