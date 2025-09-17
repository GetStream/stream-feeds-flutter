// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sfuid_last_seen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SFUIDLastSeen {
  String get id;
  DateTime get lastSeen;
  int get processStartTime;

  /// Create a copy of SFUIDLastSeen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SFUIDLastSeenCopyWith<SFUIDLastSeen> get copyWith =>
      _$SFUIDLastSeenCopyWithImpl<SFUIDLastSeen>(
          this as SFUIDLastSeen, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SFUIDLastSeen &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.processStartTime, processStartTime) ||
                other.processStartTime == processStartTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, lastSeen, processStartTime);

  @override
  String toString() {
    return 'SFUIDLastSeen(id: $id, lastSeen: $lastSeen, processStartTime: $processStartTime)';
  }
}

/// @nodoc
abstract mixin class $SFUIDLastSeenCopyWith<$Res> {
  factory $SFUIDLastSeenCopyWith(
          SFUIDLastSeen value, $Res Function(SFUIDLastSeen) _then) =
      _$SFUIDLastSeenCopyWithImpl;
  @useResult
  $Res call({String id, DateTime lastSeen, int processStartTime});
}

/// @nodoc
class _$SFUIDLastSeenCopyWithImpl<$Res>
    implements $SFUIDLastSeenCopyWith<$Res> {
  _$SFUIDLastSeenCopyWithImpl(this._self, this._then);

  final SFUIDLastSeen _self;
  final $Res Function(SFUIDLastSeen) _then;

  /// Create a copy of SFUIDLastSeen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastSeen = null,
    Object? processStartTime = null,
  }) {
    return _then(SFUIDLastSeen(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeen: null == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      processStartTime: null == processStartTime
          ? _self.processStartTime
          : processStartTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
