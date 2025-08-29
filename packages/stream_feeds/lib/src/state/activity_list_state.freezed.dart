// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityListState {
  List<ActivityData> get activities;
  PaginationData? get pagination;

  /// Create a copy of ActivityListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityListStateCopyWith<ActivityListState> get copyWith =>
      _$ActivityListStateCopyWithImpl<ActivityListState>(
          this as ActivityListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityListState &&
            const DeepCollectionEquality()
                .equals(other.activities, activities) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(activities), pagination);

  @override
  String toString() {
    return 'ActivityListState(activities: $activities, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $ActivityListStateCopyWith<$Res> {
  factory $ActivityListStateCopyWith(
          ActivityListState value, $Res Function(ActivityListState) _then) =
      _$ActivityListStateCopyWithImpl;
  @useResult
  $Res call({List<ActivityData> activities, PaginationData? pagination});
}

/// @nodoc
class _$ActivityListStateCopyWithImpl<$Res>
    implements $ActivityListStateCopyWith<$Res> {
  _$ActivityListStateCopyWithImpl(this._self, this._then);

  final ActivityListState _self;
  final $Res Function(ActivityListState) _then;

  /// Create a copy of ActivityListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
    Object? pagination = freezed,
  }) {
    return _then(ActivityListState(
      activities: null == activities
          ? _self.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<ActivityData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on
