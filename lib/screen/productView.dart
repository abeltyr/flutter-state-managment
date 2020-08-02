import "package:flutter/material.dart";
import "../widget/productGrid.dart";
import "../widget/appDrawer.dart";
import "../provider/products.dart";
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    // Provider.of<Products>(context, listen: false).getItems().then(
    //   (value) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   },
    // );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).getItems().then(
        (value) {
          setState(() {
            _isLoading = false;
          });
        },
      );
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  Future<void> _refreshProducts(BuildContext context) async {
    try {
      await Provider.of<Products>(context, listen: false).getItems();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _refreshProducts(context),
              child: ProductGrid(),
            ),
    );
  }
}
