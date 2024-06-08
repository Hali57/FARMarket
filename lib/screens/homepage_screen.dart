// home_page.dart
import 'package:flutter/material.dart';
import 'market_screen.dart';
import 'services_screen.dart';
import 'donations_screen.dart';

final gradient = LinearGradient(
  begin: Alignment.topLeft, // Start point of the gradient
  end: Alignment.bottomRight, // End point of the gradient
  colors: [Color(0xff3FA843), Color(0xffED7E0D)], // Colors to blend
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    MarketScreen(),
    ServicesScreen(),
    DonationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'FARM',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3FA843), // Customize color for "FARM"
                  ),
                ),
                TextSpan(
                  text: 'arket',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xffED7E0D), // Customize color for "arket"
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
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: gradient,
              ),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('Services'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Donations'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context); // close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
