/// BDD-style test helpers and utilities for Stream Feeds SDK testing.
///
/// This library provides test utilities including:
/// - Tester classes for state objects (Feed, ActivityList, etc.)
/// - Mock objects for API and WebSocket testing
/// - Helper functions for creating test data
/// - API mocker mixin for clean test setup
///
/// Re-exports `package:test/test.dart` and `package:mocktail/mocktail.dart`
/// for convenience - only one import needed in test files.
library;

// Re-export test framework and mocking library
export 'package:mocktail/mocktail.dart';
export 'package:test/test.dart';

// Helpers
export 'src/helpers/api_mocker_mixin.dart';
export 'src/helpers/event_types.dart';
export 'src/helpers/mocks.dart';
export 'src/helpers/test_data.dart';
export 'src/helpers/web_socket_mocks.dart';

// Testers
export 'src/testers/activity_comment_list_tester.dart';
export 'src/testers/activity_list_tester.dart';
export 'src/testers/activity_tester.dart';
export 'src/testers/base_tester.dart';
export 'src/testers/bookmark_folder_list_tester.dart';
export 'src/testers/bookmark_list_tester.dart';
export 'src/testers/comment_list_tester.dart';
export 'src/testers/comment_reply_list_tester.dart';
export 'src/testers/feed_list_tester.dart';
export 'src/testers/feed_tester.dart';
export 'src/testers/follow_list_tester.dart';
export 'src/testers/poll_list_tester.dart';
export 'src/testers/poll_vote_list_tester.dart';
