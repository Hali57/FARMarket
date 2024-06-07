// donations_screen.dart
import 'package:flutter/material.dart';

class DonationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donations'),
      ),
      body: Center(
        child: Text(
          'Donations Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
