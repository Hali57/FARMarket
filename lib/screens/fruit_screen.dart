import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';
import 'cart_model.dart';

class FruitScreen extends StatefulWidget {
  @override
  _FruitScreenState createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {
  final List<Product> fruits = [
    Product(
      name: 'Apple',
      description: 'A sweet, edible fruit produced by an apple tree.',
      quantity: 1,
      price: 1.99,
      imageUrl: 'assets/images/apple.jpg',
    ),
    Product(
      name: 'Banana',
      description:
          'An elongated, edible fruit produced by several kinds of large herbaceous flowering plants.',
      quantity: 1,
      price: 0.99,
      imageUrl: 'assets/images/banana.jpg',
    ),
    Product(
      name: 'Orange',
      description:
          'The fruit of various citrus species in the family Rutaceae.',
      quantity: 1,
      price: 1.49,
      imageUrl: 'assets/images/orange.jpg',
    ),
    Product(
      name: 'Strawberry',
      description: 'A widely grown hybrid species of the genus Fragaria.',
      quantity: 1,
      price: 2.99,
      imageUrl: 'assets/images/strawberry.jpg',
    ),
  ];

  List<Product> displayedFruits = [];

  @override
  void initState() {
    super.initState();
    displayedFruits = fruits;
  }

  void _searchFruits(String query) {
    final results = fruits.where((fruit) {
      final fruitLower = fruit.name.toLowerCase();
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
      body: Column(
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
              onChanged: _searchFruits,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: displayedFruits.length,
              itemBuilder: (context, index) {
                final fruit = displayedFruits[index];
                return Card(
                  color: Colors.orange.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(fruit.imageUrl, fit: BoxFit.cover),
                      ),
                      SizedBox(height: 10),
                      Text(
                        fruit.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        fruit.description,
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\$${fruit.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, color: Colors.orange),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .add(fruit);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${fruit.name} added to cart'),
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
            ),
          ),
        ],
      ),
    );
  }
}
