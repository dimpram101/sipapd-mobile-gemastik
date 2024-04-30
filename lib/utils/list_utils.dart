class ListUtils {
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }
}
