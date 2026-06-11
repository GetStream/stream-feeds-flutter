// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_reactions_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendReactionsOptions {

 bool? get enabled; int? get limit; FriendReactionsOptionsType? get type;
/// Create a copy of FriendReactionsOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendReactionsOptionsCopyWith<FriendReactionsOptions> get copyWith => _$FriendReactionsOptionsCopyWithImpl<FriendReactionsOptions>(this as FriendReactionsOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendReactionsOptions&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,limit,type);

@override
String toString() {
  return 'FriendReactionsOptions(enabled: $enabled, limit: $limit, type: $type)';
}


}

/// @nodoc
abstract mixin class $FriendReactionsOptionsCopyWith<$Res>  {
  factory $FriendReactionsOptionsCopyWith(FriendReactionsOptions value, $Res Function(FriendReactionsOptions) _then) = _$FriendReactionsOptionsCopyWithImpl;
@useResult
$Res call({
 bool? enabled, int? limit, FriendReactionsOptionsType? type
});




}
/// @nodoc
class _$FriendReactionsOptionsCopyWithImpl<$Res>
    implements $FriendReactionsOptionsCopyWith<$Res> {
  _$FriendReactionsOptionsCopyWithImpl(this._self, this._then);

  final FriendReactionsOptions _self;
  final $Res Function(FriendReactionsOptions) _then;

/// Create a copy of FriendReactionsOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = freezed,Object? limit = freezed,Object? type = freezed,}) {
  return _then(FriendReactionsOptions(
enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FriendReactionsOptionsType?,
  ));
}

}



// dart format on
