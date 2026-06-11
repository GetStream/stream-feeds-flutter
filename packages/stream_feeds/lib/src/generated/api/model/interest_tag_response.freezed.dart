// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interest_tag_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InterestTagResponse {

 int get count; String get tag;
/// Create a copy of InterestTagResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterestTagResponseCopyWith<InterestTagResponse> get copyWith => _$InterestTagResponseCopyWithImpl<InterestTagResponse>(this as InterestTagResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterestTagResponse&&(identical(other.count, count) || other.count == count)&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,count,tag);

@override
String toString() {
  return 'InterestTagResponse(count: $count, tag: $tag)';
}


}

/// @nodoc
abstract mixin class $InterestTagResponseCopyWith<$Res>  {
  factory $InterestTagResponseCopyWith(InterestTagResponse value, $Res Function(InterestTagResponse) _then) = _$InterestTagResponseCopyWithImpl;
@useResult
$Res call({
 int count, String tag
});




}
/// @nodoc
class _$InterestTagResponseCopyWithImpl<$Res>
    implements $InterestTagResponseCopyWith<$Res> {
  _$InterestTagResponseCopyWithImpl(this._self, this._then);

  final InterestTagResponse _self;
  final $Res Function(InterestTagResponse) _then;

/// Create a copy of InterestTagResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? tag = null,}) {
  return _then(InterestTagResponse(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



// dart format on
