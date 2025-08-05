import '../models.dart';

class FeedsReactionData implements Identifiable {
  FeedsReactionData({
    required this.activityId,
    required this.createdAt,
    required this.customData,
    required this.type,
    required this.updatedAt,
    required this.user,
  });

  @override
  String get id => '$activityId${user.id}';

  final String activityId;
  final DateTime createdAt;
  final Map<String, dynamic>? customData;
  final String type;
  final DateTime updatedAt;
  final UserData user;
}
