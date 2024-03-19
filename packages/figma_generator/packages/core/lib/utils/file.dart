typedef FileWriter = void Function(String contents, String path);
typedef ImageWriter = void Function(
  List<int> contents,
  String path,
  String? oldPath,
);
