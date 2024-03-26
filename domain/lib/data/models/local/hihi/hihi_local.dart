import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';
import '../../remote/hihi.dart';
import 'i_hihi.dart';
part 'hihi_local.g.dart';

@CopyWith()
@collection
class HihiLocal extends IHihi {
  const HihiLocal({
    required this.primary,
    super.id,
    this.key = Isar.autoIncrement,
  });

  factory HihiLocal.fromRemote(HihiRemote model) => HihiLocal(
        id: model.id,
        primary: model.id,
      );

  final Id? key;

  @Index(unique: true)
  final int? primary;
}
