// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Moderation {
  String get action;
  String? get blocklistMatched;
  List<String> get imageHarms;
  String get originalText;
  bool? get platformCircumvented;
  String? get semanticFilterMatched;
  List<String> get textHarms;

  /// Create a copy of Moderation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModerationCopyWith<Moderation> get copyWith =>
      _$ModerationCopyWithImpl<Moderation>(this as Moderation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Moderation &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.blocklistMatched, blocklistMatched) ||
                other.blocklistMatched == blocklistMatched) &&
            const DeepCollectionEquality()
                .equals(other.imageHarms, imageHarms) &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText) &&
            (identical(other.platformCircumvented, platformCircumvented) ||
                other.platformCircumvented == platformCircumvented) &&
            (identical(other.semanticFilterMatched, semanticFilterMatched) ||
                other.semanticFilterMatched == semanticFilterMatched) &&
            const DeepCollectionEquality().equals(other.textHarms, textHarms));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      action,
      blocklistMatched,
      const DeepCollectionEquality().hash(imageHarms),
      originalText,
      platformCircumvented,
      semanticFilterMatched,
      const DeepCollectionEquality().hash(textHarms));

  @override
  String toString() {
    return 'Moderation(action: $action, blocklistMatched: $blocklistMatched, imageHarms: $imageHarms, originalText: $originalText, platformCircumvented: $platformCircumvented, semanticFilterMatched: $semanticFilterMatched, textHarms: $textHarms)';
  }
}

/// @nodoc
abstract mixin class $ModerationCopyWith<$Res> {
  factory $ModerationCopyWith(
          Moderation value, $Res Function(Moderation) _then) =
      _$ModerationCopyWithImpl;
  @useResult
  $Res call(
      {String action,
      String originalText,
      List<String> imageHarms,
      List<String> textHarms,
      String? blocklistMatched,
      bool? platformCircumvented,
      String? semanticFilterMatched});
}

/// @nodoc
class _$ModerationCopyWithImpl<$Res> implements $ModerationCopyWith<$Res> {
  _$ModerationCopyWithImpl(this._self, this._then);

  final Moderation _self;
  final $Res Function(Moderation) _then;

  /// Create a copy of Moderation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? originalText = null,
    Object? imageHarms = null,
    Object? textHarms = null,
    Object? blocklistMatched = freezed,
    Object? platformCircumvented = freezed,
    Object? semanticFilterMatched = freezed,
  }) {
    return _then(Moderation(
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: null == originalText
          ? _self.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      imageHarms: null == imageHarms
          ? _self.imageHarms
          : imageHarms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      textHarms: null == textHarms
          ? _self.textHarms
          : textHarms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blocklistMatched: freezed == blocklistMatched
          ? _self.blocklistMatched
          : blocklistMatched // ignore: cast_nullable_to_non_nullable
              as String?,
      platformCircumvented: freezed == platformCircumvented
          ? _self.platformCircumvented
          : platformCircumvented // ignore: cast_nullable_to_non_nullable
              as bool?,
      semanticFilterMatched: freezed == semanticFilterMatched
          ? _self.semanticFilterMatched
          : semanticFilterMatched // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
