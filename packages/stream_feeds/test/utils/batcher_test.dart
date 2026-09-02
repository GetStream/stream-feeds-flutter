import 'package:fake_async/fake_async.dart';
import 'package:stream_feeds/src/utils/batcher.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  group('Batcher', () {
    ({Batcher<String, int> batcher, List<List<String>> batches}) build({
      Duration interval = const Duration(seconds: 2),
    }) {
      final batches = <List<String>>[];
      final batcher = Batcher<String, int>(
        interval: interval,
        action: (items) async {
          batches.add(items);
          return items.length;
        },
      );

      return (batcher: batcher, batches: batches);
    }

    test('asks straight away, having nothing to wait behind', () {
      fakeAsync((async) {
        final (:batcher, :batches) = build();

        batcher.add('a').ignore();
        async.flushMicrotasks();

        expect(batches, [
          ['a'],
        ]);
      });
    });

    test('starts a new batch once the one before it has run', () {
      fakeAsync((async) {
        final (:batcher, :batches) = build();

        batcher.add('a').ignore();
        async.flushMicrotasks();

        // The second add has to plan a batch of its own: joining the settled
        // one would answer it with a result gathered before it asked.
        batcher.add('b').ignore();
        async.elapse(const Duration(seconds: 3));

        expect(batches, [
          ['a'],
          ['b'],
        ]);
      });
    });

    test('answers each add with the batch that carried it', () {
      fakeAsync((async) {
        final batcher = Batcher<String, String>(
          action: (items) async => items.join(','),
        );

        String? first;
        String? second;

        batcher.add('a').then((it) => first = it).ignore();
        async.flushMicrotasks();

        batcher.add('b').then((it) => second = it).ignore();
        async.elapse(const Duration(seconds: 3));

        expect(first, 'a');
        // Joining the settled batch would answer this with 'a' — a result
        // gathered before it asked.
        expect(second, 'b');
      });
    });

    test('answers everyone in a batch with the whole batch', () {
      fakeAsync((async) {
        final batcher = Batcher<String, String>(
          action: (items) async => items.join(','),
        );
        final answers = <String, String>{};

        batcher.add('a').ignore();
        async.flushMicrotasks();

        // Both land inside one window, so both are told what the batch as a
        // whole came back with, not just their own part of it.
        batcher.add('b').then((it) => answers['b'] = it).ignore();
        batcher.add('c').then((it) => answers['c'] = it).ignore();
        async.elapse(const Duration(seconds: 3));

        expect(answers, {'b': 'b,c', 'c': 'b,c'});
      });
    });

    test('collects everything that arrives inside one window', () {
      fakeAsync((async) {
        final (:batcher, :batches) = build();

        batcher.add('a').ignore();
        async.flushMicrotasks();

        batcher.add('b').ignore();
        batcher.add('c').ignore();
        async.elapse(const Duration(seconds: 3));

        expect(batches, [
          ['a'],
          ['b', 'c'],
        ], reason: 'the two behind the window went out together');
      });
    });

    test('measures the window against the clock it is given', () {
      fakeAsync((async) {
        final (:batcher, :batches) = build();

        batcher.add('a').ignore();
        async.flushMicrotasks();

        // Reading the wall clock instead would hold this add inside the window
        // however long a test waited.
        async.elapse(const Duration(seconds: 3));
        batcher.add('b').ignore();
        async.flushMicrotasks();

        expect(batches, [
          ['a'],
          ['b'],
        ], reason: 'the window had passed, so it asked on the spot');
      });
    });
  });
}
