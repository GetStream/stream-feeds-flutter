import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stream_feed/stream_feed.dart';

import '../../theme/extensions/theme_extensions.dart';

/// A horizontal list widget that displays attachment previews with remove functionality.
///
/// Shows selected images and videos in a scrollable horizontal list with
/// remove buttons for each attachment. Supports both file paths and
/// StreamAttachment objects for upload management.
class AttachmentPreviewList extends StatelessWidget {
  const AttachmentPreviewList({
    super.key,
    required this.attachments,
    required this.onRemoveAttachment,
  });

  /// List of StreamAttachment objects to display as previews.
  final List<StreamAttachment> attachments;

  /// Callback when user taps remove button on an attachment.
  final void Function(StreamAttachment attachment) onRemoveAttachment;

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: attachments.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final attachment = attachments[index];
          return _AttachmentPreviewItem(
            attachment: attachment,
            onRemove: () => onRemoveAttachment(attachment),
          );
        },
      ),
    );
  }
}

class _AttachmentPreviewItem extends StatelessWidget {
  const _AttachmentPreviewItem({
    required this.attachment,
    required this.onRemove,
  });

  final StreamAttachment attachment;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.appColors.barsBg,
              border: Border.all(
                color: context.appColors.borders,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildPreview(context),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: context.appColors.overlayDark,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: context.appColors.appBg,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreview(BuildContext context) {
    // Use the attachment type to determine preview
    if (attachment.isImage) {
      return _buildImagePreview(context);
    } else if (attachment.isVideo) {
      return _buildVideoPreview(context);
    }

    // Fallback for other attachment types
    return _buildGenericPreview(context);
  }

  Widget _buildImagePreview(BuildContext context) {
    // Use the file path for native platforms
    if (!kIsWeb && attachment.file.path.isNotEmpty) {
      final file = File(attachment.file.path);
      return Image.file(
        file,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return _buildGenericPreview(context);
        },
      );
    }

    return _buildGenericPreview(context);
  }

  Widget _buildVideoPreview(BuildContext context) {
    return ColoredBox(
      color: context.appColors.barsBg,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_circle_outline,
              color: context.appColors.textHighEmphasis,
              size: 32,
            ),
            const SizedBox(height: 4),
            Text(
              'Video',
              style: context.appTextStyles.captionBold.copyWith(
                color: context.appColors.textLowEmphasis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenericPreview(BuildContext context) {
    return ColoredBox(
      color: context.appColors.barsBg,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.attachment,
              color: context.appColors.textHighEmphasis,
              size: 32,
            ),
            const SizedBox(height: 4),
            Text(
              'File',
              style: context.appTextStyles.captionBold.copyWith(
                color: context.appColors.textLowEmphasis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
