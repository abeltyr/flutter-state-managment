import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../provider/cart.dart" show Cart;
import "../provider/order.dart";
import "../widget/cartItem.dart";
import "./order.dart";

class Carts extends StatelessWidget {
  static const routeName = "/carts";

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Chip(
                      backgroundColor: Colors.indigoAccent,
                      label: Text(
                        '\$${cartData.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Provider.of<Orders>(
                          context,
                          listen: false,
                        ).addOrder(
                            amount: cartData.totalAmount,
                            cartProducts: cartData.items.values.toList());
                        cartData.clear();
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('An error occurred!'),
                            content:
                                Text('An error occurred! and it goes here'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      OrderScreen.routeName);
                                },
                                child: Text("Okay"),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      OrderScreen.routeName);
                                },
                                child: Text("Okay"),
                              )
                            ],
                          ),
                        );
                      },
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(color: Colors.indigoAccent),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartData.items.length,
                itemBuilder: (ctx, int i) {
                  print(i);
                  print(cartData.items[i]);
                  return CartItemWidget(
                    id: cartData.items.values.toList()[i].id,
                    price: cartData.items.values.toList()[i].price,
                    quantity: cartData.items.values.toList()[i].quantity,
                    title: cartData.items.values.toList()[i].title,
                    productId: cartData.items.values.toList()[i].productId,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
