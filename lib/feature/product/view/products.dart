import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/feature/product/view/widgets/product_list_item.dart';

import '../controller/product.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(productControllerProvider);
    return FutureBuilder(
      future: productController.getProducts(context: context),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error Loading Data"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (data != null) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ProductListItem(product: data[index]);
              },
            );
          } else {
            return const Center(
              child: Text("Error Loading Data"),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
