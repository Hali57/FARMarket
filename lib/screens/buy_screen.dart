import 'package:flutter/material.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key});

  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<BuyScreen> {
  bool _isFruitFocused = false;
  bool _isOtherFocused = false;

  void _onTapFruit() {
    setState(() {
      _isFruitFocused = true;
      _isOtherFocused = false;

      Navigator.pushReplacementNamed(context, '/fruit');
    });
  }

  void _onTapOther() {
    setState(() {
      _isFruitFocused = false;
      _isOtherFocused = true;

      Navigator.pushReplacementNamed(context, '/other');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Categories',
                style: TextStyle(color: Color(0xffED7E0D), fontSize: 40),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: MouseRegion(
                onEnter: (_) => setState(() => _isFruitFocused = true),
                onExit: (_) => setState(() => _isFruitFocused = false),
                child: GestureDetector(
                  onTap: _onTapFruit,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    height: _isFruitFocused ? 160.0 : 150.0,
                    decoration: BoxDecoration(
                      color: _isFruitFocused
                          ? Colors.orange[100]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: _isFruitFocused
                          ? [const BoxShadow(color: Colors.orange, blurRadius: 10.0)]
                          : [const BoxShadow(color: Colors.grey, blurRadius: 5.0)],
                    ),
                    child: const Center(
                      child: Text(
                        'Fruits',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: MouseRegion(
                onEnter: (_) => setState(() => _isOtherFocused = true),
                onExit: (_) => setState(() => _isOtherFocused = false),
                child: GestureDetector(
                  onTap: _onTapOther,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    height: _isFruitFocused ? 160.0 : 150.0,
                    decoration: BoxDecoration(
                      color: _isOtherFocused
                          ? Colors.green[100]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: _isOtherFocused
                          ? [const BoxShadow(color: Colors.green, blurRadius: 10.0)]
                          : [const BoxShadow(color: Colors.grey, blurRadius: 5.0)],
                    ),
                    child: const Center(
                      child: Text(
                        'Veggies and Grain ',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
