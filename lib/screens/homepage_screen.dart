import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'market_screen.dart';
import 'services_screen.dart';
import 'donations_screen.dart';
import 'profile_screen.dart';

const gradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xff3FA843), Color(0xffED7E0D)],
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const MarketScreen(),
    const ServicesScreen(),
    const DonationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);

      try {
        await _uploadImage(imageFile);
        setState(() {}); // Refresh UI after successful upload
      } catch (e) {
        print('Error uploading image: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload image: $e')),
        );
      }
    }
  }

  Future<String> _uploadImage(File image) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    try {
      String fileName = '${user.uid}_${DateTime.now().millisecondsSinceEpoch}';
      Reference storageRef = FirebaseStorage.instance.ref().child('profile_pictures/$fileName');

      UploadTask uploadTask = storageRef.putFile(image);
      TaskSnapshot snapshot = await uploadTask;

      String downloadURL = await snapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'profilePicture': downloadURL,
      });

      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      throw Exception("Error uploading image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'FARM',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3FA843),
                  ),
                ),
                TextSpan(
                  text: 'arket',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xffED7E0D),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: gradient,
                    ),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (snapshot.hasError) {
                  return const DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: gradient,
                    ),
                    child: Center(child: Text('Error loading profile')),
                  );
                }

                final userData = snapshot.data!.data() as Map<String, dynamic>;
                final profilePicture = userData['profilePicture'] ?? 'https://via.placeholder.com/150';

                return UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: gradient,
                  ),
                  accountName: Text(userData['fullName'] ?? 'No name'),
                  accountEmail: Text(user.email ?? 'No email'),
                  currentAccountPicture: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profilePicture),
                      onBackgroundImageError: (error, stackTrace) {
                        print('Failed to load profile picture: $error');
                      },
                    ),
                  ),
                );
              },
            ),
            _buildDrawerItem(Icons.home, 'Home', 0),
            _buildDrawerItem(Icons.build, 'Services', 1),
            _buildDrawerItem(Icons.favorite, 'Donations', 2),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          icon,
          key: ValueKey<int>(_selectedIndex),
          color: _selectedIndex == index ? Colors.blue : Colors.black,
        ),
      ),
      title: Text(title),
      onTap: () {
        _onItemTapped(index);
        Navigator.pop(context); // close the drawer
      },
    );
  }
}
