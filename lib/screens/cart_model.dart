import 'package:flutter/material.dart';
import 'dart:io';

class CartModel extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void add(Product product) {
    final index = _cart.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      _cart[index].quantity += product.quantity;
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  void remove(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      _cart.remove(product);
    }
    notifyListeners();
  }

  int get totalItems {
    return _cart.fold(0, (total, current) => total + current.quantity);
  }

  double get totalPrice {
    return _cart.fold(0, (total, current) => total + (current.price * current.quantity));
  }
}

class Product {
  final String name;
  final String description;
  int quantity;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });
}
