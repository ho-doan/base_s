import '../../remote/remote.dart';
import 'i_hihi.dart';

class HihiLocal extends IHihi {
  const HihiLocal({
    required this.primary,
    super.id,
    this.key = -1,
  });

  factory HihiLocal.fromRemote(HihiRemote model) => HihiLocal(
        id: model.id,
        primary: model.id,
      );

  final int? key;

  final int? primary;
}
