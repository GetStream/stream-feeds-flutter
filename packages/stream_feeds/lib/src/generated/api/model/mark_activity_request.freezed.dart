// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_activity_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarkActivityRequest {
  bool? get markAllRead;
  bool? get markAllSeen;
  List<String>? get markRead;
  List<String>? get markSeen;
  List<String>? get markWatched;

  /// Create a copy of MarkActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MarkActivityRequestCopyWith<MarkActivityRequest> get copyWith =>
      _$MarkActivityRequestCopyWithImpl<MarkActivityRequest>(
          this as MarkActivityRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkActivityRequest &&
            (identical(other.markAllRead, markAllRead) ||
                other.markAllRead == markAllRead) &&
            (identical(other.markAllSeen, markAllSeen) ||
                other.markAllSeen == markAllSeen) &&
            const DeepCollectionEquality().equals(other.markRead, markRead) &&
            const DeepCollectionEquality().equals(other.markSeen, markSeen) &&
            const DeepCollectionEquality()
                .equals(other.markWatched, markWatched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      markAllRead,
      markAllSeen,
      const DeepCollectionEquality().hash(markRead),
      const DeepCollectionEquality().hash(markSeen),
      const DeepCollectionEquality().hash(markWatched));

  @override
  String toString() {
    return 'MarkActivityRequest(markAllRead: $markAllRead, markAllSeen: $markAllSeen, markRead: $markRead, markSeen: $markSeen, markWatched: $markWatched)';
  }
}

/// @nodoc
abstract mixin class $MarkActivityRequestCopyWith<$Res> {
  factory $MarkActivityRequestCopyWith(
          MarkActivityRequest value, $Res Function(MarkActivityRequest) _then) =
      _$MarkActivityRequestCopyWithImpl;
  @useResult
  $Res call(
      {bool? markAllRead,
      bool? markAllSeen,
      List<String>? markRead,
      List<String>? markSeen,
      List<String>? markWatched});
}

/// @nodoc
class _$MarkActivityRequestCopyWithImpl<$Res>
    implements $MarkActivityRequestCopyWith<$Res> {
  _$MarkActivityRequestCopyWithImpl(this._self, this._then);

  final MarkActivityRequest _self;
  final $Res Function(MarkActivityRequest) _then;

  /// Create a copy of MarkActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markAllRead = freezed,
    Object? markAllSeen = freezed,
    Object? markRead = freezed,
    Object? markSeen = freezed,
    Object? markWatched = freezed,
  }) {
    return _then(MarkActivityRequest(
      markAllRead: freezed == markAllRead
          ? _self.markAllRead
          : markAllRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      markAllSeen: freezed == markAllSeen
          ? _self.markAllSeen
          : markAllSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      markRead: freezed == markRead
          ? _self.markRead
          : markRead // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      markSeen: freezed == markSeen
          ? _self.markSeen
          : markSeen // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      markWatched: freezed == markWatched
          ? _self.markWatched
          : markWatched // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
