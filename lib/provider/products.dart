import 'dart:convert';
import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import '../model/httpError.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Future<void> getItems() async {
    try {
      const url = "http://10.0.2.2:5100/products";
      // const url = "https://acc6d527438b.ngrok.io/products";
      final data = await http.get(url);
      final extractedData = json.decode(data.body) as List<dynamic>;
      List<Product> loadedProducts = [];
      extractedData.forEach((prodData) {
        loadedProducts.add(
          Product(
            id: prodData["id"],
            price: prodData["price"],
            title: prodData["title"],
            description: prodData["description"],
            imageUrl: prodData["imageUrl"],
          ),
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Product findById(id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct() async {
    try {
      const url = "http://10.0.2.2:5100/product";
      // const url = "https://acc6d527438b.ngrok.io/product";
      var added = await http.post(
        url,
        body: json.encode(
          {
            "title": 'Trousers',
            "description": 'A nice pair of trousers.',
            "price": 59.99,
            "imageUrl":
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
          },
        ),
      );

      final extractedData = json.decode(added.body) as Map<String, dynamic>;
      _items.add(
        Product(
          id: extractedData["id"],
          price: extractedData["price"],
          title: extractedData["title"],
          description: extractedData["description"],
          imageUrl: extractedData["imageUrl"],
        ),
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProducts(Map data) async {
    try {
      final prodIndex = _items.indexWhere((prod) => prod.id == data["id"]);
      const url = "http://10.0.2.2:5100/product";
      // const url = "https://acc6d527438b.ngrok.io/product";
      var added = await http.put(
        url,
        body: json.encode(
          {...data},
        ),
      );

      final extractedData = json.decode(added.body) as Map<String, dynamic>;
      _items[prodIndex] = Product(
        id: extractedData["id"],
        price: extractedData["price"],
        title: extractedData["title"],
        description: extractedData["description"],
        imageUrl: extractedData["imageUrl"],
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProducts({String id}) async {
    final url = 'http://10.0.2.2:5100/product/$id';
    // final url = 'https://acc6d527438b.ngrok.io/product/$id';
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    final existingProduct = _items[prodIndex];
    _items.removeAt(prodIndex);
    notifyListeners();
    var res = await http.delete(url);
    if (res.statusCode >= 300) {
      _items.insert(prodIndex, existingProduct);
      notifyListeners();
      throw HttpException("Could not delete product");
    }
  }
}
