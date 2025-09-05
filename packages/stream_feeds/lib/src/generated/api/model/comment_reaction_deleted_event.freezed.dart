// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_reaction_deleted_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentReactionDeletedEvent {
  CommentResponse get comment;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  String? get feedVisibility;
  String get fid;
  FeedsReactionResponse get reaction;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of CommentReactionDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentReactionDeletedEventCopyWith<CommentReactionDeletedEvent>
      get copyWith => _$CommentReactionDeletedEventCopyWithImpl<
              CommentReactionDeletedEvent>(
          this as CommentReactionDeletedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentReactionDeletedEvent &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) ||
                other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      comment,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      feedVisibility,
      fid,
      reaction,
      receivedAt,
      type);

  @override
  String toString() {
    return 'CommentReactionDeletedEvent(comment: $comment, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, reaction: $reaction, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $CommentReactionDeletedEventCopyWith<$Res> {
  factory $CommentReactionDeletedEventCopyWith(
          CommentReactionDeletedEvent value,
          $Res Function(CommentReactionDeletedEvent) _then) =
      _$CommentReactionDeletedEventCopyWithImpl;
  @useResult
  $Res call(
      {CommentResponse comment,
      DateTime createdAt,
      Map<String, Object?> custom,
      String? feedVisibility,
      String fid,
      FeedsReactionResponse reaction,
      DateTime? receivedAt,
      String type});
}

/// @nodoc
class _$CommentReactionDeletedEventCopyWithImpl<$Res>
    implements $CommentReactionDeletedEventCopyWith<$Res> {
  _$CommentReactionDeletedEventCopyWithImpl(this._self, this._then);

  final CommentReactionDeletedEvent _self;
  final $Res Function(CommentReactionDeletedEvent) _then;

  /// Create a copy of CommentReactionDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? reaction = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(CommentReactionDeletedEvent(
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentResponse,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      feedVisibility: freezed == feedVisibility
          ? _self.feedVisibility
          : feedVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as String,
      reaction: null == reaction
          ? _self.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as FeedsReactionResponse,
      receivedAt: freezed == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
