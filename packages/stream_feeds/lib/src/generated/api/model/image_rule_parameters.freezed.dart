// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_rule_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageRuleParameters {
  List<String>? get harmLabels;
  int get threshold;
  String get timeWindow;

  /// Create a copy of ImageRuleParameters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageRuleParametersCopyWith<ImageRuleParameters> get copyWith =>
      _$ImageRuleParametersCopyWithImpl<ImageRuleParameters>(
          this as ImageRuleParameters, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageRuleParameters &&
            const DeepCollectionEquality()
                .equals(other.harmLabels, harmLabels) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.timeWindow, timeWindow) ||
                other.timeWindow == timeWindow));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(harmLabels), threshold, timeWindow);

  @override
  String toString() {
    return 'ImageRuleParameters(harmLabels: $harmLabels, threshold: $threshold, timeWindow: $timeWindow)';
  }
}

/// @nodoc
abstract mixin class $ImageRuleParametersCopyWith<$Res> {
  factory $ImageRuleParametersCopyWith(
          ImageRuleParameters value, $Res Function(ImageRuleParameters) _then) =
      _$ImageRuleParametersCopyWithImpl;
  @useResult
  $Res call({List<String>? harmLabels, int threshold, String timeWindow});
}

/// @nodoc
class _$ImageRuleParametersCopyWithImpl<$Res>
    implements $ImageRuleParametersCopyWith<$Res> {
  _$ImageRuleParametersCopyWithImpl(this._self, this._then);

  final ImageRuleParameters _self;
  final $Res Function(ImageRuleParameters) _then;

  /// Create a copy of ImageRuleParameters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? harmLabels = freezed,
    Object? threshold = null,
    Object? timeWindow = null,
  }) {
    return _then(ImageRuleParameters(
      harmLabels: freezed == harmLabels
          ? _self.harmLabels
          : harmLabels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      threshold: null == threshold
          ? _self.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as int,
      timeWindow: null == timeWindow
          ? _self.timeWindow
          : timeWindow // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
