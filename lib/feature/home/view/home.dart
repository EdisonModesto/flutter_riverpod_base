import 'package:flutter/material.dart';

import '../../../res/strings.dart';
import '../../product/view/products.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routePath = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: const ProductsList(),
    );
  }
}
