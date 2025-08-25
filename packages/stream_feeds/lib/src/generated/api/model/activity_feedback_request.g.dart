// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feedback_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityFeedbackRequest _$ActivityFeedbackRequestFromJson(
        Map<String, dynamic> json) =>
    ActivityFeedbackRequest(
      hide: json['hide'] as bool?,
      muteUser: json['mute_user'] as bool?,
      reason: json['reason'] as String?,
      report: json['report'] as bool?,
      showLess: json['show_less'] as bool?,
    );

Map<String, dynamic> _$ActivityFeedbackRequestToJson(
        ActivityFeedbackRequest instance) =>
    <String, dynamic>{
      'hide': instance.hide,
      'mute_user': instance.muteUser,
      'reason': instance.reason,
      'report': instance.report,
      'show_less': instance.showLess,
    };
