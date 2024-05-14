import 'package:envied/envied.dart';

part 'env.g.dart';

abstract class Env {
  String get apiEndpoint;
  String get apiEndpointFigma;
  String get figmaKey;
  String get figmaToken;
  String get androidApiKey;
  String get androidAppId;
  String get androidMessagingSenderId;
  String get androidProjectId;
  String get iosApiKey;
  String get iosAppId;
  String get iosMessagingSenderId;
  String get iosProjectId;
  String get templateName;
  @override
  String toString() =>
      'sApiEndpoint: $apiEndpoint,\napiEndpointFigma: $apiEndpointFigma,\nfigmaKey: $figmaKey,\nfigmaToken: $figmaToken';
}

@Envied(path: '.env', obfuscate: true)
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

  @override
  @EnviedField(varName: 'ANDROID_API_KEY', obfuscate: true)
  String androidApiKey = _$Env.androidApiKey;
  @override
  @EnviedField(varName: 'ANDROID_APP_ID', obfuscate: true)
  String androidAppId = _$Env.androidAppId;
  @override
  @EnviedField(varName: 'ANDROID_MESSAGING_SENDER_ID', obfuscate: true)
  String androidMessagingSenderId = _$Env.androidMessagingSenderId;
  @override
  @EnviedField(varName: 'ANDROID_PROJECT_ID', obfuscate: true)
  String androidProjectId = _$Env.androidProjectId;

  @override
  @EnviedField(varName: 'IOS_API_KEY', obfuscate: true)
  String iosApiKey = _$Env.iosApiKey;
  @override
  @EnviedField(varName: 'IOS_APP_ID', obfuscate: true)
  String iosAppId = _$Env.iosAppId;
  @override
  @EnviedField(varName: 'IOS_MESSAGING_SENDER_ID', obfuscate: true)
  String iosMessagingSenderId = _$Env.iosMessagingSenderId;
  @override
  @EnviedField(varName: 'IOS_PROJECT_ID', obfuscate: true)
  String iosProjectId = _$Env.iosProjectId;

  @override
  @EnviedField(varName: 'TEMPLATE_NAME')
  String templateName = _$Env.templateName;
}

// @Envied(path: '.env.dev')
// class $EnvDev extends Env {
//   $EnvDev._();
//   static final instance = $EnvDev._();

//   @override
//   @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
//   String apiEndpoint = _$EnvDev.apiEndpoint;

//   @override
//   @EnviedField(varName: 'FIGMA_ENDPOINT', obfuscate: true)
//   String apiEndpointFigma = _$EnvDev.apiEndpointFigma;

//   @override
//   @EnviedField(varName: 'FIGMA_KEY', obfuscate: true)
//   String figmaKey = _$EnvDev.figmaKey;

//   @override
//   @EnviedField(varName: 'FIGMA_TOKEN', obfuscate: true)
//   String figmaToken = _$EnvDev.figmaToken;

//   @override
//   @EnviedField(varName: 'ANDROID_API_KEY')
//   String androidApiKey = _$EnvDev.androidApiKey;
//   @override
//   @EnviedField(varName: 'ANDROID_APP_ID')
//   String androidAppId = _$EnvDev.androidAppId;
//   @override
//   @EnviedField(varName: 'ANDROID_MESSAGING_SENDER_ID')
//   String androidMessagingSenderId = _$EnvDev.androidMessagingSenderId;
//   @override
//   @EnviedField(varName: 'ANDROID_PROJECT_ID')
//   String androidProjectId = _$EnvDev.androidProjectId;

//   @override
//   @EnviedField(varName: 'IOS_API_KEY')
//   String iosApiKey = _$EnvDev.iosApiKey;
//   @override
//   @EnviedField(varName: 'IOS_APP_ID')
//   String iosAppId = _$EnvDev.iosAppId;
//   @override
//   @EnviedField(varName: 'IOS_MESSAGING_SENDER_ID')
//   String iosMessagingSenderId = _$EnvDev.iosMessagingSenderId;
//   @override
//   @EnviedField(varName: 'IOS_PROJECT_ID', obfuscate: true)
//   String iosProjectId = _$EnvDev.iosProjectId;

//   @override
//   @EnviedField(varName: 'TEMPLATE_NAME')
//   String templateName = _$EnvDev.templateName;
// }

// @Envied(path: '.env.stg')
// class $EnvStg extends Env {
//   $EnvStg._();
//   static final instance = $EnvStg._();

