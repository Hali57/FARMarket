import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'cart_screen.dart';
import 'cart_model.dart';
import '../providers/produce_provider.dart';
import '../models/produce_model.dart';

class FruitScreen extends StatefulWidget {
  const FruitScreen({super.key});

  @override
  _FruitScreenState createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {
  List<Produce> displayedFruits = [];

  @override
  void initState() {
    super.initState();
    displayedFruits = [];
  }

  void _searchFruits(String query, List<Produce> fruits) {
    final results = fruits.where((fruit) {
      final fruitLower = fruit.description.toLowerCase();
      final queryLower = query.toLowerCase();

      return fruitLower.contains(queryLower);
    }).toList();

    setState(() {
      displayedFruits = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text('Fruits',
                style: TextStyle(color: Color(0xff3FA843)))),
        backgroundColor: const Color(0xFFF5E0C3),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Color(0xffED7E0D),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()),
                      );
                    },
                  ),
                  if (cart.totalItems > 0)
                    Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '${cart.totalItems}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image.asset(
          //   'assets/images/gold.jpg',
          //   fit: BoxFit.cover,
          // ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (query) {
                    _searchFruits(
                        query,
                        Provider.of<ProduceProvider>(context, listen: false)
                            .fruits);
                  },
                ),
              ),
              Expanded(
                child: Consumer<ProduceProvider>(
                  builder: (context, produceProvider, child) {
                    final fruits = produceProvider.fruits;
                    final List<Produce> productsToDisplay =
                        displayedFruits.isEmpty ? fruits : displayedFruits;

                    return GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: productsToDisplay.length,
                      itemBuilder: (context, index) {
                        final fruit = productsToDisplay[index];
                        return Card(
                          color: Colors.orange.shade50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Image.file(File(fruit.imageUrl),
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                fruit.description,
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                fruit.location,
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '\$${fruit.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.orange),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                ),
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .add(Product(
                                    name: fruit.description,
                                    description: fruit.description,
                                    quantity: 1,
                                    price: fruit.price,
                                    imageUrl: fruit.imageUrl,
                                  ));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${fruit.description} added to cart'),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                child: const Text('Add to Cart'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
