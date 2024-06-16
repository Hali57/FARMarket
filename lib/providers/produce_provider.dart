import 'package:flutter/material.dart';
import 'package:farmboost/models/produce_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProduceProvider with ChangeNotifier {
  final List<Produce> _fruits = [];
  final List<Produce> _veggiesGrains = [];

  List<Produce> get fruits => _fruits;
  List<Produce> get veggiesGrains => _veggiesGrains;

  ProduceProvider() {
    fetchProduce();
  }

  Future<void> addProduce(Produce produce, BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('produce')
            .add({
          'imageUrl': produce.imageUrl,
          'description': produce.description,
          'location': produce.location,
          'price': produce.price,
          'category': produce.category,
          'userId': user.uid, // Include user ID for query purposes
        });

        if (produce.category == 'Fruit') {
          _fruits.add(produce);
        } else {
          _veggiesGrains.add(produce);
        }
        notifyListeners();
        _showSuccessDialog(context, 'Produce added successfully');
      }
    } catch (e) {
      _showErrorDialog(context, 'Error adding produce to Firestore: $e');
    }
  }

  Future<void> updateProduce(Produce produce, String docId, BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('produce')
            .doc(docId)
            .update({
              'imageUrl': produce.imageUrl,
              'location': produce.location,
              'price': produce.price,
            });

        // Update local list
        if (produce.category == 'Fruit') {
          int index = _fruits.indexWhere((element) => element.id == docId);
          if (index != -1) {
            _fruits[index].imageUrl = produce.imageUrl;
            _fruits[index].location = produce.location;
            _fruits[index].price = produce.price;
          }
        } else {
          int index = _veggiesGrains.indexWhere((element) => element.id == docId);
          if (index != -1) {
            _veggiesGrains[index].imageUrl = produce.imageUrl;
            _veggiesGrains[index].location = produce.location;
            _veggiesGrains[index].price = produce.price;
          }
        }
        notifyListeners();
        _showSuccessDialog(context, 'Produce updated successfully');
      }
    } catch (e) {
      _showErrorDialog(context, 'Error updating produce: $e');
    }
  }

  Produce? getProduceByCategoryAndDetails(String category, String description) {
    Produce? foundProduce;
    if (category == 'Fruit') {
      foundProduce = _fruits.firstWhere(
        (produce) => produce.category == category && produce.description == description,
        orElse: () => Produce.empty(),
      );
    } else {
      foundProduce = _veggiesGrains.firstWhere(
        (produce) => produce.category == category && produce.description == description,
        orElse: () => Produce.empty(),
      );
    }
    return foundProduce;
  }

  Future<void> fetchProduce() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('produce')
          .get();

      final List<Produce> loadedFruits = [];
      final List<Produce> loadedVeggiesGrains = [];

      snapshot.docs.forEach((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final produce = Produce(
          id: doc.id,
          imageUrl: data['imageUrl'],
          description: data['description'],
          location: data['location'],
          price: data['price'],
          category: data['category'],
        );
        if (produce.category == 'Fruit') {
          loadedFruits.add(produce);
        } else {
          loadedVeggiesGrains.add(produce);
        }
      });

      _fruits.clear();
      _veggiesGrains.clear();
      _fruits.addAll(loadedFruits);
      _veggiesGrains.addAll(loadedVeggiesGrains);
      notifyListeners();
    } catch (e) {
      print('Error fetching produce from Firestore: $e');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Success'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }
}
