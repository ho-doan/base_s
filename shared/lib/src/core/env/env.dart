import 'package:envied/envied.dart';

part 'env.g.dart';

abstract class Env {
  String get apiEndpoint;
  String get apiEndpointFigma;
  String get figmaKey;
  String get figmaToken;
  @override
  String toString() =>
      'apiEndpoint: $apiEndpoint,\napiEndpointFigma: $apiEndpointFigma,\nfigmaKey: $figmaKey,\nfigmaToken: $figmaToken';
}

@Envied(path: '.env')
class $Env extends Env {
  $Env._();
  static final instance = $Env._();

  @override
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  String apiEndpoint = _$Env.apiEndpoint;

  @override
  @EnviedField(varName: 'FIGMA_ENDPOINT', obfuscate: true)
  String apiEndpointFigma = _$Env.apiEndpointFigma;

  @override
  @EnviedField(varName: 'FIGMA_KEY', obfuscate: true)
  String figmaKey = _$Env.figmaKey;

  @override
  @EnviedField(varName: 'FIGMA_TOKEN', obfuscate: true)
  String figmaToken = _$Env.figmaToken;
}

@Envied(path: '.env.dev')
class $EnvDev extends Env {
  $EnvDev._();
  static final instance = $EnvDev._();

  @override
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  String apiEndpoint = _$EnvDev.apiEndpoint;

  @override
  @EnviedField(varName: 'FIGMA_ENDPOINT', obfuscate: true)
  String apiEndpointFigma = _$EnvDev.apiEndpointFigma;

  @override
  @EnviedField(varName: 'FIGMA_KEY', obfuscate: true)
  String figmaKey = _$EnvDev.figmaKey;

  @override
  @EnviedField(varName: 'FIGMA_TOKEN', obfuscate: true)
  String figmaToken = _$EnvDev.figmaToken;
}

@Envied(path: '.env.stg')
class $EnvStg extends Env {
  $EnvStg._();
  static final instance = $EnvStg._();

  @override
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  String apiEndpoint = _$EnvStg.apiEndpoint;

  @override
  @EnviedField(varName: 'FIGMA_ENDPOINT', obfuscate: true)
  String apiEndpointFigma = _$EnvStg.apiEndpointFigma;

  @override
  @EnviedField(varName: 'FIGMA_KEY', obfuscate: true)
  String figmaKey = _$EnvStg.figmaKey;

  @override
  @EnviedField(varName: 'FIGMA_TOKEN', obfuscate: true)
  String figmaToken = _$EnvStg.figmaToken;
}

@Envied(path: '.env.test')
class $EnvTest extends Env {
  $EnvTest._();
  static final instance = $EnvTest._();

  @override
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  String apiEndpoint = _$EnvTest.apiEndpoint;

  @override
  @EnviedField(varName: 'FIGMA_ENDPOINT', obfuscate: true)
  String apiEndpointFigma = _$EnvTest.apiEndpointFigma;

  @override
  @EnviedField(varName: 'FIGMA_KEY', obfuscate: true)
  String figmaKey = _$EnvTest.figmaKey;

  @override
  @EnviedField(varName: 'FIGMA_TOKEN', obfuscate: true)
  String figmaToken = _$EnvTest.figmaToken;
}
