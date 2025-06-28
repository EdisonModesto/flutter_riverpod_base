import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/commons/providers/fire_auth_provider.dart';
import 'package:flutter_riverpod_base/feature/authentication/view/widgets/login_form.dart';
import 'package:flutter_riverpod_base/feature/authentication/view/widgets/register_form.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/strings.dart';
import '../../../utils/logger.dart';
import '../../home/view/home.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  static const routePath = "/auth";
  static const routeName = "auth";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  @override
  Widget build(BuildContext context) {
    //final userId = ref.watch(userIdProvider);

    ref.listen(userIdProvider, (previous, next) {
      if (next.value != null) {
        Log().info("User is logged in");
        GoRouter.of(context).pushReplacement(HomeView.routePath);
      } else {
        Log().info("User is not logged in");
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.appName,
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 400,
                    child: PageView(
                      children: const [LoginForm(), RegisterForm()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
