// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'own_batch_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OwnBatchRequest {

 List<String> get feeds; List<String>? get fields;
/// Create a copy of OwnBatchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnBatchRequestCopyWith<OwnBatchRequest> get copyWith => _$OwnBatchRequestCopyWithImpl<OwnBatchRequest>(this as OwnBatchRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnBatchRequest&&const DeepCollectionEquality().equals(other.feeds, feeds)&&const DeepCollectionEquality().equals(other.fields, fields));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(feeds),const DeepCollectionEquality().hash(fields));

@override
String toString() {
  return 'OwnBatchRequest(feeds: $feeds, fields: $fields)';
}


}

/// @nodoc
abstract mixin class $OwnBatchRequestCopyWith<$Res>  {
  factory $OwnBatchRequestCopyWith(OwnBatchRequest value, $Res Function(OwnBatchRequest) _then) = _$OwnBatchRequestCopyWithImpl;
@useResult
$Res call({
 List<String> feeds, List<String>? fields
});




}
/// @nodoc
class _$OwnBatchRequestCopyWithImpl<$Res>
    implements $OwnBatchRequestCopyWith<$Res> {
  _$OwnBatchRequestCopyWithImpl(this._self, this._then);

  final OwnBatchRequest _self;
  final $Res Function(OwnBatchRequest) _then;

/// Create a copy of OwnBatchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? feeds = null,Object? fields = freezed,}) {
  return _then(OwnBatchRequest(
feeds: null == feeds ? _self.feeds : feeds // ignore: cast_nullable_to_non_nullable
as List<String>,fields: freezed == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}



// dart format on
