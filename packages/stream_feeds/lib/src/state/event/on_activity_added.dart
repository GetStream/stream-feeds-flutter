import 'package:meta/meta.dart';

import '../../models/activity_data.dart';
import '../../state.dart';
import '../../utils/filter.dart';
import '../insertion_action.dart';

/// A callback function that determines how to handle a new activity.
///
/// This optional callback can be provided to customize insertion behavior when
/// new activities are received. It allows determining how activities should be
/// inserted based on the activity, query, and current user context.
///
/// The function receives:
/// - [query]: The query that defines the filter and configuration
/// - [activity]: The newly added activity
/// - [currentUserId]: The ID of the current user
///
/// Returns an [InsertionAction] that determines how the activity should be
/// inserted into the activity list:
/// - [InsertionAction.addToStart]: Add the activity at the beginning of the list
/// - [InsertionAction.addToEnd]: Add the activity at the end of the list
/// - [InsertionAction.ignore]: Do not add the activity to the list
///
/// ## Example
/// ```dart
/// // Custom handler that adds all activities from followed users to the start
/// InsertionAction customOnNewActivity(
///   FeedQuery query,
///   ActivityData activity,
///   String currentUserId,
/// ) {
///   // Add activities from followed users to the start
///   if (activity.user.id != currentUserId) {
///     return InsertionAction.addToStart;
///   }
///   return InsertionAction.ignore;
/// }
///
/// final feed = client.feed(
///   group: 'user',
///   id: 'john',
///   onNewActivity: customOnNewActivity,
/// );
/// ```
typedef OnNewActivity = InsertionAction Function(
  FeedQuery query,
  ActivityData activity,
  String currentUserId,
);

/// Default handler for new activities.
///
/// Adds activities created by the current user to the start of the list if they
/// match the query's filter. Ignores all other activities.
@internal
InsertionAction defaultOnNewActivity(
  FeedQuery query,
  ActivityData activity,
  String currentUserId,
) {
  // If the activity was created by the current user and matches the filter,
  // add it to the start of the list; otherwise, ignore it.
  if (activity.user.id == currentUserId) {
    if (activity.matches(query.activityFilter)) {
      return InsertionAction.addToStart;
    }
  }

  return InsertionAction.ignore;
}
