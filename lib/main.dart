import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "./screen/productView.dart";
import './screen/productDetail.dart';
import './provider/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductScreen(),
          ProductDetail.routeName: (ctx) => ProductDetail(),
        },
      ),
    );
  }
}
