import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/product.dart';
import '../../../res/strings.dart';
import '../../../utils/config.dart';
import '../../../utils/snackbar_service.dart';
import '../repository/product.dart';

final productControllerProvider = Provider((ref) {
  final repo = ref.watch(productRepoProvider);
  return ProductController(repo: repo);
});

class ProductController {
  final ProductRepo _repo;
  ProductController({required ProductRepo repo}) : _repo = repo;

  Future<List<Product>?> getProducts({BuildContext? context}) async {
    final result = await _repo.getProducts();
    return result.fold(
      (failure) {
        if (AppConfig.devMode && context != null) {
          SnackBarService.showSnackBar(context: context, message: SnackBarMessages.productLoadFailed);
        }
        return null;
      },
      (products) {
        if (AppConfig.devMode && context != null) {
          SnackBarService.showSnackBar(context: context, message: SnackBarMessages.productLoadSuccess);
        }
        return products;
      },
    );
  }
}
