// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_builder_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RuleBuilderCondition {
  double? get confidence;
  ContentCountRuleParameters? get contentCountRuleParams;
  ImageContentParameters? get imageContentParams;
  ImageRuleParameters? get imageRuleParams;
  TextContentParameters? get textContentParams;
  TextRuleParameters? get textRuleParams;
  String get type;
  UserCreatedWithinParameters? get userCreatedWithinParams;
  UserRuleParameters? get userRuleParams;
  VideoContentParameters? get videoContentParams;
  VideoRuleParameters? get videoRuleParams;

  /// Create a copy of RuleBuilderCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RuleBuilderConditionCopyWith<RuleBuilderCondition> get copyWith =>
      _$RuleBuilderConditionCopyWithImpl<RuleBuilderCondition>(
          this as RuleBuilderCondition, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RuleBuilderCondition &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.contentCountRuleParams, contentCountRuleParams) ||
                other.contentCountRuleParams == contentCountRuleParams) &&
            (identical(other.imageContentParams, imageContentParams) ||
                other.imageContentParams == imageContentParams) &&
            (identical(other.imageRuleParams, imageRuleParams) ||
                other.imageRuleParams == imageRuleParams) &&
            (identical(other.textContentParams, textContentParams) ||
                other.textContentParams == textContentParams) &&
            (identical(other.textRuleParams, textRuleParams) ||
                other.textRuleParams == textRuleParams) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(
                    other.userCreatedWithinParams, userCreatedWithinParams) ||
                other.userCreatedWithinParams == userCreatedWithinParams) &&
            (identical(other.userRuleParams, userRuleParams) ||
                other.userRuleParams == userRuleParams) &&
            (identical(other.videoContentParams, videoContentParams) ||
                other.videoContentParams == videoContentParams) &&
            (identical(other.videoRuleParams, videoRuleParams) ||
                other.videoRuleParams == videoRuleParams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      confidence,
      contentCountRuleParams,
      imageContentParams,
      imageRuleParams,
      textContentParams,
      textRuleParams,
      type,
      userCreatedWithinParams,
      userRuleParams,
      videoContentParams,
      videoRuleParams);

  @override
  String toString() {
    return 'RuleBuilderCondition(confidence: $confidence, contentCountRuleParams: $contentCountRuleParams, imageContentParams: $imageContentParams, imageRuleParams: $imageRuleParams, textContentParams: $textContentParams, textRuleParams: $textRuleParams, type: $type, userCreatedWithinParams: $userCreatedWithinParams, userRuleParams: $userRuleParams, videoContentParams: $videoContentParams, videoRuleParams: $videoRuleParams)';
  }
}

/// @nodoc
abstract mixin class $RuleBuilderConditionCopyWith<$Res> {
  factory $RuleBuilderConditionCopyWith(RuleBuilderCondition value,
          $Res Function(RuleBuilderCondition) _then) =
      _$RuleBuilderConditionCopyWithImpl;
  @useResult
  $Res call(
      {double? confidence,
      ContentCountRuleParameters? contentCountRuleParams,
      ImageContentParameters? imageContentParams,
      ImageRuleParameters? imageRuleParams,
      TextContentParameters? textContentParams,
      TextRuleParameters? textRuleParams,
      String type,
      UserCreatedWithinParameters? userCreatedWithinParams,
      UserRuleParameters? userRuleParams,
      VideoContentParameters? videoContentParams,
      VideoRuleParameters? videoRuleParams});
}

/// @nodoc
class _$RuleBuilderConditionCopyWithImpl<$Res>
    implements $RuleBuilderConditionCopyWith<$Res> {
  _$RuleBuilderConditionCopyWithImpl(this._self, this._then);

  final RuleBuilderCondition _self;
  final $Res Function(RuleBuilderCondition) _then;

  /// Create a copy of RuleBuilderCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confidence = freezed,
    Object? contentCountRuleParams = freezed,
    Object? imageContentParams = freezed,
    Object? imageRuleParams = freezed,
    Object? textContentParams = freezed,
    Object? textRuleParams = freezed,
    Object? type = null,
    Object? userCreatedWithinParams = freezed,
    Object? userRuleParams = freezed,
    Object? videoContentParams = freezed,
    Object? videoRuleParams = freezed,
  }) {
    return _then(RuleBuilderCondition(
      confidence: freezed == confidence
          ? _self.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
      contentCountRuleParams: freezed == contentCountRuleParams
          ? _self.contentCountRuleParams
          : contentCountRuleParams // ignore: cast_nullable_to_non_nullable
              as ContentCountRuleParameters?,
      imageContentParams: freezed == imageContentParams
          ? _self.imageContentParams
          : imageContentParams // ignore: cast_nullable_to_non_nullable
              as ImageContentParameters?,
      imageRuleParams: freezed == imageRuleParams
          ? _self.imageRuleParams
          : imageRuleParams // ignore: cast_nullable_to_non_nullable
              as ImageRuleParameters?,
      textContentParams: freezed == textContentParams
          ? _self.textContentParams
          : textContentParams // ignore: cast_nullable_to_non_nullable
              as TextContentParameters?,
      textRuleParams: freezed == textRuleParams
          ? _self.textRuleParams
          : textRuleParams // ignore: cast_nullable_to_non_nullable
              as TextRuleParameters?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      userCreatedWithinParams: freezed == userCreatedWithinParams
          ? _self.userCreatedWithinParams
          : userCreatedWithinParams // ignore: cast_nullable_to_non_nullable
              as UserCreatedWithinParameters?,
      userRuleParams: freezed == userRuleParams
          ? _self.userRuleParams
          : userRuleParams // ignore: cast_nullable_to_non_nullable
              as UserRuleParameters?,
      videoContentParams: freezed == videoContentParams
          ? _self.videoContentParams
          : videoContentParams // ignore: cast_nullable_to_non_nullable
              as VideoContentParameters?,
      videoRuleParams: freezed == videoRuleParams
          ? _self.videoRuleParams
          : videoRuleParams // ignore: cast_nullable_to_non_nullable
              as VideoRuleParameters?,
    ));
  }
}

// dart format on
