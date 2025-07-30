import 'package:equatable/equatable.dart';

import '../../stream_feeds.dart';
import '../generated/api/api.g.dart' as api;

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

// todo: move to mappers
extension on FeedQuery {
  api.GetOrCreateFeedRequest toRequest() {
    return api.GetOrCreateFeedRequest(
      watch: watch,
    );
  }
}

extension on api.GetOrCreateFeedResponse {
  PaginationResult<ActivityData> toPaginatedActivityData() {
    return PaginationResult(
      items: activities
          .map(
            (e) => ActivityData(
              user: e.user.toUserData(),
              text: e.text,
              reactionCount: e.reactionCount,
            ),
          )
          .toList(),
      pagination: PaginationData(next: next, previous: prev),
    );
  }
}

extension on api.UserResponse {
  UserData toUserData() {
    return UserData(id: id, name: name, imageUrl: image);
  }
}

// TODO: incomplete
class GetOrCreateFeedData {
  const GetOrCreateFeedData({
    required this.activities,
  });

  final PaginationResult<ActivityData> activities;
}

class PaginationResult<T> {
  const PaginationResult({
    required this.items,
    required this.pagination,
  });

  final List<T> items;
  final PaginationData pagination;
}

class PaginationData extends Equatable {
  const PaginationData({
    this.next,
    this.previous,
  });

  /// Item id of where to start searching from for next [results]
  final String? next;

  /// Item id of where to start searching from for previous [results]
  final String? previous;

  @override
  List<Object?> get props => [next, previous];
}

// TODO: incomplete
class ActivityData {
  const ActivityData({
    required this.user,
    required this.text,
    required this.reactionCount,
  });

  final UserData user;
  final String? text;
  final int reactionCount;
}

class UserData {
  const UserData({
    required this.id,
    this.name,
    this.imageUrl,
  });

  final String id;
  final String? name;
  final String? imageUrl;
}
