// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_reviewed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkReviewedRequest _$MarkReviewedRequestFromJson(Map<String, dynamic> json) =>
    MarkReviewedRequest(
      contentToMarkAsReviewedLimit:
          (json['content_to_mark_as_reviewed_limit'] as num?)?.toInt(),
      decisionReason: json['decision_reason'] as String?,
      disableMarkingContentAsReviewed:
          json['disable_marking_content_as_reviewed'] as bool?,
    );

Map<String, dynamic> _$MarkReviewedRequestToJson(
        MarkReviewedRequest instance) =>
    <String, dynamic>{
      'content_to_mark_as_reviewed_limit':
          instance.contentToMarkAsReviewedLimit,
      'decision_reason': instance.decisionReason,
      'disable_marking_content_as_reviewed':
          instance.disableMarkingContentAsReviewed,
    };
