import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../theme/theme.dart';
import 'attachment_gallery_chrome.dart';
import 'attachment_gallery_item.dart';
import 'attachment_metadata.dart';

class AttachmentGallery extends StatefulWidget {
  const AttachmentGallery({
    super.key,
    this.initialIndex = 0,
    required this.attachments,
    required this.metadata,
  }) : assert(initialIndex >= 0, 'Initial index must be non-negative');

  final int initialIndex;
  final List<Attachment> attachments;
  final AttachmentMetadata metadata;

  @override
  State<AttachmentGallery> createState() => _AttachmentGalleryState();
}

class _AttachmentGalleryState extends State<AttachmentGallery> {
  late final PageController _pageController;
  late final _currentPage = ValueNotifier(widget.initialIndex);

  late final _isDisplayingDetail = ValueNotifier<bool>(true);
  void switchDisplayingDetail() {
    _isDisplayingDetail.value = !_isDisplayingDetail.value;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage.value);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, currentPage, child) {
          return Stack(
            children: [
              if (child case final child?) child,
              // Chrome overlay
              ValueListenableBuilder<bool>(
                valueListenable: _isDisplayingDetail,
                builder: (context, isVisible, child) {
                  return AttachmentGalleryChrome(
                    isVisible: isVisible,
                    metadata: widget.metadata,
                    currentAttachment: widget.attachments[currentPage],
                    currentIndex: currentPage + 1,
                    totalCount: widget.attachments.length,
                  );
                },
              ),
            ],
          );
        },
        child: InkWell(
          onTap: switchDisplayingDetail,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.attachments.length,
            onPageChanged: (page) => _currentPage.value = page,
            itemBuilder: (context, index) {
              final attachment = widget.attachments[index];
              return ValueListenableBuilder(
                valueListenable: _isDisplayingDetail,
                builder: (context, displayingDetail, child) {
                  final padding = MediaQuery.paddingOf(context);

                  return AnimatedContainer(
                    duration: kThemeAnimationDuration,
                    color: switch (displayingDetail) {
                      true => context.appColors.appBg,
                      false => AppColorTokens.black,
                    },
                    padding: EdgeInsetsDirectional.only(
                      top: padding.top + kToolbarHeight,
                      bottom: padding.bottom + kToolbarHeight,
                    ),
                    child: child,
                  );
                },
                child: AttachmentGalleryItem(attachment: attachment),
              );
            },
          ),
        ),
      ),
    );
  }
}
