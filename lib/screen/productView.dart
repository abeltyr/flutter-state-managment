import "package:flutter/material.dart";
import "../widget/productGrid.dart";
import "../widget/appDrawer.dart";

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
      ),
      drawer: AppDrawer(),
      body: ProductGrid(),
    );
  }
}
