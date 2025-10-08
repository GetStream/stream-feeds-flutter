// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_feedback_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityFeedbackRequest {
  bool? get hide;
  bool? get muteUser;
  String? get reason;
  bool? get report;
  bool? get showLess;
  bool? get showMore;

  /// Create a copy of ActivityFeedbackRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityFeedbackRequestCopyWith<ActivityFeedbackRequest> get copyWith =>
      _$ActivityFeedbackRequestCopyWithImpl<ActivityFeedbackRequest>(
          this as ActivityFeedbackRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityFeedbackRequest &&
            (identical(other.hide, hide) || other.hide == hide) &&
            (identical(other.muteUser, muteUser) ||
                other.muteUser == muteUser) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.showLess, showLess) ||
                other.showLess == showLess) &&
            (identical(other.showMore, showMore) ||
                other.showMore == showMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hide, muteUser, reason, report, showLess, showMore);

  @override
  String toString() {
    return 'ActivityFeedbackRequest(hide: $hide, muteUser: $muteUser, reason: $reason, report: $report, showLess: $showLess, showMore: $showMore)';
  }
}

/// @nodoc
abstract mixin class $ActivityFeedbackRequestCopyWith<$Res> {
  factory $ActivityFeedbackRequestCopyWith(ActivityFeedbackRequest value,
          $Res Function(ActivityFeedbackRequest) _then) =
      _$ActivityFeedbackRequestCopyWithImpl;
  @useResult
  $Res call(
      {bool? hide,
      bool? muteUser,
      String? reason,
      bool? report,
      bool? showLess,
      bool? showMore});
}

/// @nodoc
class _$ActivityFeedbackRequestCopyWithImpl<$Res>
    implements $ActivityFeedbackRequestCopyWith<$Res> {
  _$ActivityFeedbackRequestCopyWithImpl(this._self, this._then);

  final ActivityFeedbackRequest _self;
  final $Res Function(ActivityFeedbackRequest) _then;

  /// Create a copy of ActivityFeedbackRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hide = freezed,
    Object? muteUser = freezed,
    Object? reason = freezed,
    Object? report = freezed,
    Object? showLess = freezed,
    Object? showMore = freezed,
  }) {
    return _then(ActivityFeedbackRequest(
      hide: freezed == hide
          ? _self.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool?,
      muteUser: freezed == muteUser
          ? _self.muteUser
          : muteUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      report: freezed == report
          ? _self.report
          : report // ignore: cast_nullable_to_non_nullable
              as bool?,
      showLess: freezed == showLess
          ? _self.showLess
          : showLess // ignore: cast_nullable_to_non_nullable
              as bool?,
      showMore: freezed == showMore
          ? _self.showMore
          : showMore // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
