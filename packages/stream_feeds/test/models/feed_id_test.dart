import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  test('feed id should be created with group and id', () {
    const feedId = FeedId(group: 'group', id: 'id');
    expect(feedId.group, 'group');
    expect(feedId.id, 'id');
    expect(feedId.rawValue, 'group:id');
  });

  test('feed id should be created with timeline group and id', () {
    const feedId = FeedId.timeline('id');
    expect(feedId.group, 'timeline');
    expect(feedId.id, 'id');
    expect(feedId.rawValue, 'timeline:id');
  });

  test('feed id should be created with notification group and id', () {
    const feedId = FeedId.notification('id');
    expect(feedId.group, 'notification');
    expect(feedId.id, 'id');
    expect(feedId.rawValue, 'notification:id');
  });

  test('feed id should be created with stories group and id', () {
    const feedId = FeedId.stories('id');
    expect(feedId.group, 'stories');
    expect(feedId.id, 'id');
    expect(feedId.rawValue, 'stories:id');
  });

  test('feed id should be created with story group and id', () {
    const feedId = FeedId.story('id');
    expect(feedId.group, 'story');
    expect(feedId.id, 'id');
    expect(feedId.rawValue, 'story:id');
  });

  test('feed id should be created with user group and id', () {
    const feedId = FeedId.user('id');
    expect(feedId.group, 'user');
    expect(feedId.id, 'id');
    expect(feedId.rawValue, 'user:id');
  });
}
