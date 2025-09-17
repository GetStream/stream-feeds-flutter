import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:video_player/video_player.dart';

import '../../theme/theme.dart';

class AttachmentGalleryItem extends StatelessWidget {
  const AttachmentGalleryItem({
    super.key,
    required this.attachment,
  });

  final Attachment attachment;

  @override
  Widget build(BuildContext context) {
    return switch (attachment.type) {
      AttachmentType.image => PhotoItem(photo: attachment),
      AttachmentType.giphy => PhotoItem(photo: attachment),
      AttachmentType.video => VideoItem(video: attachment),
      _ => const UnsupportedItem(),
    };
  }
}

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key, required this.photo});

  final Attachment photo;

  @override
  Widget build(BuildContext context) {
    final photoUrl = photo.imageUrl;

    if (photoUrl == null) return const ErrorItem();

    return PhotoView(
      imageProvider: NetworkImage(photoUrl),
      maxScale: PhotoViewComputedScale.covered,
      minScale: PhotoViewComputedScale.contained,
      errorBuilder: (_, __, ___) => const ErrorItem(),
      backgroundDecoration: const BoxDecoration(color: Colors.transparent),
    );
  }
}

class VideoItem extends StatefulWidget {
  const VideoItem({super.key, required this.video});

  final Attachment video;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late final VideoPlayerController _videoPlayerController;

  ChewieController? _chewieController;
  Future<void> _initializeController() async {
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      zoomAndPan: true,
      showOptions: false,
      videoPlayerController: _videoPlayerController,
    );

    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();

    final videoUrl = Uri.parse(widget.video.assetUrl ?? '');
    _videoPlayerController = VideoPlayerController.networkUrl(videoUrl);

    _initializeController();
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController case final controller?) {
      return Center(
        child: AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: Chewie(controller: controller),
        ),
      );
    }

    return const Center(child: CircularProgressIndicator.adaptive());
  }
}

class UnsupportedItem extends StatelessWidget {
  const UnsupportedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: context.appColors.disabled,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: 64,
            Icons.attachment,
            color: context.appColors.textHighEmphasis,
          ),
          const SizedBox(height: 16),
          Text(
            'Unsupported Format',
            style: context.appTextStyles.headlineBold,
          ),
          const SizedBox(height: 8),
          Text(
            'This attachment type is not supported in gallery view',
            textAlign: TextAlign.center,
            style: context.appTextStyles.footnote.copyWith(
              color: context.appColors.textLowEmphasis,
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorItem extends StatelessWidget {
  const ErrorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: context.appColors.disabled,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: 64,
            Icons.error_outline,
            color: context.appColors.textHighEmphasis,
          ),
          const SizedBox(height: 16),
          Text(
            'Error Loading Attachment',
            style: context.appTextStyles.headlineBold,
          ),
          const SizedBox(height: 8),
          Text(
            'There was an error loading this attachment',
            textAlign: TextAlign.center,
            style: context.appTextStyles.footnote.copyWith(
              color: context.appColors.textLowEmphasis,
            ),
          ),
        ],
      ),
    );
  }
}
