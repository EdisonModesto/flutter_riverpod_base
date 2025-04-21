import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/feature/home/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

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
      context.go(DashboardScreen.routePath);
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
