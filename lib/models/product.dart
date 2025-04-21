// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  factory Product({
    required int id,
    required String title,
    required String description,
  }) = _Product;

  factory Product.fromJson(String source) => _$ProductFromJson(json.decode(source));
}
