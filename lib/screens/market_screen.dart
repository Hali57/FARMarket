import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  bool _isSellFocused = false;
  bool _isBuyFocused = false;
  bool _isLearnEarnFocused = false;

  void _onTapSell() {
    setState(() {
      _isSellFocused = true;
      _isBuyFocused = false;
      _isLearnEarnFocused = false;
    });
  }

  void _onTapBuy() {
    setState(() {
      _isSellFocused = false;
      _isBuyFocused = true;
      _isLearnEarnFocused = false;
      Navigator.pushReplacementNamed(context, '/buy');
    });
  }

  void _onTapLearnEarn() {
    setState(() {
      _isSellFocused = false;
      _isBuyFocused = false;
      _isLearnEarnFocused = true;
      Navigator.pushReplacementNamed(context, '/learn');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market'),
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        color: Colors.green[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: MouseRegion(
                onEnter: (_) => setState(() => _isSellFocused = true),
                onExit: (_) => setState(() => _isSellFocused = false),
                child: GestureDetector(
                  onTap: _onTapSell,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    height: _isSellFocused ? 160.0 : 150.0,
                    decoration: BoxDecoration(
                      color:
                          _isSellFocused ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: _isSellFocused
                          ? [BoxShadow(color: Colors.blue, blurRadius: 10.0)]
                          : [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
                    ),
                    child: Center(
                      child: Text(
                        'Sell',
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
            SizedBox(height: 20.0),
            Expanded(
              child: MouseRegion(
                onEnter: (_) => setState(() => _isBuyFocused = true),
                onExit: (_) => setState(() => _isBuyFocused = false),
                child: GestureDetector(
                  onTap: _onTapBuy,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    height: _isBuyFocused ? 160.0 : 150.0,
                    decoration: BoxDecoration(
                      color:
                          _isBuyFocused ? Colors.green[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: _isBuyFocused
                          ? [BoxShadow(color: Colors.green, blurRadius: 10.0)]
                          : [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
                    ),
                    child: Center(
                      child: Text(
                        'Buy',
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
            SizedBox(height: 20.0),
            Expanded(
              child: MouseRegion(
                onEnter: (_) => setState(() => _isLearnEarnFocused = true),
                onExit: (_) => setState(() => _isLearnEarnFocused = false),
                child: GestureDetector(
                  onTap: _onTapLearnEarn,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    height: _isLearnEarnFocused ? 160.0 : 150.0,
                    decoration: BoxDecoration(
                      color: _isLearnEarnFocused
                          ? Colors.orange[100]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: _isLearnEarnFocused
                          ? [BoxShadow(color: Colors.orange, blurRadius: 10.0)]
                          : [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
                    ),
                    child: Center(
                      child: Text(
                        'Eat Healthy Recipes',
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
