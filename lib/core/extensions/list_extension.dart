extension FirstWhereExt<T> on List<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  T firstWhereOrDefault(bool Function(T element) test, {required T defaultValue}) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return defaultValue;
  }
}
