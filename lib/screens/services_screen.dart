// services_screen.dart
import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Center(
        child: Text(
          'Services Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
