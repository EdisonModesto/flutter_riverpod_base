import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/feature/home/chats/chats_screen.dart';
import 'package:flutter_riverpod_base/feature/home/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

import '../../commons/providers/fire_auth_provider.dart';
import '../../commons/providers/user_data_provider.dart';
import '../../utils/logger.dart';
import '../authentication/view/auth_view.dart';
import '../product/view/products.dart';

class HomeNavPage extends ConsumerStatefulWidget {
  const HomeNavPage({super.key, required this.child});
  final Widget child;

  static const routePath = "/home-nav";
  static const routeName = "home-nav";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeNavPage> {
  int currentIndex = 0;

  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go(DashboardScreen.routePath);
        break;
      case 1:
        context.go(ChatsScreen.routePath);
        break;
      default:
        context.go(DashboardScreen.routePath);
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeTab,
        backgroundColor: const Color(0xffe0b9f6),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
      ),
    );
  }
}
