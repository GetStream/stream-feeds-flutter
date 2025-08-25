// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderation_config_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModerationConfigListState {
  List<ModerationConfigData> get configs;
  PaginationData? get pagination;

  /// Create a copy of ModerationConfigListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModerationConfigListStateCopyWith<ModerationConfigListState> get copyWith =>
      _$ModerationConfigListStateCopyWithImpl<ModerationConfigListState>(
          this as ModerationConfigListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModerationConfigListState &&
            const DeepCollectionEquality().equals(other.configs, configs) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(configs), pagination);

  @override
  String toString() {
    return 'ModerationConfigListState(configs: $configs, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $ModerationConfigListStateCopyWith<$Res> {
  factory $ModerationConfigListStateCopyWith(ModerationConfigListState value,
          $Res Function(ModerationConfigListState) _then) =
      _$ModerationConfigListStateCopyWithImpl;
  @useResult
  $Res call({List<ModerationConfigData> configs, PaginationData? pagination});
}

/// @nodoc
class _$ModerationConfigListStateCopyWithImpl<$Res>
    implements $ModerationConfigListStateCopyWith<$Res> {
  _$ModerationConfigListStateCopyWithImpl(this._self, this._then);

  final ModerationConfigListState _self;
  final $Res Function(ModerationConfigListState) _then;

  /// Create a copy of ModerationConfigListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configs = null,
    Object? pagination = freezed,
  }) {
    return _then(ModerationConfigListState(
      configs: null == configs
          ? _self.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as List<ModerationConfigData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on
