import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generated/api/models.dart' as api;

part 'user_data.freezed.dart';

/// A user in the Stream Feeds system.
///
/// The primary actor who creates activities, reacts to content, and participates
/// in feeds. Contains profile data, authentication status, social relationships,
/// and moderation controls.
@freezed
class UserData with _$UserData {
  /// Creates a new [UserData] instance.
  const UserData({
    required this.banned,
    this.blockedUserIds = const [],
    required this.createdAt,
    this.deactivatedAt,
    this.deletedAt,
    required this.id,
    this.image,
    this.language,
    this.lastActive,
    this.name,
    required this.online,
    this.revokeTokensIssuedBefore,
    required this.role,
    this.teams = const [],
    required this.updatedAt,
    this.custom = const {},
  });

  /// Whether the user is banned.
  @override
  final bool banned;

  /// A list of user IDs that are blocked by this user.
  @override
  final List<String> blockedUserIds;

  /// The date and time when the user was created.
  @override
  final DateTime createdAt;

  /// The date and time when the user was deactivated, if applicable.
  @override
  final DateTime? deactivatedAt;

  /// The date and time when the user was deleted, if applicable.
  @override
  final DateTime? deletedAt;

  /// The unique identifier for the user.
  @override
  final String id;

  /// The URL of the user's profile image, if available.
  @override
  final String? image;

  /// The preferred language of the user, if specified.
  @override
  final String? language;

  /// The date and time when the user was last active, if available.
  @override
  final DateTime? lastActive;

  /// The name of the user, if available.
  @override
  final String? name;

  /// Whether the user is currently online.
  @override
  final bool online;

  /// The date and time before which tokens should be revoked, if applicable.
  @override
  final DateTime? revokeTokensIssuedBefore;

  /// The role of the user in the system.
  @override
  final String role;

  /// A list of team IDs that the user is associated with.
  @override
  final List<String> teams;

  /// The date and time when the user data was last updated.
  @override
  final DateTime updatedAt;

  /// A map of custom attributes associated with the user.
  @override
  final Map<String, Object> custom;
}

/// Extension function to convert a [api.UserResponse] to a [UserData] model.
extension UserResponseMapper on api.UserResponse {
  /// Converts this API user response to a domain [UserData] instance.
  ///
  /// Returns a [UserData] instance containing all the user information
  /// from the API response with proper type conversions and null handling.
  UserData toModel() {
    return UserData(
      banned: banned,
      blockedUserIds: blockedUserIds,
      createdAt: createdAt,
      custom: custom,
      deactivatedAt: deactivatedAt,
      deletedAt: deletedAt,
      id: id,
      image: image,
      language: language,
      lastActive: lastActive,
      name: name,
      online: online,
      revokeTokensIssuedBefore: revokeTokensIssuedBefore,
      role: role,
      teams: teams,
      updatedAt: updatedAt,
    );
  }
}
