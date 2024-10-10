import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Add this item to your cart?"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().addToCart(product);
                  },
                  child: Text("Yes"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Icon(Icons.favorite),
          Text(product.name),
          Text(product.description),
          Text(product.price.toStringAsFixed(2)),
          Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => addToCart(context),
            ),
          )
        ],
      ),
    );
  }
}
