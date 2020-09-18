import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static final routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Product'),
        ),
        drawer: AppDrawer(),
        body: Consumer<Products>(
            builder: (_, value, __) => ListView.builder(
                  itemBuilder: (ctx, i) => UserProductItem(
                      value.products[i].title, value.products[i].imageUrl),
                  itemCount: value.products.length,
                )));
  }
}