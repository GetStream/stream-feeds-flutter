// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_interest_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInterestRequest _$UserInterestRequestFromJson(Map<String, dynamic> json) => UserInterestRequest(
  tag: json['tag'] as String,
  weight: (json['weight'] as num?)?.toDouble(),
);

Map<String, dynamic> _$UserInterestRequestToJson(
  UserInterestRequest instance,
) => <String, dynamic>{'tag': instance.tag, 'weight': instance.weight};
