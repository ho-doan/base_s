import 'package:shared/shared.dart';

import 'main.dart' as runner;

void main() {
  F.instance.appFlavor = Flavor.dev;
  runner.main();
}
