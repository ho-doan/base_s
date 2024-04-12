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
  Flavor appFlavor = _flavorStr.flavor;

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

const _flavorStr = String.fromEnvironment('FLAVOR', defaultValue: 'dev');

extension on String {
  Flavor get flavor {
    return switch (this) {
      'dev' => Flavor.dev,
      'stg' => Flavor.stg,
      'prod' => Flavor.prod,
      'test' => Flavor.test,
      String() => Flavor.dev,
    };
  }
}
