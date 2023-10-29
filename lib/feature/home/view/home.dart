import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/feature/authentication/repository/auth_repository.dart';
import 'package:go_router/go_router.dart';

import '../../../commons/providers/fire_auth_provider.dart';
import '../../../res/strings.dart';
import '../../../utils/logger.dart';
import '../../authentication/view/auth_view.dart';
import '../../product/view/products.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const routePath = "/home";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      userIdProvider,
      (previous, next) {
        if (next.value != null) {
          Log().info("User is logged in");
        } else {
          Log().info("User is not logged in");
          GoRouter.of(context).pushReplacement(AuthView.routePath);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () async {
            await AuthRepo().signOut();
          },
          child: const Text(
            AppStrings.appName,
          ),
        ),
      ),
      body: const ProductsList(),
    );
  }
}
