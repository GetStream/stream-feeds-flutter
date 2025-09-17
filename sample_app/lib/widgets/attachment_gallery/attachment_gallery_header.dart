import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../theme/extensions/theme_extensions.dart';
import '../../utils/date_time_extensions.dart';
import 'attachment_metadata.dart';

class AttachmentGalleryHeader extends StatelessWidget {
  const AttachmentGalleryHeader({
    super.key,
    required this.metadata,
    required this.currentAttachment,
  });

  final AttachmentMetadata metadata;
  final Attachment currentAttachment;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: context.appColors.barsBg,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            metadata.author.name ?? 'Unknown User',
            style: context.appTextStyles.headlineBold,
          ),
          Text(
            metadata.createdAt.displayRelativeTime,
            style: context.appTextStyles.footnote.copyWith(
              color: context.appColors.textLowEmphasis,
            ),
          ),
        ],
      ),
    );
  }
}
