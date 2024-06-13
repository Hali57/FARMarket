import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.cart.length,
                  itemBuilder: (context, index) {
                    final product = cart.cart[index];
                    return Card(
                      child: ListTile(
                        leading: Image.asset(product.imageUrl),
                        title: Text(product.name),
                        subtitle: Text('${product.description}\n\$${product.price.toStringAsFixed(2)}'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cart.increaseQuantity(product);
                              },
                            ),
                            Text('${product.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                cart.decreaseQuantity(product);
                                if (product.quantity == 0) {
                                  cart.remove(product);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement checkout functionality here
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
