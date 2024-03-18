import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/feature/figma/figma_screen.dart';

import '../../feature/figma/bloc/figma_bloc.dart';
import '../../feature/home/bloc/home_bloc.dart';
import '../../feature/home/home_screen.dart';
import '../services/dependency_injection/service_locator.dart';
import 'router_path.dart';

part 'router.g.dart';

class Routers {
  Routers._() {
    $router = GoRouter(
      routes: $appRoutes,
      navigatorKey: navigatorKey,
      redirect: (_, state) {
        return null;
      },
    );
  }
  final navigatorKey = GlobalKey<NavigatorState>();
  static final ins = Routers._();
  late final GoRouter $router;
}

@TypedGoRoute<RootApp>(
  path: $RouterPath.root,
  routes: [
    TypedGoRoute<HomeRouter>(path: $RouterPath.home),
    TypedGoRoute<ProductRouter>(path: $RouterPath.products),
    TypedGoRoute<ProfileRouter>(path: $RouterPath.profile),
    TypedGoRoute<SettingRouter>(path: $RouterPath.setting),
    TypedGoRoute<FigmaRouter>(path: $RouterPath.figma),
  ],
)
class RootApp extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const HomeEvent.started()),
      child: const HomeScreen(),
    );
  }
}

class HomeRouter extends GoRouteData {
  const HomeRouter(this.id);
  final String id;
  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(const HomeEvent.started()),
        child: const HomeScreen(),
      );
}

class ProductRouter extends GoRouteData {
  const ProductRouter(this.id);
  final String id;
  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(const HomeEvent.started()),
        child: const HomeScreen(),
      );
}

class ProfileRouter extends GoRouteData {
  const ProfileRouter(this.id);
  final String id;
  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(const HomeEvent.started()),
        child: const HomeScreen(),
      );
}

class SettingRouter extends GoRouteData {
  const SettingRouter(this.id);
  final String id;
  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(const HomeEvent.started()),
        child: const HomeScreen(),
      );
}

class FigmaRouter extends GoRouteData {
  const FigmaRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) =>
            getIt<FigmaBloc>()..add(const FigmaEvent.started()),
        child: const FigmaScreen(),
      );
}
