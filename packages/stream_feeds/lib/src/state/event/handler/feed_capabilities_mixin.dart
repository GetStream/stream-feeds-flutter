import '../../../../stream_feeds.dart';
import '../../../repository/capabilities_repository.dart';

mixin FeedCapabilitiesMixin {
  CapabilitiesRepository get capabilitiesRepository;

  Future<ActivityData?> withUpdatedFeedCapabilities(
    ActivityData activity,
  ) async {
    final currentFeed = activity.currentFeed;
    if (currentFeed == null) return null;

    final ownCapabilities =
        await capabilitiesRepository.getCapabilities(currentFeed.id);
    return activity.copyWithCurrentFeedCapabilities(
      capabilities: ownCapabilities ?? [],
    );
  }
}
