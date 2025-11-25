// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feedback_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityFeedbackRequest _$ActivityFeedbackRequestFromJson(
        Map<String, dynamic> json) =>
    ActivityFeedbackRequest(
      hide: json['hide'] as bool?,
      showLess: json['show_less'] as bool?,
      showMore: json['show_more'] as bool?,
    );

Map<String, dynamic> _$ActivityFeedbackRequestToJson(
        ActivityFeedbackRequest instance) =>
    <String, dynamic>{
      'hide': instance.hide,
      'show_less': instance.showLess,
      'show_more': instance.showMore,
    };
