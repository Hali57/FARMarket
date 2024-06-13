import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onSecondary,
      appBar: AppBar(
          backgroundColor: const Color(0xFFF5E0C3),
          title: const Center(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, '/login'),
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, '/register'),
                      },
                      child: const Text('Register'),
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
