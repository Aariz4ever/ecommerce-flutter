import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Remove this item to your cart?"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: Text("Yes"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? Text("Your cart is empty")
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(cart[index].name),
                          subtitle: Text(cart[index].price.toStringAsFixed(2)),
                          trailing: IconButton(
                            onPressed: () =>
                                removeItemFromCart(context, cart[index]),
                            icon: Icon(Icons.remove),
                          ),
                        );
                      }))
        ],
      ),
    );
  }
}
