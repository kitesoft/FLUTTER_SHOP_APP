import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  const CartItem(
      {this.id, this.productId, this.title, this.price, this.quantity});

  @override
  Widget build(BuildContext context) {
    final cartContainer = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => cartContainer.removeItem(productId),
      confirmDismiss: (dismissDirection) => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Delete this item?')
                  ],
                ),
                content: Text(
                    'Are you sure you want to delete this item from cart?'),
                actions: [
                  FlatButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: Text('No')),
                  FlatButton(
                      onPressed: () => Navigator.of(ctx).pop(true),
                      child: Text('Yes')),
                ],
              )),
      background: Container(
        padding: EdgeInsets.only(right: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
      ),
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading:
                    CircleAvatar(child: FittedBox(child: Text('\$$price'))),
                title: Text(title),
                subtitle: Text('Total: \$${price * quantity}'),
                trailing: Text('$quantity x'),
              ))),
    );
  }
}
