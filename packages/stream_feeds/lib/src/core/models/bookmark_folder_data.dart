import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generated/api/models.dart' as api;

part 'bookmark_folder_data.freezed.dart';

/// A bookmark folder in the Stream Feeds system.
///
/// A folder for organizing saved bookmarks with name, description, and
/// creation metadata.
@freezed
class BookmarkFolderData with _$BookmarkFolderData {
  /// Creates a new instance of [BookmarkFolderData].
  const BookmarkFolderData({
    required this.createdAt,
    required this.id,
    required this.name,
    required this.updatedAt,
    this.custom,
  });

  /// The date the folder was created.
  @override
  final DateTime createdAt;

  /// Unique identifier for the folder.
  @override
  final String id;

  /// Name of the folder.
  @override
  final String name;

  /// The date the folder was last updated.
  @override
  final DateTime updatedAt;

  /// Optional custom data as a map.
  @override
  final Map<String, Object>? custom;
}

/// Extension function to convert a [api.BookmarkFolderResponse] to a [BookmarkFolderData] model.
extension BookmarkFolderResponseMapper on api.BookmarkFolderResponse {
  /// Converts this API bookmark folder response to a domain [BookmarkFolderData] instance.
  ///
  /// Returns a [BookmarkFolderData] instance containing all the folder information
  /// from the API response with proper type conversions and null handling.
  BookmarkFolderData toModel() {
    return BookmarkFolderData(
      createdAt: createdAt,
      id: id,
      name: name,
      updatedAt: updatedAt,
      custom: custom,
    );
  }
}
