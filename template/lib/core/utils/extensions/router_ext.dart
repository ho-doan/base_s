part of 'extensions.dart';

extension GoRouterStateX on GoRouterState {
  String get location => path ?? uri.path;
}

extension Keys on GlobalKey<NavigatorState> {
  BuildContext get context => currentContext!;
}

extension DelegateX on GoRouterDelegate {
  Future<T?> push<T extends Object?>(String location, {Object? extra}) =>
      navigatorKey.context.push(location, extra: extra);
  void go(String location, {Object? extra}) =>
      navigatorKey.context.go(location, extra: extra);
  String get location => currentConfiguration.last.matchedLocation;
}

extension RouterGoYX on GoRouter {
  String get location => routerDelegate.location;
}
