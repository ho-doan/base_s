import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  Env();
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  static final String apiEndpoint = _Env.apiEndpoint;
}

@Envied(path: '.env.dev')
abstract class EnvDev {
  EnvDev();
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  static final String apiEndpoint = _EnvDev.apiEndpoint;
}

@Envied(path: '.env.stg')
abstract class EnvStg {
  EnvStg();
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  static final String apiEndpoint = _EnvStg.apiEndpoint;
}

@Envied(path: '.env.test')
abstract class EnvTest {
  EnvTest();
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  static final String apiEndpoint = _EnvTest.apiEndpoint;
}
