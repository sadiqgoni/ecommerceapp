import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import '../model/sneakers_model.dart';

class Sneakers {
  Future<List<SneakersShop>> fetchProductData(String category) async {
    try {
      final String jsonData =
      await rootBundle.loadString("lib/json/product_json.json");
      final Map<String, dynamic> data = jsonDecode(jsonData);

      // Filter the product data based on the category
      List productList = data.values.toList();
      List<SneakersShop> filteredList = productList
          .where((product) => product['gender'] == category)
          .map((product) => SneakersShop.fromJson(product))
          .toList();
      return filteredList;
    } catch (e) {
      print('Error fetching product data: $e');
      throw Exception('Failed to fetch product data');
    }
  }


  Future<List<SneakersShop>> getSneakersByItems(
      int id,
      String gender,
      String name,
      String category,
      int itemsLeft,
      String price,
      ) async {
    try {
      final String jsonData =
      await rootBundle.loadString("lib/json/product_json.json");
      final Map<String, dynamic> data = jsonDecode(jsonData);

      // Filter the product data based on the ID and category
      List<dynamic> productList = data.values.toList();
      List<SneakersShop> filteredList = productList
          .where((product) =>
      product['id'] == id &&
          product['gender'] == gender &&
          product['name'] == name &&
          product['category'] == category &&
          product['items_left'] == itemsLeft &&
          product['price'] == price)
          .map((product) => SneakersShop.fromJson(product))
          .toList();
      return filteredList;
    } catch (e) {
      print('Error fetching product data: $e');
      throw Exception('Failed to fetch product data');
    }
  }

}
