// lib/providers/article_provider.dart
import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../services/api_service.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _loading = false;

  List<Article> get articles => _articles;
  bool get loading => _loading;

  void fetchArticles() async {
    _loading = true;
    notifyListeners();

    _articles = await ApiService().fetchArticles();

    _loading = false;
    notifyListeners();
  }
}
