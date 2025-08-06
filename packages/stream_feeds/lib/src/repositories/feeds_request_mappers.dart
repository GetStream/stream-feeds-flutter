import '../../stream_feeds.dart';
import '../generated/api/api.dart' as api;

extension FeedQueryMapper on FeedQuery {
  api.GetOrCreateFeedRequest toRequest() {
    return api.GetOrCreateFeedRequest(
      watch: watch,
    );
  }
}
