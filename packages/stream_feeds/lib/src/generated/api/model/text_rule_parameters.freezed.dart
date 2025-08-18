// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_rule_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextRuleParameters {
  List<String>? get blocklistMatch;
  bool? get containsUrl;
  List<String>? get harmLabels;
  String? get severity;
  int get threshold;
  String get timeWindow;

  /// Create a copy of TextRuleParameters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TextRuleParametersCopyWith<TextRuleParameters> get copyWith =>
      _$TextRuleParametersCopyWithImpl<TextRuleParameters>(
          this as TextRuleParameters, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextRuleParameters &&
            const DeepCollectionEquality()
                .equals(other.blocklistMatch, blocklistMatch) &&
            (identical(other.containsUrl, containsUrl) ||
                other.containsUrl == containsUrl) &&
            const DeepCollectionEquality()
                .equals(other.harmLabels, harmLabels) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.timeWindow, timeWindow) ||
                other.timeWindow == timeWindow));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(blocklistMatch),
      containsUrl,
      const DeepCollectionEquality().hash(harmLabels),
      severity,
      threshold,
      timeWindow);

  @override
  String toString() {
    return 'TextRuleParameters(blocklistMatch: $blocklistMatch, containsUrl: $containsUrl, harmLabels: $harmLabels, severity: $severity, threshold: $threshold, timeWindow: $timeWindow)';
  }
}

/// @nodoc
abstract mixin class $TextRuleParametersCopyWith<$Res> {
  factory $TextRuleParametersCopyWith(
          TextRuleParameters value, $Res Function(TextRuleParameters) _then) =
      _$TextRuleParametersCopyWithImpl;
  @useResult
  $Res call(
      {List<String>? blocklistMatch,
      bool? containsUrl,
      List<String>? harmLabels,
      String? severity,
      int threshold,
      String timeWindow});
}

/// @nodoc
class _$TextRuleParametersCopyWithImpl<$Res>
    implements $TextRuleParametersCopyWith<$Res> {
  _$TextRuleParametersCopyWithImpl(this._self, this._then);

  final TextRuleParameters _self;
  final $Res Function(TextRuleParameters) _then;

  /// Create a copy of TextRuleParameters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocklistMatch = freezed,
    Object? containsUrl = freezed,
    Object? harmLabels = freezed,
    Object? severity = freezed,
    Object? threshold = null,
    Object? timeWindow = null,
  }) {
    return _then(TextRuleParameters(
      blocklistMatch: freezed == blocklistMatch
          ? _self.blocklistMatch
          : blocklistMatch // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      containsUrl: freezed == containsUrl
          ? _self.containsUrl
          : containsUrl // ignore: cast_nullable_to_non_nullable
              as bool?,
      harmLabels: freezed == harmLabels
          ? _self.harmLabels
          : harmLabels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      severity: freezed == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String?,
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
