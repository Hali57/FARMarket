import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/register_screen.dart';
import 'screens/market_screen.dart';
import 'screens/buy_screen.dart';
import 'screens/fruit_screen.dart';
import 'screens/veggies_grain_screen.dart';
import 'screens/learning_screen.dart';
import 'screens/cart_model.dart';
import '../providers/article_provider.dart';
import 'screens/homepage_screen.dart';
import 'providers/produce_provider.dart';
import 'screens/sell_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => ArticleProvider()),
        ChangeNotifierProvider(create: (_) => ProduceProvider()),
      ],
      child: FarmBoostApp(),
    ),
  );
}

class FarmBoostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FARMarket',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white12),
        useMaterial3: true,
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => WelcomeScreen(),
        '/market': (context) => MarketScreen(),
        '/buy': (context) => BuyScreen(),
        '/fruit': (context) => FruitScreen(),
        '/other': (context) => VeggiesGrainsScreen(),
        '/learn': (context) => LearnAndGrowScreen(),
        '/homepage': (context) => HomePage(),
        '/sell': (context) => SalesPage(),
      },
    );
  }
}
