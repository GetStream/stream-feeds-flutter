// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comments_batch_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentsBatchRequest _$AddCommentsBatchRequestFromJson(
        Map<String, dynamic> json) =>
    AddCommentsBatchRequest(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => AddCommentRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddCommentsBatchRequestToJson(
        AddCommentsBatchRequest instance) =>
    <String, dynamic>{
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };
