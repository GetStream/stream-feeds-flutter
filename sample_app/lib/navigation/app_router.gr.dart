// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppSplash]
class AppSplashRoute extends PageRouteInfo<void> {
  const AppSplashRoute({List<PageRouteInfo>? children})
      : super(AppSplashRoute.name, initialChildren: children);

  static const String name = 'AppSplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppSplash();
    },
  );
}

/// generated route for
/// [AttachmentGalleryPage]
class AttachmentGalleryRoute extends PageRouteInfo<AttachmentGalleryRouteArgs> {
  AttachmentGalleryRoute({
    Key? key,
    required List<Attachment> attachments,
    required AttachmentMetadata metadata,
    int initialIndex = 0,
    List<PageRouteInfo>? children,
  }) : super(
          AttachmentGalleryRoute.name,
          args: AttachmentGalleryRouteArgs(
            key: key,
            attachments: attachments,
            metadata: metadata,
            initialIndex: initialIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'AttachmentGalleryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttachmentGalleryRouteArgs>();
      return AttachmentGalleryPage(
        key: args.key,
        attachments: args.attachments,
        metadata: args.metadata,
        initialIndex: args.initialIndex,
      );
    },
  );
}

class AttachmentGalleryRouteArgs {
  const AttachmentGalleryRouteArgs({
    this.key,
    required this.attachments,
    required this.metadata,
    this.initialIndex = 0,
  });

  final Key? key;

  final List<Attachment> attachments;

  final AttachmentMetadata metadata;

  final int initialIndex;

  @override
  String toString() {
    return 'AttachmentGalleryRouteArgs{key: $key, attachments: $attachments, metadata: $metadata, initialIndex: $initialIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AttachmentGalleryRouteArgs) return false;
    return key == other.key &&
        const ListEquality().equals(attachments, other.attachments) &&
        metadata == other.metadata &&
        initialIndex == other.initialIndex;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const ListEquality().hash(attachments) ^
      metadata.hashCode ^
      initialIndex.hashCode;
}

/// generated route for
/// [ChooseUserScreen]
class ChooseUserRoute extends PageRouteInfo<void> {
  const ChooseUserRoute({List<PageRouteInfo>? children})
      : super(ChooseUserRoute.name, initialChildren: children);

  static const String name = 'ChooseUserRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChooseUserScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [UserFeedScreen]
class UserFeedRoute extends PageRouteInfo<void> {
  const UserFeedRoute({List<PageRouteInfo>? children})
      : super(UserFeedRoute.name, initialChildren: children);

  static const String name = 'UserFeedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserFeedScreen();
    },
  );
}
