import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../provider/cart.dart" show Cart;

class CartItemWidget extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;

  CartItemWidget({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
    @required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.redAccent,
        child: Icon(Icons.delete, color: Colors.white, size: 40),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: const EdgeInsets.all(5.0),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItems(productId: productId);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(child: Text('\$$price')),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${price * quantity}'),
          trailing: Container(
            width: 75,
            child: FittedBox(
              child: Consumer<Cart>(
                builder: (ctx, cartData, childData) => Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        cartData.updateQuantity(
                            productId: productId, quantity: quantity + 1);
                      },
                      child: Icon(
                        Icons.add,
                        size: 12,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: 8),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        cartData.updateQuantity(
                            productId: productId, quantity: quantity - 1);
                      },
                      child: Icon(
                        Icons.remove,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
