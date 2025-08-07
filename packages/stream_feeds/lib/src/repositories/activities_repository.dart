import '../generated/api/api.dart' as api;

class ActivitiesRepository {
  ActivitiesRepository({
    required this.apiClient,
  });

  final api.DefaultApi apiClient;
}
