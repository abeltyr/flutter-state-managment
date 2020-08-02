import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String productId;
  int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.productId,
    this.quantity = 1,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach(
      (key, cartItems) {
        total += cartItems.price * cartItems.quantity;
      },
    );
    return total;
  }

  void addItems({String productId, String title, double price}) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (value) {
        return CartItem(
            id: value.id,
            title: value.title,
            productId: value.productId,
            price: value.price,
            quantity: value.quantity + 1);
      });
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            productId: productId,
            price: price),
      );
    }
    notifyListeners();
  }

  void removeItems({String productId}) {
    _items.remove(productId);
    notifyListeners();
  }

  void updateQuantity({String productId, int quantity}) {
    if (_items.containsKey(productId) && quantity != 0) {
      _items.update(productId, (value) {
        return CartItem(
            id: value.id,
            title: value.title,
            productId: value.productId,
            price: value.price,
            quantity: quantity);
      });
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
