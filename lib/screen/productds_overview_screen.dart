import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/screen/cart_screens.dart';
import 'package:my_shop/widgets/app_drawer.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:my_shop/widgets/prodacts_grid.dart';
import 'package:my_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/products.dart';

enum FilterOptions { Favourites, All }

class ProductsOverViewScreen extends StatefulWidget {
  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
// final List<Product> loadedProducts =
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  var _showFavouriteOnyl = false;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("MY Shop"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favourites) {
                  _showFavouriteOnyl = true;
                } else {
                  _showFavouriteOnyl = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (_, cart, child) =>
                Badge(value: cart.itemCount.toString(), child: child!, ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProdactsGrid(_showFavouriteOnyl),
    );
  }
}
