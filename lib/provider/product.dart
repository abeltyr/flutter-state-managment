import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  // final String createdAt;
  // final String updatedAt;
  bool favorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    // @required this.createdAt,
    // @required this.updatedAt,
    this.favorite = false,
  });

  void addToFavorite() {
    favorite = !favorite;
    notifyListeners();
  }
}
