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
        future:
            FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;

          final profilePicture =
              userData['profilePicture'] ?? 'https://via.placeholder.com/150';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profilePicture),
                  ),
                  const SizedBox(height: 10),
                  Text('Name: ${userData['fullName'] ?? 'No name'}',
                      style: TextStyle(fontSize: 18, color: Color(0xff3FA843))),
                  const SizedBox(height: 10),
                  Text(
                    'Wallet: \$${userData['wallet'] ?? 0.0}',
                    style: TextStyle(fontSize: 18, color: Color(0xffED7E0D)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
