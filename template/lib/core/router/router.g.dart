// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootApp,
      $loginRouter,
    ];

RouteBase get $rootApp => GoRouteData.$route(
      path: '/',
      factory: $RootAppExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'home',
          factory: $HomeRouterExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'product',
          factory: $ProductRouterExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'profile',
          factory: $ProfileRouterExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'setting',
          factory: $SettingRouterExtension._fromState,
        ),
      ],
    );

extension $RootAppExtension on RootApp {
  static RootApp _fromState(GoRouterState state) => RootApp();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeRouterExtension on HomeRouter {
  static HomeRouter _fromState(GoRouterState state) => HomeRouter(
        state.uri.queryParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/home',
        queryParams: {
          'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductRouterExtension on ProductRouter {
  static ProductRouter _fromState(GoRouterState state) => ProductRouter(
        state.uri.queryParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/product',
        queryParams: {
          'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouterExtension on ProfileRouter {
  static ProfileRouter _fromState(GoRouterState state) => ProfileRouter(
        state.uri.queryParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/profile',
        queryParams: {
          'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingRouterExtension on SettingRouter {
  static SettingRouter _fromState(GoRouterState state) => SettingRouter(
        state.uri.queryParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/setting',
        queryParams: {
          'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRouter => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouterExtension._fromState,
    );

extension $LoginRouterExtension on LoginRouter {
  static LoginRouter _fromState(GoRouterState state) => const LoginRouter();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
