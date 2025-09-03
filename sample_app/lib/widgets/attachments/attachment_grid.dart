import 'dart:ui';

import 'package:flex_grid_view/flex_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../theme/theme.dart';
import 'attachment_widget.dart';

const _defaultGridConstraints = BoxConstraints(
  maxWidth: 300,
  maxHeight: 228,
);

/// A widget that displays attachments in an intelligent grid layout.
///
/// Uses FlexGrid to create responsive layouts that adapt based on attachment
/// count and aspect ratios, similar to modern social media platforms.
class AttachmentGrid extends StatelessWidget {
  const AttachmentGrid({
    super.key,
    required this.attachments,
    this.constraints = _defaultGridConstraints,
    this.onAttachmentTap,
    this.spacing = 2.0,
    this.runSpacing = 2.0,
  });

  final List<Attachment> attachments;
  final BoxConstraints constraints;
  final ValueSetter<Attachment>? onAttachmentTap;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      side: BorderSide(
        color: context.appColors.borders,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.circular(14),
    );

    return Container(
      constraints: constraints,
      clipBehavior: Clip.hardEdge,
      decoration: ShapeDecoration(shape: shape),
      child: switch (attachments.length) {
        1 => _buildForOne(context, attachments),
        2 => _buildForTwo(context, attachments),
        3 => _buildForThree(context, attachments),
        _ => _buildForFourOrMore(context, attachments),
      },
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final attachment = attachments[index];
    return AttachmentWidget(
      attachment: attachment,
      onTap: switch (onAttachmentTap) {
        final onTap? => () => onTap(attachment),
        _ => null,
      },
    );
  }

  Widget _buildForOne(BuildContext context, List<Attachment> attachments) {
    return FlexGrid(
      pattern: const [
        [1],
      ],
      spacing: spacing,
      runSpacing: runSpacing,
      children: [itemBuilder(context, 0)],
    );
  }

  Widget _buildForTwo(BuildContext context, List<Attachment> attachments) {
    final aspectRatio1 = attachments[0].originalSize?.aspectRatio;
    final aspectRatio2 = attachments[1].originalSize?.aspectRatio;

    // check if one image is landscape and other is portrait or vice versa
    final isLandscape1 = aspectRatio1 != null && aspectRatio1 > 1;
    final isLandscape2 = aspectRatio2 != null && aspectRatio2 > 1;

    // Both the images are landscape.
    if (isLandscape1 && isLandscape2) {
      // ----------
      // |        |
      // ----------
      // |        |
      // ----------
      return FlexGrid(
        pattern: const [
          [1],
          [1],
        ],
        spacing: spacing,
        runSpacing: runSpacing,
        children: [
          itemBuilder(context, 0),
          itemBuilder(context, 1),
        ],
      );
    }

    // Both the images are portrait.
    if (!isLandscape1 && !isLandscape2) {
      // -----------
      // |    |    |
      // |    |    |
      // |    |    |
      // -----------
      return FlexGrid(
        pattern: const [
          [1, 1],
        ],
        spacing: spacing,
        runSpacing: runSpacing,
        children: [
          itemBuilder(context, 0),
          itemBuilder(context, 1),
        ],
      );
    }

    // Layout on the basis of isLandscape1.
    // 1. True
    // -----------
    // |      |  |
    // |      |  |
    // |      |  |
    // -----------
    //
    // 2. False
    // -----------
    // |  |      |
    // |  |      |
    // |  |      |
    // -----------
    return FlexGrid(
      pattern: [
        if (isLandscape1) [2, 1] else [1, 2],
      ],
      spacing: spacing,
      runSpacing: runSpacing,
      children: [
        itemBuilder(context, 0),
        itemBuilder(context, 1),
      ],
    );
  }

  Widget _buildForThree(BuildContext context, List<Attachment> attachments) {
    final aspectRatio1 = attachments[0].originalSize?.aspectRatio;
    final isLandscape1 = aspectRatio1 != null && aspectRatio1 > 1;

    // We layout on the basis of isLandscape1.
    // 1. True
    // -----------
    // |         |
    // |         |
    // |---------|
    // |    |    |
    // |    |    |
    // -----------
    //
    // 2. False
    // -----------
    // |    |    |
    // |    |    |
    // |    |----|
    // |    |    |
    // |    |    |
    // -----------
    return FlexGrid(
      pattern: const [
        [1],
        [1, 1],
      ],
      spacing: spacing,
      runSpacing: runSpacing,
      reverse: !isLandscape1,
      children: [
        itemBuilder(context, 0),
        itemBuilder(context, 1),
        itemBuilder(context, 2),
      ],
    );
  }

  Widget _buildForFourOrMore(
      BuildContext context, List<Attachment> attachments) {
    final pattern = <List<int>>[];
    final children = <Widget>[];

    for (var i = 0; i < attachments.length; i++) {
      if (i.isEven) {
        pattern.add([1]);
      } else {
        pattern.last.add(1);
      }

      children.add(itemBuilder(context, i));
    }

    // -----------
    // |    |    |
    // |    |    |
    // ------------
    // |    |    |
    // |    |    |
    // ------------
    return FlexGrid(
      pattern: pattern,
      maxChildren: 4,
      spacing: spacing,
      runSpacing: runSpacing,
      children: children,
      overlayBuilder: (context, remaining) => IgnorePointer(
        child: ColoredBox(
          color: AppColorTokens.blackAlpha40,
          child: Center(
            child: Text(
              '+$remaining',
              style: const TextStyle(
                fontSize: 26,
                color: AppColorTokens.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getAspectRatio(Attachment attachment) {
    final width = attachment.originalWidth?.toDouble();
    final height = attachment.originalHeight?.toDouble();

    if (width != null && height != null && height > 0) {
      return width / height;
    }

    // Default to square aspect ratio if dimensions are unknown
    return 1;
  }

  double _calculateConstrainedAspectRatio(
    double originalAspectRatio,
    BoxConstraints constraints,
  ) {
    // Calculate the aspect ratio range based on constraints
    final minAspectRatio = constraints.minWidth / constraints.maxHeight;
    final maxAspectRatio = constraints.maxWidth / constraints.minHeight;

    // Clamp the original aspect ratio within the constraint bounds
    return originalAspectRatio.clamp(minAspectRatio, maxAspectRatio);
  }

  void _onAttachmentTap(BuildContext context, Attachment attachment) {
    onAttachmentTap?.call(attachment);
  }
}

extension on Attachment {
  Size? get originalSize {
    final width = originalWidth;
    final height = originalHeight;

    if (width == null || height == null) return null;
    return Size(width.toDouble(), height.toDouble());
  }
}

extension on BoxConstraints {
  /// Returns new box constraints that tightens the max width and max height
  /// to the given [size].
  BoxConstraints tightenMaxSize(Size? size) {
    if (size == null) return this;
    return copyWith(
      maxWidth: clampDouble(size.width, minWidth, maxWidth),
      maxHeight: clampDouble(size.height, minHeight, maxHeight),
    );
  }
}
