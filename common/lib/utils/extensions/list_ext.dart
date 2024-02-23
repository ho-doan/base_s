extension ListX<T> on List<T>? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  List<T> get lst {
    return this ?? <T>[];
  }
}
