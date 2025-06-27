import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/commons/providers/auth_state_provider.dart';
import 'package:go_router/go_router.dart';

import '../commons/views/screens/splash.dart';
import '../feature/authentication/view/auth_view.dart';
import '../feature/home/view/home.dart';

List<String> authLocations = [AuthView.routeName];

final GoRouter router = GoRouter(
  initialLocation: AuthView.routePath,
  debugLogDiagnostics: true,
  redirect: (context, state) {
    if (FirebaseAuth.instance.currentUser == null) {
      log('the name: ${state.matchedLocation}');

      log('the name: ${state.matchedLocation.split('/')[1]}');

      if (authLocations.contains(state.matchedLocation.split('/')[1])) {
        return null;
      } else {
        return AuthView.routePath;
      }
    }

    return HomeView.routePath;
  },
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
    GoRoute(
      path: HomeView.routePath,
      name: HomeView.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
  ],
);
