import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ApiService {
  static Future<List<Product>> fetchProducts() async {
    try {
      // Local JSON dosyasından oku
      final String response = await rootBundle.loadString('assets/data/products.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Ürünler yüklenemedi: $e');
    }
  }
}