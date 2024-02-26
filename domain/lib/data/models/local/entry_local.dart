import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';

import '../data_models.dart';

part 'entry_local.g.dart';

@CopyWith()
@collection
class EntryLocal {
  const EntryLocal({
    this.aPI,
    this.description,
    this.auth,
    this.hTTPS,
    this.cors,
    this.link,
    this.category,
    this.key = Isar.autoIncrement,
  });
  factory EntryLocal.fromEntry(EntryRemote entry) => EntryLocal(
        aPI: entry.aPI,
        auth: entry.auth,
        category: entry.category,
        cors: entry.cors,
        description: entry.description,
        hTTPS: entry.hTTPS,
        link: entry.link,
      );

  final Id? key;

  final String? aPI;
  final String? description;
  final String? auth;
  final bool? hTTPS;
  final String? cors;
  final String? link;
  final String? category;
}
