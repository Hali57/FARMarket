// home_page.dart
import 'package:flutter/material.dart';
import 'market_screen.dart';
import 'services_screen.dart';
import 'donations_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static  List<Widget> _pages = <Widget>[
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
        title: Text('Flutter Navigation Bar'),
      ),
      body: _pages.elementAt(_selectedIndex),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation',
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
