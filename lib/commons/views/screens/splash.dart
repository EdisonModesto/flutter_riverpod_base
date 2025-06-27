import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../feature/home/view/home.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routePath = "/splash";
  static const routeName = "splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (mounted) {
        context.go(HomeView.routePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Splash",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
