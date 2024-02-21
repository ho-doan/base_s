import 'package:envied/envied.dart';

import '../../flavors.dart';

part 'env.g.dart';

class Env {
  Env._();
  static final internal = Env._();
  String get apiEndpoint {
    return switch (F.instance.appFlavor) {
      Flavor.dev => $EnvDev.apiEndpoint,
      Flavor.prod => $Env.apiEndpoint,
      Flavor.stg => $EnvStg.apiEndpoint,
      Flavor.test => $EnvTest.apiEndpoint,
    };
  }
}

@Envied(path: '.env')
abstract class $Env {
  $Env();
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  static final String apiEndpoint = _$Env.apiEndpoint;
}

@Envied(path: '.env.dev')
abstract class $EnvDev {
  $EnvDev();
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  static final String apiEndpoint = _$EnvDev.apiEndpoint;
}

@Envied(path: '.env.stg')
abstract class $EnvStg {
  $EnvStg();
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  static final String apiEndpoint = _$EnvStg.apiEndpoint;
}

@Envied(path: '.env.test')
abstract class $EnvTest {
  $EnvTest();
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  static final String apiEndpoint = _$EnvTest.apiEndpoint;
}
