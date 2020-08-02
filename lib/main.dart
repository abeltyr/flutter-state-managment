import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "./screen/productView.dart";
import './screen/productDetail.dart';
import './provider/products.dart';
import './provider/cart.dart';
import './provider/order.dart';
import './screen/carts.dart';
import './screen/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductScreen(),
          ProductDetail.routeName: (ctx) => ProductDetail(),
          Carts.routeName: (ctx) => Carts(),
          OrderScreen.routeName: (ctx) => OrderScreen()
        },
      ),
    );
  }
}
