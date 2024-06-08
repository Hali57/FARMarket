import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'cart_screen.dart';
import 'cart_model.dart';
import '../providers/produce_provider.dart';
import '../models/produce_model.dart';

class FruitScreen extends StatefulWidget {
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
        title: Text('Fruits'),
        backgroundColor: Color(0xFFF5E0C3),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                  ),
                  if (cart.totalItems > 0)
                    Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '${cart.totalItems}',
                          style: TextStyle(
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
                    prefixIcon: Icon(Icons.search),
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                              SizedBox(height: 10),
                              Text(
                                fruit.description,
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                fruit.location,
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                '\$${fruit.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.orange),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
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
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                child: Text('Add to Cart'),
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
