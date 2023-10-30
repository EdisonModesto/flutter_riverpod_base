import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../commons/providers/fire_auth_provider.dart';
import '../../../commons/providers/user_data_provider.dart';
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

    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () async {
            FirebaseAuth.instance.signOut();
          },
          child: userData.when(
            data: (data) {
              return Text(data.email!);
            },
            error: (error, stack) {
              return null;
            },
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
      body: const ProductsList(),
    );
  }
}
