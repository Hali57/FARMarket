import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';
import 'cart_model.dart';


class VeggiesGrainsScreen extends StatefulWidget {
  @override
  _VeggiesGrainsScreenState createState() => _VeggiesGrainsScreenState();
}

class _VeggiesGrainsScreenState extends State<VeggiesGrainsScreen> {
  final List<Product> products = [
    Product(
      name: 'Carrot',
      description: 'A root vegetable, usually orange in color.',
      quantity: 1,
      price: 1.99,
      imageUrl: 'assets/images/carrot.jpg',
    ),
    Product(
      name: 'Broccoli',
      description: 'An edible green plant in the cabbage family.',
      quantity: 1,
      price: 2.99,
      imageUrl: 'assets/images/broccoli.jpg',
    ),
    Product(
      name: 'Rice',
      description: 'A staple food in many parts of the world.',
      quantity: 1,
      price: 1.49,
      imageUrl: 'assets/images/rice.jpg',
    ),
    Product(
      name: 'Wheat',
      description: 'A cereal grain which is a worldwide staple food.',
      quantity: 1,
      price: 2.19,
      imageUrl: 'assets/images/wheat.jpg',
    ),
  ];

  List<Product> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    displayedProducts = products;
  }

  void _searchProducts(String query) {
    final results = products.where((product) {
      final productLower = product.name.toLowerCase();
      final queryLower = query.toLowerCase();

      return productLower.contains(queryLower);
    }).toList();

    setState(() {
      displayedProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veggies & Grains'),
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
              onChanged: _searchProducts,
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
              itemCount: displayedProducts.length,
              itemBuilder: (context, index) {
                final product = displayedProducts[index];
                return Card(
                  color: Colors.brown.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(product.imageUrl, fit: BoxFit.cover),
                      ),
                      SizedBox(height: 10),
                      Text(
                        product.name,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        product.description,
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, color: Colors.brown),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false).add(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${product.name} added to cart'),
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
