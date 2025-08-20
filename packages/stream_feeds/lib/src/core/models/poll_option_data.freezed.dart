// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_option_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollOptionData {
  String get id;
  String get text;
  Map<String, Object>? get custom;

  /// Create a copy of PollOptionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollOptionDataCopyWith<PollOptionData> get copyWith =>
      _$PollOptionDataCopyWithImpl<PollOptionData>(
          this as PollOptionData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollOptionData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, text, const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'PollOptionData(id: $id, text: $text, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $PollOptionDataCopyWith<$Res> {
  factory $PollOptionDataCopyWith(
          PollOptionData value, $Res Function(PollOptionData) _then) =
      _$PollOptionDataCopyWithImpl;
  @useResult
  $Res call({String id, String text, Map<String, Object>? custom});
}

/// @nodoc
class _$PollOptionDataCopyWithImpl<$Res>
    implements $PollOptionDataCopyWith<$Res> {
  _$PollOptionDataCopyWithImpl(this._self, this._then);

  final PollOptionData _self;
  final $Res Function(PollOptionData) _then;

  /// Create a copy of PollOptionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? custom = freezed,
  }) {
    return _then(PollOptionData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
