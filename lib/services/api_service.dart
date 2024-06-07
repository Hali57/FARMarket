// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

String myKey = '9ecb93ec7908571b5c36e1d7cab6a3ba';

class ApiService {
  final String apiUrl =
      "https://api.edamam.com/api/recipes/v2?type=public&q=vegetable&app_id=b09c2b96&app_key=$myKey"; // Replace with your API credentials

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['hits'];
      return jsonResponse
          .map((article) => Article.fromJson(article['recipe']))
          .toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
