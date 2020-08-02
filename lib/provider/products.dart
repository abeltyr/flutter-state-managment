import 'dart:convert';
import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Future<void> getItems() async {
    // http
    //     .get(url)
    //     .then(
    //       (res) => {
    //         print(
    //           json.decode(res.body),
    //         ),
    //         _items = json.decode(res.body)
    //       },
    //     )
    //     .catchError(
    //       (onError) => {
    //         print(onError),
    //       },
    //     );
    try {
      // const url = "http://10.0.2.2:5100/products";
      const url = "https://acc6d527438b.ngrok.io/products";
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
            // createdAt:
            //     DateFormat('dd/MM/yyyy hh:mm').format(prodData["createdAt"]),
            // updatedAt:
            //     DateFormat('dd/MM/yyyy hh:mm').format(prodData["updatedAt"]),
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

  Future<void> addProduct(value) {
    // const url = "http://10.0.2.2:5100/product";
    // http.post(
    //   url,
    //   body: json.encode(
    //     {
    //       "title": 'Trousers',
    //       "description": 'A nice pair of trousers.',
    //       "price": 59.99,
    //       "imageUrl":
    //           'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    //     },
    //   ),
    // );
    // _items.add(value);
    return Future.value();
    notifyListeners();
  }


  Future<void> updateProducts() async {
    // http
    //     .get(url)
    //     .then(
    //       (res) => {
    //         print(
    //           json.decode(res.body),
    //         ),
    //         _items = json.decode(res.body)
    //       },
    //     )
    //     .catchError(
    //       (onError) => {
    //         print(onError),
    //       },
    //     );
    try {
      // const url = "http://10.0.2.2:5100/products";
      const url = "https://acc6d527438b.ngrok.io/products";
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
            // createdAt:
            //     DateFormat('dd/MM/yyyy hh:mm').format(prodData["createdAt"]),
            // updatedAt:
            //     DateFormat('dd/MM/yyyy hh:mm').format(prodData["updatedAt"]),
          ),
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
