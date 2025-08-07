import 'package:stream_core/stream_core.dart' as core;

import '../../stream_feeds.dart';
import '../generated/api/api.dart' as api;
import 'feeds_data_mappers.dart';
import 'feeds_request_mappers.dart';

class FeedsRepository {
  FeedsRepository({
    required this.apiClient,
  });

  final api.DefaultApi apiClient;

// TODO improve error handling
  Future<GetOrCreateFeedData> getOrCreateFeed(FeedQuery query) async {
    final fid = query.fid;
    final request = query.toRequest();
    try {
      final result = await apiClient.getOrCreateFeed(
        feedGroupId: fid.group,
        feedId: fid.id,
        getOrCreateFeedRequest: request,
      );
      if (result == null) {
        throw core.ClientException(
          message: 'No result data from getOrCreateFeed',
        );
      }

      return GetOrCreateFeedData(
        activities: result.toPaginatedActivityData(),
      );
    } on core.ClientException catch (e) {
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
