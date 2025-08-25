// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_updates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModelUpdates<T> {
  List<T> get added;
  List<String> get removedIds;
  List<T> get updated;

  /// Create a copy of ModelUpdates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModelUpdatesCopyWith<T, ModelUpdates<T>> get copyWith =>
      _$ModelUpdatesCopyWithImpl<T, ModelUpdates<T>>(
          this as ModelUpdates<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModelUpdates<T> &&
            const DeepCollectionEquality().equals(other.added, added) &&
            const DeepCollectionEquality()
                .equals(other.removedIds, removedIds) &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(added),
      const DeepCollectionEquality().hash(removedIds),
      const DeepCollectionEquality().hash(updated));

  @override
  String toString() {
    return 'ModelUpdates<$T>(added: $added, removedIds: $removedIds, updated: $updated)';
  }
}

/// @nodoc
abstract mixin class $ModelUpdatesCopyWith<T, $Res> {
  factory $ModelUpdatesCopyWith(
          ModelUpdates<T> value, $Res Function(ModelUpdates<T>) _then) =
      _$ModelUpdatesCopyWithImpl;
  @useResult
  $Res call({List<T> added, List<String> removedIds, List<T> updated});
}

/// @nodoc
class _$ModelUpdatesCopyWithImpl<T, $Res>
    implements $ModelUpdatesCopyWith<T, $Res> {
  _$ModelUpdatesCopyWithImpl(this._self, this._then);

  final ModelUpdates<T> _self;
  final $Res Function(ModelUpdates<T>) _then;

  /// Create a copy of ModelUpdates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? added = null,
    Object? removedIds = null,
    Object? updated = null,
  }) {
    return _then(ModelUpdates(
      added: null == added
          ? _self.added
          : added // ignore: cast_nullable_to_non_nullable
              as List<T>,
      removedIds: null == removedIds
          ? _self.removedIds
          : removedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updated: null == updated
          ? _self.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

// dart format on
