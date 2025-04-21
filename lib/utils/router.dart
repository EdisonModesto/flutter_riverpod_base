import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/commons/providers/auth_state_provider.dart';
import 'package:flutter_riverpod_base/feature/home/chats/chats_screen.dart';
import 'package:flutter_riverpod_base/feature/home/dashboard/dashboard_screen.dart';
import 'package:flutter_riverpod_base/utils/config.dart';
import 'package:go_router/go_router.dart';

import '../commons/views/screens/splash.dart';
import '../feature/authentication/view/auth_view.dart';
import '../feature/home/home_nav.dart';

List<String> authLocations = [AuthView.routeName];
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: AuthView.routePath,
  debugLogDiagnostics: AppConfig.devMode,
  redirect: (context, state) {
    // Check if user is logged in
    if (FirebaseAuth.instance.currentUser == null) {
      //if user is not logged in, and trying to access an auth page, allow access
      if (authLocations.contains(state.matchedLocation.split('/')[1])) {
        return null;
      } else {
        //if user is not logged in, and trying to access a non-auth page, redirect to login
        return AuthView.routePath;
      }
    }

    //if user is logged in, and trying to access a splash page, redirect to home
    if (state.matchedLocation.split('/')[1] == SplashView.routeName) {
      return null;
    }

    if (!authLocations.contains(state.matchedLocation.split('/')[1])) {
      return null;
    }

    //if user is logged in, and trying to access a non-auth page, allow access
    return DashboardScreen.routePath;
  },
  navigatorKey: _rootNavigatorKey,
  refreshListenable: AuthChangeNotifier(),
  routes: [
    GoRoute(
      path: AuthView.routePath,
      name: AuthView.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const AuthView();
      },
    ),
    GoRoute(
      path: SplashView.routePath,
      name: SplashView.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => HomeNavPage(child: child),
      routes: [
        GoRoute(
          path: DashboardScreen.routePath,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: ChatsScreen.routePath,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const ChatsScreen(),
        ),
      ],
    ),
  ],
);
