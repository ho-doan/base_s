import 'package:shared/shared.dart';

import 'main.dart' as runner;

Future<void> main() async {
  F.instance.appFlavor = Flavor.prod;
  runner.main();
}