//   @override
//   @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
//   String apiEndpoint = _$EnvStg.apiEndpoint;

//   @override
//   @EnviedField(varName: 'FIGMA_ENDPOINT', obfuscate: true)
//   String apiEndpointFigma = _$EnvStg.apiEndpointFigma;

//   @override
//   @EnviedField(varName: 'FIGMA_KEY', obfuscate: true)
//   String figmaKey = _$EnvStg.figmaKey;

//   @override
//   @EnviedField(varName: 'FIGMA_TOKEN', obfuscate: true)
//   String figmaToken = _$EnvStg.figmaToken;

//   @override
//   @EnviedField(varName: 'ANDROID_API_KEY', obfuscate: true)
//   String androidApiKey = _$EnvStg.androidApiKey;
//   @override
//   @EnviedField(varName: 'ANDROID_APP_ID', obfuscate: true)
//   String androidAppId = _$EnvStg.androidAppId;
//   @override
//   @EnviedField(varName: 'ANDROID_MESSAGING_SENDER_ID', obfuscate: true)
//   String androidMessagingSenderId = _$EnvStg.androidMessagingSenderId;
//   @override
//   @EnviedField(varName: 'ANDROID_PROJECT_ID', obfuscate: true)
//   String androidProjectId = _$EnvStg.androidProjectId;

//   @override
//   @EnviedField(varName: 'IOS_API_KEY', obfuscate: true)
//   String iosApiKey = _$EnvStg.iosApiKey;
//   @override
//   @EnviedField(varName: 'IOS_APP_ID', obfuscate: true)
//   String iosAppId = _$EnvStg.iosAppId;
//   @override
//   @EnviedField(varName: 'IOS_MESSAGING_SENDER_ID', obfuscate: true)
//   String iosMessagingSenderId = _$EnvStg.iosMessagingSenderId;
//   @override
//   @EnviedField(varName: 'IOS_PROJECT_ID', obfuscate: true)
//   String iosProjectId = _$EnvStg.iosProjectId;

//   @override
//   @EnviedField(varName: 'TEMPLATE_NAME')
//   String templateName = _$EnvStg.templateName;
// }

// @Envied(path: '.env.test', obfuscate: true)
// class $EnvTest extends Env {
//   $EnvTest._();
//   static final instance = $EnvTest._();

//   @override
//   @EnviedField(varName: 'API_ENDPOINT', obfuscate: true)
//   String apiEndpoint = _$EnvTest.apiEndpoint;

//   @override
//   @EnviedField(varName: 'FIGMA_ENDPOINT', obfuscate: true)
//   String apiEndpointFigma = _$EnvTest.apiEndpointFigma;

//   @override
//   @EnviedField(varName: 'FIGMA_KEY', obfuscate: true)
//   String figmaKey = _$EnvTest.figmaKey;

//   @override
//   @EnviedField(varName: 'FIGMA_TOKEN', obfuscate: true)
//   String figmaToken = _$EnvTest.figmaToken;

//   @override
//   @EnviedField(varName: 'ANDROID_API_KEY', obfuscate: true)
//   String androidApiKey = _$EnvTest.androidApiKey;
//   @override
//   @EnviedField(varName: 'ANDROID_APP_ID', obfuscate: true)
//   String androidAppId = _$EnvTest.androidAppId;
//   @override
//   @EnviedField(varName: 'ANDROID_MESSAGING_SENDER_ID', obfuscate: true)
//   String androidMessagingSenderId = _$EnvTest.androidMessagingSenderId;
//   @override
//   @EnviedField(varName: 'ANDROID_PROJECT_ID', obfuscate: true)
//   String androidProjectId = _$EnvTest.androidProjectId;

//   @override
//   @EnviedField(varName: 'IOS_API_KEY', obfuscate: true)
//   String iosApiKey = _$EnvTest.iosApiKey;
//   @override
//   @EnviedField(varName: 'IOS_APP_ID', obfuscate: true)
//   String iosAppId = _$EnvTest.iosAppId;
//   @override
//   @EnviedField(varName: 'IOS_MESSAGING_SENDER_ID', obfuscate: true)
//   String iosMessagingSenderId = _$EnvTest.iosMessagingSenderId;
//   @override
//   @EnviedField(varName: 'IOS_PROJECT_ID', obfuscate: true)
//   String iosProjectId = _$EnvTest.iosProjectId;

//   @override
//   @EnviedField(varName: 'TEMPLATE_NAME')
//   String templateName = _$EnvTest.templateName;
// }
