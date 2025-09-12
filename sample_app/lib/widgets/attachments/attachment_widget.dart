import 'package:flutter/material.dart';
import 'package:stream_feed/stream_feed.dart';

import '../../theme/extensions/theme_extensions.dart';

/// A widget that displays an attachment.
///
/// Supports different attachment types including images, videos, and files
/// with appropriate previews, loading states, and error handling.
class AttachmentWidget extends StatelessWidget {
  const AttachmentWidget({
    super.key,
    required this.attachment,
    this.onTap,
  });

  final Attachment attachment;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appColors.disabled,
      child: InkWell(
        onTap: onTap,
        child: _buildAttachmentPreview(context),
      ),
    );
  }

  Widget _buildAttachmentPreview(BuildContext context) {
    final type = attachment.type?.toLowerCase();

    // Handle different attachment types
    return switch (type) {
      AttachmentType.image => _buildImagePreview(context),
      AttachmentType.video => _buildVideoPreview(context),
      _ => _buildFilePreview(context),
    };
  }

  Widget _buildImagePreview(BuildContext context) {
    final imageUrl = attachment.imageUrl;

    if (imageUrl == null) {
      return _buildErrorPreview(context, 'No image URL');
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorPreview(context, 'Failed to load image');
      },
    );
  }

  Widget _buildVideoPreview(BuildContext context) {
    final thumbnailUrl = attachment.thumbUrl;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Background thumbnail or placeholder
        if (thumbnailUrl != null)
          Image.network(
            thumbnailUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return _buildVideoPlaceholder(context);
            },
          )
        else
          _buildVideoPlaceholder(context),

        // Play button overlay
        ColoredBox(
          color: context.appColors.overlay,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.appColors.textHighEmphasis,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                color: context.appColors.appBg,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoPlaceholder(BuildContext context) {
    return ColoredBox(
      color: context.appColors.disabled,
      child: Center(
        child: Icon(
          Icons.videocam_rounded,
          color: context.appColors.textLowEmphasis,
          size: 32,
        ),
      ),
    );
  }

  Widget _buildFilePreview(BuildContext context) {
    final title = attachment.title ?? attachment.text ?? 'File';
    final fileType = attachment.type?.toUpperCase() ?? 'FILE';

    return ColoredBox(
      color: context.appColors.disabled,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.insert_drive_file,
              color: context.appColors.textHighEmphasis,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              fileType,
              style: context.appTextStyles.captionBold.copyWith(
                color: context.appColors.accentPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: context.appTextStyles.footnote.copyWith(
                color: context.appColors.textLowEmphasis,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorPreview(BuildContext context, String message) {
    return ColoredBox(
      color: context.appColors.disabled,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: context.appColors.accentError,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              'Error',
              style: context.appTextStyles.footnote.copyWith(
                color: context.appColors.accentError,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
