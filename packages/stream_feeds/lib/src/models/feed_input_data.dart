import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart';
import 'feed_member_request_data.dart';

part 'feed_input_data.freezed.dart';

/// Input data for creating or updating a feed.
///
/// Contains feed configuration including name, description, visibility
/// settings, member list, and custom metadata.
@freezed
class FeedInputData with _$FeedInputData {
  /// Creates a new [FeedInputData] instance.
  const FeedInputData({
    this.description,
    this.name,
    this.visibility,
    this.filterTags = const [],
    this.members = const [],
    this.custom,
  });

  /// A description of the feed. This property provides a human-readable
  /// description of the feed's purpose or content. It may be `null` if no
  /// description is provided.
  @override
  final String? description;

  /// The name of the feed. This property provides a human-readable name for the feed.
  /// It may be `null` if no name is specified.
  @override
  final String? name;

  /// The visibility settings for the feed. This property controls who can
  /// access and interact with the feed. It may be `null` to use default
  /// visibility settings.
  @override
  final FeedVisibility? visibility;

  /// A list of tags used for content filtering. This property contains tags
  /// that can be used to filter content within the feed. An empty list means
  /// no tag-based filtering is applied.
  @override
  final List<String> filterTags;

  /// A list of initial members to add to the feed. This property contains the
  /// member configurations including user IDs, roles, and invitation settings.
  /// An empty list means no initial members are configured.
  @override
  final List<FeedMemberRequestData> members;

  /// Custom data associated with the feed. This property allows for storing
  /// additional metadata or custom fields specific to your application's needs.
  /// An empty map means no custom data is associated with the feed.
  @override
  final Map<String, Object?>? custom;
}

/// Deprecated members kept so code written against earlier versions compiles.
extension FeedVisibilityValue on FeedVisibility {
  /// The raw value.
  @Deprecated('FeedVisibility is a String; use it directly.')
  String get value => this;

  /// Returns this visibility unchanged: the request takes a [FeedVisibility].
  @Deprecated('FeedVisibility is the request type; pass it directly.')
  FeedVisibility toRequest() => this;
}

/// Converts a [FeedInput] to a [FeedInputData] model.
extension FeedInputMapper on FeedInput {
  FeedInputData toModel() {
    return FeedInputData(
      description: description,
      name: name,
      visibility: visibility,
      filterTags: [...?filterTags],
      members: [...?members?.map((e) => e.toModel())],
      custom: custom,
    );
  }
}

/// Converts a [FeedInputData] to a [FeedInput] request model.
extension FeedInputDataMapper on FeedInputData {
  FeedInput toRequest() {
    return FeedInput(
      description: description,
      name: name,
      visibility: visibility,
      filterTags: filterTags.takeIf((it) => it.isNotEmpty),
      members: members.takeIf((it) => it.isNotEmpty)?.map((e) => e.toRequest()).toList(),
      custom: custom,
    );
  }
}
