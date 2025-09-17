import 'package:stream_feeds/stream_feeds.dart';

/// Metadata for displaying attachments in the gallery.
///
/// Encapsulates all the necessary information for displaying attachment details
/// including author information, timestamps, and content context without coupling
/// the gallery to specific domain models.
class AttachmentMetadata {
  const AttachmentMetadata({
    required this.author,
    required this.createdAt,
    this.caption,
  });

  /// The author of the content.
  final UserData author;

  /// When the content was created.
  final DateTime createdAt;

  /// Optional text caption associated with the attachments.
  final String? caption;
}
