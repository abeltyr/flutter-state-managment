import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../provider/products.dart";
import "../widget/badge.dart";
import "../provider/cart.dart";
import "../screen/carts.dart";

class ProductDetail extends StatelessWidget {
  static const routeName = "/productDetail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    // final product =
    //     Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Consumer<Cart>(
          builder: (ctx, cartData, childData) =>
              Badge(value: cartData.itemCount.toString(), child: childData),
          child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Carts.routeName);
              }),
        ),
      ),
    ));
  }
}
