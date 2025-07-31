import '../../stream_feeds.dart';
import '../generated/api/api.g.dart' as api;
import 'feeds_data_mappers.dart';
import 'feeds_request_mappers.dart';

class FeedsRepository {
  final api.DefaultApi apiClient;

  FeedsRepository({
    required this.apiClient,
  });

// TODO improve error handling
  Future<GetOrCreateFeedData> getOrCreateFeed(FeedQuery query) async {
    final fid = query.fid;
    final request = query.toRequest();
    try {
      final result = await apiClient.getOrCreateFeed(
        fid.group,
        fid.id,
        request,
      );
      if (result == null) {
        throw Exception('Failed to get or create feed');
      }
      return GetOrCreateFeedData(
        activities: result.toPaginatedActivityData(),
      );
    } on api.ApiException catch (e) {
      // TODO custom logger
      print(e);
      // TODO replace with Result.failure
      rethrow;
    } catch (e) {
      // TODO custom logger
      print(e);
      // TODO replace with Result.failure
      rethrow;
    }
  }
}
