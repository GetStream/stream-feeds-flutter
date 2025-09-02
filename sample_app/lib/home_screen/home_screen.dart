import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_core/stream_core.dart';

import '../navigation/app_state.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AppStateProvider appStateProvider =
      GetIt.instance.get<AppStateProvider>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              appStateProvider.clearUserId();
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: appStateProvider,
        builder: (context, appState, child) => switch (appState) {
          LoggedInState() => _FeedList(feedsClient: appState.feedsClient),
          _ => const Center(
              child: Text('Please login, you should not be here.'),
            )
        },
      ),
    );
  }
}

class _FeedList extends StatefulWidget {
  const _FeedList({required this.feedsClient});
  final StreamFeedsClient feedsClient;

  @override
  State<_FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<_FeedList> {
  late Feed feed;

  @override
  void initState() {
    super.initState();
    _createFeed();
  }

  @override
  void didUpdateWidget(covariant _FeedList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.feedsClient.user.id != widget.feedsClient.user.id) {
      _disposeFeed();
      _createFeed();
    }
  }

  @override
  void dispose() {
    _disposeFeed();
    super.dispose();
  }

  void _createFeed() {
    feed = widget.feedsClient.feed(
      'user',
      widget.feedsClient.user.id,
    )..getOrCreate();
  }

  void _disposeFeed() {
    //todo stop listening to the feed
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: feed.state,
      builder: (context, state, child) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () => feed.getOrCreate(),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: ListView.builder(
                itemCount: state.activities.length,
                itemBuilder: (context, index) {
                  final activity = state.activities[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // User info row
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: switch (activity.user.image) {
                                  final String imageUrl =>
                                    CachedNetworkImageProvider(imageUrl),
                                  _ => null,
                                },
                                child: switch (activity.user.image) {
                                  String _ => null,
                                  _ => Text(
                                      activity.user.name
                                              ?.substring(0, 1)
                                              .toUpperCase() ??
                                          '?',
                                    ),
                                },
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      activity.user.name ?? 'unknown user',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      activity.createdAt.toString(),
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Activity text
                          if (activity.text?.isNotEmpty == true) ...[
                            const SizedBox(height: 12),
                            Text(
                              activity.text!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],

                          // Horizontal image list
                          if (activity.attachments.isNotEmpty) ...[
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: activity.attachments.length,
                                itemBuilder: (context, attachmentIndex) {
                                  final attachment =
                                      activity.attachments[attachmentIndex];
                                  final imageUrl = attachment.imageUrl ??
                                      attachment.assetUrl ??
                                      attachment.thumbUrl;

                                  if (imageUrl == null)
                                    return const SizedBox.shrink();

                                  return Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    width: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl: imageUrl,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                          color: Colors.grey.shade200,
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          color: Colors.grey.shade200,
                                          child: const Icon(
                                            Icons.image_not_supported,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],

                          // Reaction count
                          const SizedBox(height: 12),
                          Text(
                            '${activity.reactionCount} reactions',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showCreateActivityBottomSheet(context),
            tooltip: 'Create Activity',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  /// Shows the bottom sheet for creating a new activity.
  void _showCreateActivityBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _CreateActivityBottomSheet(feed: feed);
      },
    );
  }
}

class _CreateActivityBottomSheet extends StatefulWidget {
  const _CreateActivityBottomSheet({required this.feed});

  final Feed feed;

  @override
  State<_CreateActivityBottomSheet> createState() =>
      _CreateActivityBottomSheetState();
}

class _CreateActivityBottomSheetState
    extends State<_CreateActivityBottomSheet> {
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedImages = [];
  bool _isCreating = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    print('Picking image...');
    try {
      XFile? image;

      // Try gallery first, fallback to camera if gallery fails on macOS
      try {
        image = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 1920,
          maxHeight: 1080,
          imageQuality: 85,
        );
      } catch (galleryError) {
        print('Gallery picker failed, trying camera: $galleryError');
        // On some platforms/configurations, try camera as fallback
        image = await _picker.pickImage(
          source: ImageSource.camera,
          maxWidth: 1920,
          maxHeight: 1080,
          imageQuality: 85,
        );
      }

      if (image case final image?) {
        setState(() {
          _selectedImages.add(image);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: $e')),
        );
      }
    }
  }

  Future<void> _createActivity() async {
    final text = _textController.text.trim();

    if (text.isEmpty && _selectedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add some text or an image')),
      );
      return;
    }

    setState(() {
      _isCreating = true;
    });

    try {
      // Create attachments for all selected images
      final attachmentUploads = <StreamAttachment>[];
      for (final image in _selectedImages) {
        final attachmentFile = AttachmentFile(image.path);

        attachmentUploads.add(
          StreamAttachment(
            file: attachmentFile,
            type: AttachmentType.image,
          ),
        );
      }

      // Create the activity request
      final request = FeedAddActivityRequest(
        type: 'activity',
        text: text.isNotEmpty ? text : null,
        feeds: [widget.feed.query.fid.rawValue],
        attachmentUploads: attachmentUploads,
      );

      // Add the activity using the existing feed instance
      final result = await widget.feed.addActivity(request: request);

      if (mounted) {
        switch (result) {
          case Success():
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Activity created successfully!')),
            );
          case Failure(error: final error):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to create activity: $error')),
            );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating activity: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCreating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Row(
            children: [
              const Text(
                'Create Activity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Text field
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: "What's on your mind?",
              border: OutlineInputBorder(),
              hintText: 'Share your thoughts...',
            ),
            maxLines: 3,
            enabled: !_isCreating,
          ),
          const SizedBox(height: 16),

          // Horizontal image preview list
          if (_selectedImages.isNotEmpty) ...[
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectedImages.length,
                itemBuilder: (context, index) {
                  final image = _selectedImages[index];

                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 120,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(image.path),
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectedImages.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16,
                              ),
                              iconSize: 16,
                              padding: const EdgeInsets.all(4),
                              constraints: const BoxConstraints(
                                minWidth: 24,
                                minHeight: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Action buttons
          Row(
            children: [
              IconButton(
                onPressed: _isCreating ? null : _pickImage,
                icon: const Icon(Icons.image),
                tooltip: 'Add Image',
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _isCreating ? null : _createActivity,
                child: _isCreating
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Post'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
