import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  Env();
  @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
  static final String apiEndpoint = _Env.apiEndpoint;
}
