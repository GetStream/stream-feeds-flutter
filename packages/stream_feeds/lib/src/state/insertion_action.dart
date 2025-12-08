/// Defines how an item should be inserted into a list.
///
/// Used to specify the insertion position when adding new items to collections.
enum InsertionAction {
  /// Do not add the item to the list.
  ignore,

  /// Add the item at the end of the list.
  addToEnd,

  /// Add the item at the beginning of the list.
  addToStart,
}

