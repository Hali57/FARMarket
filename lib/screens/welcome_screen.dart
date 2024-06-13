import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onSecondary,
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
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff3FA843),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, '/login'),
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(width: 5.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xffED7E0D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
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
