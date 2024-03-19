import '../models/model.dart';

extension FigmaDocumentX on FigmaDocument? {
  List<String> get allText {
    if (this == null) return [];
    final lst = <String>[];
    if (this!.characters != null && this!.characters!.isNotEmpty) {
      lst.add(this!.characters!);
    }
    if (this!.children != null) {
      for (final item in this!.children!) {
        lst.addAll(item.allText);
      }
    }
    return lst;
  }

  List<FigmaDocument> get documents {
    if (this == null) return [];
    final lst = List<FigmaDocument>.from([])..add(this!);

    if (this!.children != null) {
      for (final item in this!.children!) {
        lst.addAll(item.documents);
      }
    }
    return lst;
  }
}

extension StringX on String {
  String get r => replaceAll(RegExp(r'\W+'), '_');
  String get v => replaceAll('\n', r'\n');
}

extension StringLst on List<String> {
  List<String> get removeDuplicated {
    return toSet().toList();
  }
}
