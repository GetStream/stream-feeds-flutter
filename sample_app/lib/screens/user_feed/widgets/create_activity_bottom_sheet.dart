import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../widgets/attachments/attachments.dart';
import '../../../widgets/user_avatar.dart';

/// A bottom sheet for creating new activities with text and attachments.
///
/// Provides a modern compose interface similar to popular social media apps
/// with text input, character counter, attachment selection, and post functionality.
/// Returns a [FeedAddActivityRequest] when the user completes the form.
class CreateActivityBottomSheet extends StatefulWidget {
  const CreateActivityBottomSheet({
    super.key,
    required this.currentUser,
    required this.feedId,
  });

  /// The current user creating the activity.
  final User currentUser;

  /// The feed ID where the activity will be posted.
  final FeedId feedId;

  @override
  State<CreateActivityBottomSheet> createState() =>
      _CreateActivityBottomSheetState();
}

class _CreateActivityBottomSheetState extends State<CreateActivityBottomSheet> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  final List<StreamAttachment> _attachments = [];

  static const int _maxCharacters = 280;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.appColors.appBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            _buildHeader(context),

            // Content
            _buildUserInputSection(context),

            // Attachment preview
            AttachmentPreviewList(
              attachments: _attachments,
              onRemoveAttachment: _removeAttachment,
            ),

            // Attachment picker
            AttachmentPicker(
              onAttachmentsSelected: _addAttachments,
            ),

            // Spacing at the bottom
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.appColors.borders,
          ),
        ),
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: context.appTextStyles.bodyBold.copyWith(
                color: context.appColors.textLowEmphasis,
              ),
            ),
          ),
          const Spacer(),
          Text(
            'New Post',
            style: context.appTextStyles.headlineBold,
          ),
          const Spacer(),
          FilledButton(
            onPressed: _canPost ? _createActivity : null,
            style: FilledButton.styleFrom(
              backgroundColor: context.appColors.accentPrimary,
              foregroundColor: context.appColors.appBg,
            ),
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInputSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User avatar
          UserAvatar(user: widget.currentUser),

          // Text input area
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text input
                TextFormField(
                  maxLines: null,
                  controller: _textController,
                  focusNode: _focusNode,
                  maxLength: _maxCharacters,
                  style: context.appTextStyles.body,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: "What's happening?",
                    hintStyle: context.appTextStyles.body.copyWith(
                      color: context.appColors.textLowEmphasis,
                    ),
                    border: InputBorder.none,
                    counterStyle: context.appTextStyles.footnote.copyWith(
                      color: context.appColors.textLowEmphasis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool get _canPost {
    final hasText = _textController.text.trim().isNotEmpty;
    final hasAttachments = _attachments.isNotEmpty;

    return hasText || hasAttachments;
  }

  void _addAttachments(List<StreamAttachment> newAttachments) {
    setState(() => _attachments.addAll(newAttachments));
  }

  void _removeAttachment(StreamAttachment attachment) {
    setState(() => _attachments.remove(attachment));
  }

  void _createActivity() {
    if (!_canPost) return;

    final text = _textController.text.trim();

    final request = FeedAddActivityRequest(
      type: 'post',
      feeds: [widget.feedId.rawValue],
      text: text.takeIf((it) => it.isNotEmpty),
      attachmentUploads: _attachments.isNotEmpty ? _attachments : null,
    );

    // Return the request to the parent for handling
    Navigator.pop(context, request);
  }
}
