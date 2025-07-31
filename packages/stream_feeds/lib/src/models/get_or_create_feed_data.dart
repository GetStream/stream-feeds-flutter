// TODO: incomplete
import '../models.dart';

class GetOrCreateFeedData {
  const GetOrCreateFeedData({
    required this.activities,
  });

  final PaginationResult<ActivityData> activities;
}
