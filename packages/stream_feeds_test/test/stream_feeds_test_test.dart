import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  group('stream_feeds_test', () {
    test('re-exports test framework', () {
      // Verify test framework functions are available
      expect(true, isTrue);
      expect(1, equals(1));
    });

    test('re-exports mocktail', () {
      // Verify mocktail functions are available
      final mock = MockTestClass();
      when(mock.getValue).thenReturn(42);
      expect(mock.getValue(), 42);
      verify(mock.getValue).called(1);
    });
  });
}

// Test mock class for verifying mocktail re-export
class MockTestClass extends Mock {
  int getValue();
}
