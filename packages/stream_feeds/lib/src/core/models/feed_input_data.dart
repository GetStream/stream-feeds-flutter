import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import 'feed_member_request_data.dart';

part 'feed_input_data.freezed.dart';

/// Input data for creating or updating a feed.
///
/// Contains feed configuration including name, description, visibility
/// settings, member list, and custom metadata.
@freezed
class FeedInputData with _$FeedInputData {
  /// Creates a new instance of [FeedInputData].
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
  final Map<String, Object>? custom;
}

/// Extension type representing the visibility settings for a feed.
///
/// This extension type defines the different visibility levels that can be applied to a feed,
/// controlling who can access, view, and interact with the feed content.
///
/// By implementing String, it automatically handles any custom visibility values
/// returned from the API while providing type safety for common values.
extension type const FeedVisibility(String value) implements String {
  /// Feed is visible only to followers.
  static const followers = FeedVisibility('followers');

  /// Feed is visible only to members.
  static const members = FeedVisibility('members');

  /// Feed is private and only visible to the owner.
  static const private = FeedVisibility('private');

  /// Feed is publicly visible to everyone.
  static const public = FeedVisibility('public');

  /// Feed is visible (general visibility setting).
  static const visible = FeedVisibility('visible');

  /// Represents an unknown visibility setting.
  static const unknown = FeedVisibility('unknown');
}

/// Converts a [api.FeedInput] to a [FeedInputData] model.
extension FeedInputMapper on api.FeedInput {
  FeedInputData toModel() {
    return FeedInputData(
      description: description,
      name: name,
      visibility: visibility?.toModel(),
      filterTags: [...?filterTags],
      members: [...?members?.map((e) => e.toModel())],
      custom: {...?custom},
    );
  }
}

/// Converts a [api.FeedInputVisibility] to a [FeedVisibility] model.
extension FeedInputVisibilityEnumMapper on api.FeedInputVisibility {
  /// Converts this API visibility enum to a domain [FeedVisibility] extension type.
  ///
  /// This now works automatically since FeedVisibility implements String,
  /// and any API string value is handled seamlessly.
  FeedVisibility toModel() {
    return switch (this) {
      api.FeedInputVisibility.followers => FeedVisibility.followers,
      api.FeedInputVisibility.members => FeedVisibility.members,
      api.FeedInputVisibility.private => FeedVisibility.private,
      api.FeedInputVisibility.public => FeedVisibility.public,
      api.FeedInputVisibility.visible => FeedVisibility.visible,
      api.FeedInputVisibility.unknown => FeedVisibility.unknown,
    };
  }
}

/// Converts a [FeedInputData] to a [api.FeedInput] request model.
extension FeedInputDataMapper on FeedInputData {
  api.FeedInput toRequest() {
    return api.FeedInput(
      description: description,
      name: name,
      visibility: visibility?.toRequest(),
      filterTags: filterTags.takeIf((it) => it.isNotEmpty),
      members: members
          .takeIf((it) => it.isNotEmpty)
          ?.map((e) => e.toRequest())
          .toList(),
      custom: custom,
    );
  }
}

/// Converts a [FeedVisibility] to a [api.FeedInputVisibility] request model.
extension FeedVisibilityMapper on FeedVisibility {
  /// Converts this visibility extension type to an API enum.
  ///
  /// For known values, maps to the corresponding enum value.
  /// For unknown values, defaults to api.FeedInputVisibility.unknown.
  api.FeedInputVisibility toRequest() {
    return switch (value) {
      FeedVisibility.followers => api.FeedInputVisibility.followers,
      FeedVisibility.members => api.FeedInputVisibility.members,
      FeedVisibility.private => api.FeedInputVisibility.private,
      FeedVisibility.public => api.FeedInputVisibility.public,
      FeedVisibility.visible => api.FeedInputVisibility.visible,
      _ => api.FeedInputVisibility.unknown,
    };
  }
}
