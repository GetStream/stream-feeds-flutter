import '../../stream_feeds.dart';
import '../repositories.dart';
import '../ws/feeds_ws_event.dart';

abstract interface class RepositoryProvider {
// maybe move these 2 somewhere else?
  Stream<FeedsWsEvent> get feedsEvents;
  User get user;

  FeedsRepository get feedsRepository;
}
