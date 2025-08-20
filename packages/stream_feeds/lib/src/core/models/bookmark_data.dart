import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generated/api/models.dart' as api;
import 'activity_data.dart';
import 'bookmark_folder_data.dart';
import 'user_data.dart';

part 'bookmark_data.freezed.dart';

/// A bookmark in the Stream Feeds system.
///
/// Allows users to save activities for later reference. Can be organized into
/// folders and provides efficient retrieval of saved content across devices.
@freezed
class BookmarkData with _$BookmarkData {
  const BookmarkData({
    required this.activity,
    required this.createdAt,
    this.folder,
    required this.updatedAt,
    required this.user,
    this.custom,
  });

  /// The activity that has been bookmarked.
  @override
  final ActivityData activity;

  /// The date and time when the bookmark was created.
  @override
  final DateTime createdAt;

  /// The bookmark folder this bookmark belongs to, if any.
  @override
  final BookmarkFolderData? folder;

  /// The date and time when the bookmark was last updated.
  @override
  final DateTime updatedAt;

  /// The user who created the bookmark.
  @override
  final UserData user;

  /// Custom data associated with the bookmark.
  @override
  final Map<String, Object>? custom;

  /// Unique identifier for the bookmark, generated from the activity ID and the user ID.
  /// This identifier is used for simpler identification of bookmarks.
  String get id => '${activity.id}${user.id}';
}

/// Extension function to convert a [api.BookmarkResponse] to a [BookmarkData] model.
extension BookmarkResponseMapper on api.BookmarkResponse {
  /// Converts this API bookmark response to a domain [BookmarkData] instance.
  ///
  /// Returns a [BookmarkData] instance containing all the bookmark information
  /// from the API response with proper type conversions and null handling.
  BookmarkData toModel() {
    return BookmarkData(
      activity: activity.toModel(),
      createdAt: createdAt,
      folder: folder?.toModel(),
      updatedAt: updatedAt,
      user: user.toModel(),
      custom: custom,
    );
  }
}
