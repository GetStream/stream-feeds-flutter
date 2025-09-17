import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;
late Activity activity;
late StreamAttachmentUploader attachmentUploader;
late List<Attachment> uploadedAttachments;

Future<void> howToUploadAFileOrImageStep1() async {
  // Create an instance of AttachmentFile with the file path
  //
  // Note: On web, use `AttachmentFile.fromData`. Or if you are working with
  // plugins which provide XFile then use `AttachmentFile.fromXFile`.
  final file = AttachmentFile('path/to/file');

  // Create a StreamAttachment with the file and type (image, video, file)
  final streamAttachment = StreamAttachment(
    file: file,
    type: AttachmentType.image,
    custom: {'width': 600, 'height': 400},
  );

  // Upload the attachment
  final result = await attachmentUploader.upload(
    streamAttachment,
    // Optionally track upload progress
    onProgress: (progress) {
      // Handle progress updates
    },
  );

  // Map the result to an Attachment model to send with an activity
  final uploadedAttachment = result.getOrThrow();
  final attachmentReadyToBeSent = Attachment(
    imageUrl: uploadedAttachment.remoteUrl,
    assetUrl: uploadedAttachment.remoteUrl,
    thumbUrl: uploadedAttachment.thumbnailUrl,
    custom: {...?uploadedAttachment.custom},
  );
}

Future<void> howToUploadAFileOrImageStep2() async {
  // Add an activity with the uploaded attachment
  final activity = await feed.addActivity(
    request: FeedAddActivityRequest(
      attachments: uploadedAttachments,
      text: 'look at NYC',
      type: 'post',
    ),
  );
}

Future<void> howToUploadAFileOrImageStep3() async {
  // Create a list of attachments to upload
  final attachmentUploads = <StreamAttachment>[];

  // Add an activity with the attachment needing upload
  final activity = await feed.addActivity(
    request: FeedAddActivityRequest(
      attachmentUploads: attachmentUploads,
      text: 'look at NYC',
      type: 'post',
    ),
  );
}

Future<void> howToUploadAFileOrImageStep4() async {
  // Create a list of attachments to upload
  final attachmentUploads = <StreamAttachment>[];

  // Add a comment with the attachment needing upload
  final comment = await activity.addComment(
    request: ActivityAddCommentRequest(
      attachmentUploads: attachmentUploads,
      activityId: activity.activityId,
      comment: 'look at NYC',
    ),
  );
}

Future<void> howToDeleteAFileOrImage() async {
  // Delete an image from the CDN
  await client.deleteImage(url: 'https://mycdn.com/image.png');

  // Delete a file from the CDN
  await client.deleteFile(url: 'https://mycdn.com/file.pdf');
}

// Your custom implementation of CdnClient
class CustomCDN implements CdnClient {
  @override
  Future<Result<UploadedFile>> uploadFile(
    AttachmentFile file, {
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) {
    // Use your own CDN upload logic here.
    // For example, you might upload the file to AWS S3, Google Cloud Storage, etc.
    // After uploading, return a Result<UploadedFile> with the file URLs.
    //
    // Note: Make sure to handle progress updates and cancellation if needed.
    return uploadToYourOwnCdn(
      file,
      onProgress: onProgress,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Result<UploadedFile>> uploadImage(
    AttachmentFile image, {
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) {
    // Use your own CDN upload logic here.
    // For example, you might upload the image to AWS S3, Google Cloud Storage, etc.
    // After uploading, return a Result<UploadedFile> with the image URLs.
    //
    // Note: Make sure to handle progress updates and cancellation if needed.
    return uploadToYourOwnCdn(
      image,
      onProgress: onProgress,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Result<void>> deleteFile(
    String url, {
    CancelToken? cancelToken,
  }) {
    // Use your own CDN deletion logic here.
    // For example, you might delete the file from AWS S3, Google Cloud Storage, etc.
    // After deleting, return a Result<void> indicating success or failure.
    //
    // Note: Make sure to handle cancellation if needed.
    return deleteFromYourOwnCdn(
      url,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Result<void>> deleteImage(
    String url, {
    CancelToken? cancelToken,
  }) {
    // Use your own CDN deletion logic here.
    // For example, you might delete the image from AWS S3, Google Cloud Storage, etc.
    // After deleting, return a Result<void> indicating success or failure.
    //
    // Note: Make sure to handle cancellation if needed.
    return deleteFromYourOwnCdn(
      url,
      cancelToken: cancelToken,
    );
  }
}

Future<void> usingYourOwnCdn() async {
  // Create a config with your custom CDN client
  final config = FeedsConfig(cdnClient: CustomCDN());

  // Initialize the StreamFeedsClient with the custom config
  final client = StreamFeedsClient(
    apiKey: 'your_api_key',
    user: const User(id: 'user_id'),
    config: config,
  );
}

// region Helper methods to simulate your own CDN logic

Future<Result<UploadedFile>> uploadToYourOwnCdn(
  AttachmentFile file, {
  ProgressCallback? onProgress,
  CancelToken? cancelToken,
}) {
  // Implement your file upload logic here
  // Return a Result<UploadedFile> indicating success or failure
  throw UnimplementedError();
}

Future<Result<void>> deleteFromYourOwnCdn(
  String url, {
  CancelToken? cancelToken,
}) {
  // Implement your file deletion logic here
  // Return a Result<void> indicating success or failure
  throw UnimplementedError();
}

// endregion
