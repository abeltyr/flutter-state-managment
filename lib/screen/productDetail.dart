import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../provider/products.dart";

class ProductDetail extends StatelessWidget {
  static const routeName = "/productDetail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product =
        Provider.of<Products>(context, listen: false).findById(productId);
    print(product);
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Text(
        "ProductDetail",
      )),
    ));
  }
}
