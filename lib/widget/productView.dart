import "package:flutter/material.dart";
import '../screen/productDetail.dart';
import "package:provider/provider.dart";
import "../provider/product.dart";

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Product>(
      builder: (ctx, product, child) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductDetail.routeName,
            arguments: product.id,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GridTile(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.fill,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              leading: IconButton(
                icon: Icon(
                    product.favorite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  product.addToFavorite();
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
