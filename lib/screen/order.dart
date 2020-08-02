import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../provider/order.dart";
import "../widget/orderItem.dart";
import "../widget/appDrawer.dart";

class OrderScreen extends StatelessWidget {
  static const routeName = "/order";

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, index) => OrderItemWidget(
          order: orderData.orders[index],
        ),
      ),
    );
  }
}
