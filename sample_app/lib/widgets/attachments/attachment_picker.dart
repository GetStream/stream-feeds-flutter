import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../screens/user_feed/polls/create_poll_state.dart';
import '../../screens/user_feed/polls/stream_poll_creator_dialog.dart';
import '../../theme/extensions/theme_extensions.dart';

/// A widget that provides attachment selection functionality.
///
/// Allows users to select images and videos from their device gallery
/// or camera, converting them to StreamAttachment objects for upload.
class AttachmentPicker extends StatelessWidget {
  const AttachmentPicker({
    super.key,
    required this.onAttachmentsSelected,
    required this.onPollCreated,
  });

  /// Callback when attachments are selected by the user.
  final void Function(List<StreamAttachment> attachments) onAttachmentsSelected;
  final void Function(CreatePollState) onPollCreated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 16,
        children: [
          _AttachmentButton(
            icon: Icons.photo_library,
            label: 'Images',
            onTap: () => _pickImages(context),
          ),
          _AttachmentButton(
            icon: Icons.videocam,
            label: 'Videos',
            onTap: () => _pickVideos(context),
          ),
          _AttachmentButton(
            icon: Icons.poll,
            label: 'Polls',
            onTap: () => _createPoll(context),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImages(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
        withData: true, // Load bytes for web compatibility
      );

      if (result != null && result.files.isNotEmpty) {
        final attachments = _convertToStreamAttachments(
          result.files,
          type: AttachmentType.image,
        );

        if (attachments.isNotEmpty) onAttachmentsSelected(attachments);
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'Failed to select images: $e');
      }
    }
  }

  Future<void> _pickVideos(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: true,
        withData: true, // Load bytes for web compatibility
      );

      if (result != null && result.files.isNotEmpty) {
        final attachments = _convertToStreamAttachments(
          result.files,
          type: AttachmentType.video,
        );

        if (attachments.isNotEmpty) onAttachmentsSelected(attachments);
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'Failed to select videos: $e');
      }
    }
  }

  Future<void> _createPoll(BuildContext context) async {
    final result = await showStreamPollCreatorDialog(context: context);
    if (result != null) {
      onPollCreated(result);
    }
  }

  List<StreamAttachment> _convertToStreamAttachments(
    List<PlatformFile> files, {
    AttachmentType type = AttachmentType.file,
  }) {
    return [
      ...files.map(
        (file) => StreamAttachment(
          type: type,
          file: AttachmentFile.fromXFile(file.xFile),
        ),
      ),
    ];
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: context.appColors.accentError,
      ),
    );
  }
}

class _AttachmentButton extends StatelessWidget {
  const _AttachmentButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: context.appColors.barsBg,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: context.appColors.borders,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: context.appColors.accentPrimary,
                  size: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: context.appTextStyles.captionBold.copyWith(
                    color: context.appColors.textLowEmphasis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
