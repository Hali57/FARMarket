// donations_screen.dart
import 'package:flutter/material.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donations'),
      ),
      body: const Center(
        child: Text(
          'Donations Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
