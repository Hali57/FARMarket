import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onSecondary,
      appBar: AppBar(
          backgroundColor: Color(0xFFF5E0C3),
          title: Center(
              child: Text(
            ' FARMarket',
          ))),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/grocery.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, '/login'),
                      },
                      child: Text('Login'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, '/register'),
                      },
                      child: Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
