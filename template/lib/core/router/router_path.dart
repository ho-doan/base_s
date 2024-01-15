class RouterPath {
  RouterPath();
  static const String root = '/';
  static const home = 'home';
  static const profile = 'profile';
  static const setting = 'setting';
  static const products = 'product';
  static const product = 'product/:id';
}

enum AppRouter {
  root,
  home,
  profile,
  setting,
  products,
  product,
}

extension AppRouterX on AppRouter {
  String get path {
    return switch (this) {
      AppRouter.root => RouterPath.root,
      AppRouter.home => RouterPath.home,
      AppRouter.profile => RouterPath.profile,
      AppRouter.setting => RouterPath.setting,
      AppRouter.products => RouterPath.products,
      AppRouter.product => RouterPath.product,
    };
  }
}
