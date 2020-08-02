import "package:flutter/material.dart";
import 'package:stateManagement/provider/products.dart';
import '../screen/productDetail.dart';
import "package:provider/provider.dart";
import "../provider/product.dart";
import "../provider/products.dart";
import "../provider/cart.dart";

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    final product = Provider.of<Product>(context, listen: false);
    final products = Provider.of<Products>(context, listen: false);
    final cartData = Provider.of<Cart>(context, listen: false);
    return GestureDetector(
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
            title: GestureDetector(
              onTap: () async {
                try {
                  await products.deleteProducts(id: product.id);
                  print("pass");
                } catch (e) {
                  print("error");
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text('deleting Failed', textAlign: TextAlign.center,),
                    ),
                  );
                }
              },
              child: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
            ),
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                icon: Icon(
                    product.favorite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  products.addProduct();
                  product.addToFavorite();
                },
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                products.updateProducts({
                  "id": product.id,
                  "title": product.title,
                  "description": product.description,
                  "price": product.price,
                  "imageUrl":
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg"
                  // product.imageUrl,
                });

                cartData.addItems(
                  productId: product.id,
                  title: product.title,
                  price: product.price,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
