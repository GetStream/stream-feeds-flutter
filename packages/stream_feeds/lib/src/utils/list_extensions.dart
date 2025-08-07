import '../models.dart';

extension ListExtensions<T> on List<T> {
  List<T>? updateFirstElement(bool Function(T) where, T Function(T) update) {
    final list = List<T>.from(this);
    final index = list.indexWhere(where);
    if (index == -1) return this;

    list[index] = update(list[index]);
    return List.unmodifiable(list);
  }
}

extension IdentifiableListExtensions<T extends Identifiable> on List<T> {
  List<T> insertById(T element, {bool createNewList = true}) {
    final list = createNewList ? List<T>.from(this) : this;

    final index = indexWhere((e) => e.id == element.id);
    if (index == -1) {
      add(element);
    } else {
      this[index] = element;
    }

    return createNewList ? List.unmodifiable(list) : list;
  }

  List<T> removeById(T element, {bool createNewList = true}) {
    final list = createNewList ? List<T>.from(this) : this;
    list.removeWhere((e) => e.id == element.id);
    return createNewList ? List.unmodifiable(list) : list;
  }
}
