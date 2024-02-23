import 'package:envied/envied.dart';

part 'env.g.dart';

abstract class Env {
  String get apiEndpoint;
}

@Envied(path: '.env')
class $Env extends Env {
  $Env._();
  static final instance = $Env._();

  @override
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  String apiEndpoint = _$Env.apiEndpoint;
}

@Envied(path: '.env.dev')
class $EnvDev extends Env {
  $EnvDev._();
  static final instance = $EnvDev._();

  @override
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  String apiEndpoint = _$EnvDev.apiEndpoint;
}

@Envied(path: '.env.stg')
class $EnvStg extends Env {
  $EnvStg._();
  static final instance = $EnvStg._();

  @override
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  String apiEndpoint = _$EnvStg.apiEndpoint;
}

@Envied(path: '.env.test')
class $EnvTest extends Env {
  $EnvTest._();
  static final instance = $EnvTest._();

  @override
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  String apiEndpoint = _$EnvTest.apiEndpoint;
}
