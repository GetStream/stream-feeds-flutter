import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'attachment_gallery_footer.dart';
import 'attachment_gallery_header.dart';
import 'attachment_metadata.dart';

/// Chrome overlay for the attachment gallery containing header and footer.
///
/// Displays the header with author info and timestamp at the top, and the footer
/// with attachment index at the bottom. Both elements animate in opposite directions
/// when visibility changes.
class AttachmentGalleryChrome extends StatelessWidget {
  const AttachmentGalleryChrome({
    super.key,
    required this.isVisible,
    required this.metadata,
    required this.currentAttachment,
    required this.currentIndex,
    required this.totalCount,
  });

  /// Whether the chrome elements should be visible.
  final bool isVisible;

  /// Metadata containing author and timestamp information.
  final AttachmentMetadata metadata;

  /// The currently displayed attachment.
  final Attachment currentAttachment;

  /// The current attachment index (1-based).
  final int currentIndex;

  /// The total number of attachments.
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Top chrome - slides up when hidden
        AnimatedSlide(
          offset: isVisible ? Offset.zero : const Offset(0, -1),
          duration: kThemeAnimationDuration,
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: isVisible ? 1.0 : 0.0,
            duration: kThemeAnimationDuration,
            curve: Curves.easeInOut,
            child: AttachmentGalleryHeader(
              metadata: metadata,
              currentAttachment: currentAttachment,
            ),
          ),
        ),
        // Bottom chrome - slides down when hidden
        AnimatedSlide(
          offset: isVisible ? Offset.zero : const Offset(0, 1),
          duration: kThemeAnimationDuration,
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: isVisible ? 1.0 : 0.0,
            duration: kThemeAnimationDuration,
            curve: Curves.easeInOut,
            child: AttachmentGalleryFooter(
              currentIndex: currentIndex,
              totalCount: totalCount,
            ),
          ),
        ),
      ],
    );
  }
}
