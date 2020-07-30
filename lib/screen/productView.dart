import "package:flutter/material.dart";
import "../widget/productGrid.dart";

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProductGrid(),
      ),
    );
  }
}
