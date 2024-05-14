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
      Flavor.dev => $Env.instance,
      // TODO(hodoan): change env
      Flavor.test => $Env.instance,
      Flavor.stg => $Env.instance,
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
      'ctest' => Flavor.test,
      String() => Flavor.dev,
    };
  }
}
