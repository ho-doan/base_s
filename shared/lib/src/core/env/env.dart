import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

const _noEnv = '--No ENV';

abstract class Env {
  Future<void> load();

  String get apiEndpoint => dotenv.get('API_ENDPOINT', fallback: _noEnv);

  String get androidApiKey => dotenv.get('ANDROID_API_KEY', fallback: _noEnv);

  String get androidAppId => dotenv.get('ANDROID_APP_ID', fallback: _noEnv);

  String get androidMessagingSenderId =>
      dotenv.get('ANDROID_MESSAGING_SENDER_ID', fallback: _noEnv);

  String get androidProjectId =>
      dotenv.get('ANDROID_PROJECT_ID', fallback: _noEnv);

  String get iosApiKey => dotenv.get('IOS_API_KEY', fallback: _noEnv);

  String get iosAppId => dotenv.get('IOS_APP_ID', fallback: _noEnv);

  String get iosMessagingSenderId =>
      dotenv.get('IOS_MESSAGING_SENDER_ID', fallback: _noEnv);

  String get iosProjectId => dotenv.get('IOS_PROJECT_ID', fallback: _noEnv);

  String get templateName => dotenv.get('TEMPLATE_NAME', fallback: _noEnv);

  Map<String, dynamic> toMap() {
    return {
      'apiEndpoint': apiEndpoint,
      'androidApiKey': androidApiKey,
      'androidMessagingSenderId': androidMessagingSenderId,
      'androidProjectId': androidProjectId,
      'iosApiKey': iosApiKey,
      'iosAppId': iosAppId,
      'iosMessagingSenderId': iosMessagingSenderId,
      'iosProjectId': iosProjectId,
      'templateName': templateName,
      'androidAppId': androidAppId,
    };
  }

  @override
  String toString() => json.encode(toMap());
}

class $EnvTest extends Env {
  $EnvTest._();
  static final instance = $EnvTest._();
  @override
  Future<void> load() async {
    await dotenv.load(fileName: 'packages/shared/.env.test');
  }
}

class $EnvDev extends Env {
  $EnvDev._();
  static final instance = $EnvDev._();
  @override
  Future<void> load() async {
    await dotenv.load(fileName: 'packages/shared/.env.dev');
  }
}

class $EnvStg extends Env {
  $EnvStg._();
  static final instance = $EnvStg._();
  @override
  Future<void> load() async {
    await dotenv.load(fileName: 'packages/shared/.env.stg');
  }
}

class $Env extends Env {
  $Env._();
  static final instance = $Env._();
  @override
  Future<void> load() async {
    await dotenv.load(fileName: 'packages/shared/.env');
  }
}
