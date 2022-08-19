import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/providers/products.dart';
import 'package:my_shop/screen/cart_screens.dart';
import 'package:my_shop/screen/product_detail_screen.dart';
import 'package:my_shop/screen/productds_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (ctx)=> Products(),
        ),
      ChangeNotifierProvider(
        create: (ctx)=> Cart(),
      ),
    ],
     child: MaterialApp(
      title: 'MYShop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: ProductsOverViewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartScreen.routName: (ctx) => CartScreen()
      },
    ));
  }
}
