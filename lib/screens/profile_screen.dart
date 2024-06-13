import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.photoURL ?? 'https://via.placeholder.com/150'),
                ),
                const SizedBox(height: 10),
                Text('Name: ${userData['name']}'),
                Text('Email: ${user.email}'),
                Text('Location: ${userData['location']}'),
                Text('National ID: ${userData['nationalId']}'),
                Text('Role: ${userData['role']}'),
                if (userData['role'] == 'farmer') ...[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sell');
                    },
                    child: const Text('Sell a Product'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sales');
                    },
                    child: const Text('View Sales'),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
