import 'dart:developer';
import 'dart:io';

import 'package:common/common.dart';
import 'package:domain/services/local_database/share_preference/share_preference_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/feature/app/cubit/app_cubit.dart';

import '../../../router/router.dart';
import '../../notification/notification_in_app.dart';

enum NotificationCategory { home, product }

class NotificationModel {
  NotificationModel({
    this.action,
    this.category,
    this.status,
    this.content,
    this.title,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        action: json['action'],
        category: int.parse(json['category'] ?? '0'),
        status: int.parse(json['status'] ?? '0'),
        title: json['title'],
        content: json['content'],
      );
  final String? action;
  final int? category;
  final int? status;

  final String? content;
  final String? title;
}

class FirebaseAppNotifications {
  late FirebaseMessaging _firebaseMessaging;

  Future<void> initialize(BuildContext context) async {
    _firebaseMessaging = FirebaseMessaging.instance;
    await requestNotificationPermission(context);
    await _setupFcmToken();
    await _onForeground(context);
    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      _navigateToApp(message: remoteMessage, context: context);
    });
  }

  Future<void> requestNotificationPermission(BuildContext context) async {
    final settings = await _firebaseMessaging.requestPermission();
    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
        break;
      case AuthorizationStatus.denied:
        await _requestNotificationDialog(context);

        break;
      case AuthorizationStatus.notDetermined:
        await _requestNotificationDialog(context);
        break;
      case AuthorizationStatus.provisional:
        break;
    }
  }

  Future<void> _setupFcmToken() async {
    // Get the token each time the application loads
    final token = await _firebaseMessaging.getToken();
    // Save the initial token to the database
    log('FCM TOKEN ===> $token');
    if (!token.isNullOrEmpty) {
      await _updateFcmToken(token!);
    }
    // Any time the token refreshes, store this in the database too.
    _firebaseMessaging.onTokenRefresh.listen(_updateFcmToken);
  }

  Future<void> _updateFcmToken(String newFcmToken) async {
    final localFcmToken = getIt<SharedPreferenceHelper>().getFcmTokenKey();
    if (localFcmToken == newFcmToken) return;
    getIt<AppCubit>().updateFcmToken(newFcmToken);
  }

  void refreshTokenFCM() async {
    await _firebaseMessaging.deleteToken();
    _firebaseMessaging = FirebaseMessaging.instance;
  }

  void showNotification({
    required RemoteMessage message,
    required BuildContext context,
  }) {
    final notificationModel = NotificationModel.fromJson(message.data);
    if (notificationModel.category == null || notificationModel.category == 0)
      return;
    final notificationCategory =
        _getNotificationCategory(notificationModel.category!);
    NotificationInApp.showNotification(
      context: context,
      notificationArgs: NotificationArgs(
        title: message.notification?.title ?? '',
        content: message.notification?.body ?? '',
        category: notificationCategory,
        notificationModel: notificationModel,
      ),
    );
  }

  NotificationCategory _getNotificationCategory(int notificationCategory) {
    return NotificationCategory.values[notificationCategory - 1];
  }

  Future<void> _navigateToApp({
    required RemoteMessage message,
    required BuildContext context,
  }) async {
    log(message.data.toString());
    final notificationModel = NotificationModel.fromJson(message.data);
    if (notificationModel.category == null || notificationModel.category == 0)
      return;
    final notificationCategory =
        NotificationCategory.values[notificationModel.category! - 1];

    switch (notificationCategory) {
      case NotificationCategory.home:
        NotificationInApp.showNotification(
          context: context,
          notificationArgs: NotificationArgs(
            title: message.notification?.title ?? '',
            content: message.notification?.body ?? '',
            category: NotificationCategory.home,
            notificationModel: notificationModel,
          ),
        );
        break;

      case NotificationCategory.product:
        ProductRouter(notificationModel.content ?? '').go(context);
        break;
    }
  }

  Future<void> _onForeground(BuildContext context) async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      log('_onForeground $message');
      _navigateToApp(context: context, message: message);
    });
  }

  Future<void> _requestNotificationDialog(BuildContext context) async {
    await _showDialog(
      context: context,
      actionCancel: 'Cancel'.hardcode,
      actionOk: 'Allow'.hardcode,
      message: 'Message'.hardcode,
      title: 'Title'.hardcode,
    );
  }

  static Future<void> _showDialog({
    required BuildContext context,
    required String title,
    required String message,
    required String actionCancel,
    required String actionOk,
  }) async {
    await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: buildListAction(context, actionOk, actionCancel),
          );
        }
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: buildListAction(context, actionOk, actionCancel),
        );
      },
    );
  }

  static List<Widget> buildListAction(
      BuildContext context, String actionOk, String actionCancel) {
    return <Widget>[
      TextButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: Text(
          actionCancel,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
      TextButton(
        onPressed: () async {
          Navigator.of(context).pop();

          await NotificationPermissions.requestNotificationPermissions();
        },
        child: Text(
          actionOk,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    ];
  }
}

class DefaultFirebaseOptions {
  static String get name {
    return F.instance.env.templateName;
  }

  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;

      // ignore: no_default_cases
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions android = FirebaseOptions(
    apiKey: F.instance.env.androidApiKey,
    appId: F.instance.env.androidAppId,
    messagingSenderId: F.instance.env.androidMessagingSenderId,
    projectId: F.instance.env.androidProjectId,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: F.instance.env.iosApiKey,
    appId: F.instance.env.iosAppId,
    messagingSenderId: F.instance.env.iosMessagingSenderId,
    projectId: F.instance.env.iosProjectId,
  );
}
