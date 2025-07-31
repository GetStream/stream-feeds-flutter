import '../generated/api/api.g.dart' as api;

class ActivitiesRepository {
  final api.DefaultApi apiClient;

  ActivitiesRepository({
    required this.apiClient,
  });
}
