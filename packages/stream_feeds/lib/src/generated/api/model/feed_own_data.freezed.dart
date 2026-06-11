// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_own_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedOwnData {

 List<FeedOwnDataOwnCapabilities>? get ownCapabilities; List<FollowResponse>? get ownFollowings; List<FollowResponse>? get ownFollows; FeedMemberResponse? get ownMembership;
/// Create a copy of FeedOwnData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedOwnDataCopyWith<FeedOwnData> get copyWith => _$FeedOwnDataCopyWithImpl<FeedOwnData>(this as FeedOwnData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedOwnData&&const DeepCollectionEquality().equals(other.ownCapabilities, ownCapabilities)&&const DeepCollectionEquality().equals(other.ownFollowings, ownFollowings)&&const DeepCollectionEquality().equals(other.ownFollows, ownFollows)&&(identical(other.ownMembership, ownMembership) || other.ownMembership == ownMembership));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ownCapabilities),const DeepCollectionEquality().hash(ownFollowings),const DeepCollectionEquality().hash(ownFollows),ownMembership);

@override
String toString() {
  return 'FeedOwnData(ownCapabilities: $ownCapabilities, ownFollowings: $ownFollowings, ownFollows: $ownFollows, ownMembership: $ownMembership)';
}


}

/// @nodoc
abstract mixin class $FeedOwnDataCopyWith<$Res>  {
  factory $FeedOwnDataCopyWith(FeedOwnData value, $Res Function(FeedOwnData) _then) = _$FeedOwnDataCopyWithImpl;
@useResult
$Res call({
 List<FeedOwnDataOwnCapabilities>? ownCapabilities, List<FollowResponse>? ownFollowings, List<FollowResponse>? ownFollows, FeedMemberResponse? ownMembership
});




}
/// @nodoc
class _$FeedOwnDataCopyWithImpl<$Res>
    implements $FeedOwnDataCopyWith<$Res> {
  _$FeedOwnDataCopyWithImpl(this._self, this._then);

  final FeedOwnData _self;
  final $Res Function(FeedOwnData) _then;

/// Create a copy of FeedOwnData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ownCapabilities = freezed,Object? ownFollowings = freezed,Object? ownFollows = freezed,Object? ownMembership = freezed,}) {
  return _then(FeedOwnData(
ownCapabilities: freezed == ownCapabilities ? _self.ownCapabilities : ownCapabilities // ignore: cast_nullable_to_non_nullable
as List<FeedOwnDataOwnCapabilities>?,ownFollowings: freezed == ownFollowings ? _self.ownFollowings : ownFollowings // ignore: cast_nullable_to_non_nullable
as List<FollowResponse>?,ownFollows: freezed == ownFollows ? _self.ownFollows : ownFollows // ignore: cast_nullable_to_non_nullable
as List<FollowResponse>?,ownMembership: freezed == ownMembership ? _self.ownMembership : ownMembership // ignore: cast_nullable_to_non_nullable
as FeedMemberResponse?,
  ));
}

}



// dart format on
