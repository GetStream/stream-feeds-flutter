//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.g.dart';
part 'api_helper.g.dart';
part 'api_exception.g.dart';
part 'auth/authentication.g.dart';
part 'auth/api_key_auth.g.dart';
part 'auth/oauth.g.dart';
part 'auth/http_basic_auth.g.dart';
part 'auth/http_bearer_auth.g.dart';

part 'api/default_api.g.dart';

part 'model/api_error.g.dart';
part 'model/action.g.dart';
part 'model/activity_added_event.g.dart';
part 'model/activity_deleted_event.g.dart';
part 'model/activity_location.g.dart';
part 'model/activity_mark_event.g.dart';
part 'model/activity_pinned_event.g.dart';
part 'model/activity_reaction_added_event.g.dart';
part 'model/activity_reaction_deleted_event.g.dart';
part 'model/activity_reaction_updated_event.g.dart';
part 'model/activity_removed_from_feed_event.g.dart';
part 'model/activity_response.g.dart';
part 'model/activity_unpinned_event.g.dart';
part 'model/activity_updated_event.g.dart';
part 'model/aggregated_activity_response.g.dart';
part 'model/app_event_response.g.dart';
part 'model/app_updated_event.g.dart';
part 'model/attachment.g.dart';
part 'model/block_list_options.g.dart';
part 'model/bookmark_added_event.g.dart';
part 'model/bookmark_deleted_event.g.dart';
part 'model/bookmark_folder_deleted_event.g.dart';
part 'model/bookmark_folder_response.g.dart';
part 'model/bookmark_folder_updated_event.g.dart';
part 'model/bookmark_response.g.dart';
part 'model/bookmark_updated_event.g.dart';
part 'model/channel_config_with_info.g.dart';
part 'model/channel_member.g.dart';
part 'model/channel_mute.g.dart';
part 'model/channel_own_capability.g.dart';
part 'model/channel_response.g.dart';
part 'model/command.g.dart';
part 'model/comment_added_event.g.dart';
part 'model/comment_deleted_event.g.dart';
part 'model/comment_reaction_added_event.g.dart';
part 'model/comment_reaction_deleted_event.g.dart';
part 'model/comment_reaction_updated_event.g.dart';
part 'model/comment_response.g.dart';
part 'model/comment_updated_event.g.dart';
part 'model/device_response.g.dart';
part 'model/feed_created_event.g.dart';
part 'model/feed_deleted_event.g.dart';
part 'model/feed_group.g.dart';
part 'model/feed_group_changed_event.g.dart';
part 'model/feed_group_deleted_event.g.dart';
part 'model/feed_member_added_event.g.dart';
part 'model/feed_member_removed_event.g.dart';
part 'model/feed_member_response.g.dart';
part 'model/feed_member_updated_event.g.dart';
part 'model/feed_response.g.dart';
part 'model/feed_updated_event.g.dart';
part 'model/feeds_reaction_response.g.dart';
part 'model/field.g.dart';
part 'model/file_upload_config.g.dart';
part 'model/follow_created_event.g.dart';
part 'model/follow_deleted_event.g.dart';
part 'model/follow_response.g.dart';
part 'model/follow_updated_event.g.dart';
part 'model/health_check_event.g.dart';
part 'model/image_data.g.dart';
part 'model/images.g.dart';
part 'model/label_thresholds.g.dart';
part 'model/moderation_v2_response.g.dart';
part 'model/notification_config.g.dart';
part 'model/notification_feed_updated_event.g.dart';
part 'model/notification_status_response.g.dart';
part 'model/own_user_response.g.dart';
part 'model/pin_activity_response.g.dart';
part 'model/poll_closed_feed_event.g.dart';
part 'model/poll_deleted_feed_event.g.dart';
part 'model/poll_option_response_data.g.dart';
part 'model/poll_response_data.g.dart';
part 'model/poll_updated_feed_event.g.dart';
part 'model/poll_vote_casted_feed_event.g.dart';
part 'model/poll_vote_changed_feed_event.g.dart';
part 'model/poll_vote_removed_feed_event.g.dart';
part 'model/poll_vote_response_data.g.dart';
part 'model/privacy_settings.g.dart';
part 'model/privacy_settings_response.g.dart';
part 'model/push_preferences.g.dart';
part 'model/reaction_group_response.g.dart';
part 'model/read_receipts.g.dart';
part 'model/read_receipts_response.g.dart';
part 'model/stories_config.g.dart';
part 'model/thresholds.g.dart';
part 'model/typing_indicators.g.dart';
part 'model/typing_indicators_response.g.dart';
part 'model/user.g.dart';
part 'model/user_banned_event.g.dart';
part 'model/user_deactivated_event.g.dart';
part 'model/user_mute_response.g.dart';
part 'model/user_muted_event.g.dart';
part 'model/user_reactivated_event.g.dart';
part 'model/user_response.g.dart';
part 'model/user_response_common_fields.g.dart';
part 'model/user_response_privacy_fields.g.dart';
part 'model/user_updated_event.g.dart';
part 'model/ws_client_event.g.dart';
part 'model/ws_event.g.dart';

/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
ApiClient defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) =>
    pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
