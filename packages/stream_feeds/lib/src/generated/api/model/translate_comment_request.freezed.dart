// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translate_comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslateCommentRequest {
  String get language;

  /// Create a copy of TranslateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TranslateCommentRequestCopyWith<TranslateCommentRequest> get copyWith =>
      _$TranslateCommentRequestCopyWithImpl<TranslateCommentRequest>(
        this as TranslateCommentRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TranslateCommentRequest &&
            (identical(other.language, language) || other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'TranslateCommentRequest(language: $language)';
  }
}

/// @nodoc
abstract mixin class $TranslateCommentRequestCopyWith<$Res> {
  factory $TranslateCommentRequestCopyWith(
    TranslateCommentRequest value,
    $Res Function(TranslateCommentRequest) _then,
  ) = _$TranslateCommentRequestCopyWithImpl;
  @useResult
  $Res call({String language});
}

/// @nodoc
class _$TranslateCommentRequestCopyWithImpl<$Res> implements $TranslateCommentRequestCopyWith<$Res> {
  _$TranslateCommentRequestCopyWithImpl(this._self, this._then);

  final TranslateCommentRequest _self;
  final $Res Function(TranslateCommentRequest) _then;

  /// Create a copy of TranslateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? language = null}) {
    return _then(
      TranslateCommentRequest(
        language: null == language
            ? _self.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
