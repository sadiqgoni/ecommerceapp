
import 'dart:convert';

Map<String, SneakersShop> sneakersShopFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, SneakersShop>(k, SneakersShop.fromJson(v)));

String sneakersShopToJson(Map<String, SneakersShop> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class SneakersShop {
  final int id;
  final String name;
  final String brand;
  final String gender;
  final String category;
  final String price;
  final bool isInInventory;
  final int itemsLeft;
  final String imageUrl;
  final String slug;
  final int featured;
  final List<dynamic> sizes;
  final String description;
  final String title;

  SneakersShop({
    required this.id,
    required this.name,
    required this.brand,
    required this.gender,
    required this.category,
    required this.price,
    required this.isInInventory,
    required this.itemsLeft,
    required this.imageUrl,
    required this.slug,
    required this.featured,
    required this.sizes,
    required this.description,
    required this.title,
  });

  factory SneakersShop.fromJson(Map<String, dynamic> json) => SneakersShop(
    id: json["id"],
    name: json["name"],
    brand: json["brand"],
    gender: json["gender"],
    category: json["category"],
    price: json["price"],
    isInInventory: json["is_in_inventory"],
    itemsLeft: json["items_left"],
    imageUrl: json["imageURL"],
    slug: json["slug"],
    featured: json["featured"],
    sizes: List<dynamic>.from(json["sizes"].map((x) => (x))),
    description: json["description"],
    title: json["title"],
  );


}

