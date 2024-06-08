import 'package:flutter/material.dart';
import 'package:farmboost/models/produce_model.dart';

class ProduceProvider with ChangeNotifier {
  final List<Produce> _fruits = [];
  final List<Produce> _veggiesGrains = [];

  List<Produce> get fruits => _fruits;
  List<Produce> get veggiesGrains => _veggiesGrains;

  void addProduce(Produce produce) {
    if (produce.category == 'Fruit') {
      _fruits.add(produce);
    } else {
      _veggiesGrains.add(produce);
    }
    notifyListeners();
  }
}