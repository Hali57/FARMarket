import 'package:cloud_firestore/cloud_firestore.dart';

class Produce {
  String id;
  String imageUrl;
  String description;
  String location;
  double price;
  String category;

  Produce({
    this.id = '',
    required this.imageUrl,
    required this.description,
    required this.location,
    required this.price,
    required this.category,
  });
  

  // Method to return an empty Produce object
  factory Produce.empty() {
    return Produce(
      imageUrl: '',
      description: '',
      location: '',
      price: 0.0,
      category: '',
    );
  }


  Produce.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        imageUrl = snapshot['imageUrl'],
        description = snapshot['description'],
        location = snapshot['location'],
        price = snapshot['price'],
        category = snapshot['category'];

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'description': description,
      'location': location,
      'price': price,
      'category': category,
    };
  }
}
