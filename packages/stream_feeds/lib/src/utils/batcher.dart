import 'dart:async';

class Batcher<T, R> {
  Batcher({
    required this.action,
    this.interval = const Duration(seconds: 2),
  });

  final Duration interval;
  final Action<T, R> action;
  Timer? _timer;
  Set<T> _itemsToProcess = {};
  Set<T> _itemsBeingProcessed = {};

  late DateTime _lastRun = DateTime.fromMillisecondsSinceEpoch(0);
  Completer<R>? _nextActionCompleter;
  Completer<R>? _ongoingActionCompleter;

  /// Adds an item to the batch and returns the result of the whole batch.
  Future<R> add(T item) {
    if (_itemsBeingProcessed.contains(item)) {
      return _ongoingActionCompleter!.future;
    }

    _itemsToProcess.add(item);
    _nextActionCompleter ??= _planBatchFetch();
    return _nextActionCompleter!.future;
  }

  void dispose() {
    _timer?.cancel();
  }

  Completer<R> _planBatchFetch() {
    final timeSinceLastRun = DateTime.now().difference(_lastRun);

    final newActionCompleter = Completer<R>();
    _nextActionCompleter = newActionCompleter;
    _lastRun = DateTime.now();

    if (timeSinceLastRun >= interval) {
      _runBatch();
    } else {
      _timer = Timer(interval - timeSinceLastRun, _runBatch);
    }

    return newActionCompleter;
  }

  void _runBatch() {
    if (_nextActionCompleter == null) {
      return;
    }
    final completer = _nextActionCompleter!;
    _ongoingActionCompleter = completer;
    _itemsBeingProcessed = _itemsToProcess;

    final currentAction = action(_itemsToProcess.toList());
    completer.complete(currentAction);
    currentAction.whenComplete(
      () {
        _ongoingActionCompleter = null;
        _itemsBeingProcessed = {};
      },
    );

    _nextActionCompleter = null;
    _itemsToProcess = {};
    _timer = null;
  }
}

typedef Action<T, R> = Future<R> Function(List<T> items);
