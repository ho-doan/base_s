import '../shared.dart';

enum Flavor {
  dev,
  test,
  stg,
  prod,
}

class F {
  F._();
  static final instance = F._();
  Flavor appFlavor = Flavor.dev;

  String get name => appFlavor.name;

  Env get env {
    return switch (appFlavor) {
      Flavor.dev => $EnvDev.instance,
      Flavor.test => $EnvTest.instance,
      Flavor.stg => $EnvStg.instance,
      Flavor.prod => $Env.instance,
    };
  }
}
