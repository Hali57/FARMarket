// lib/screens/learn_and_grow_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/article_provider.dart';
import '../models/article_model.dart';

class LearnAndGrowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticleProvider()..fetchArticles(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recipes'),
        ),
        body: Consumer<ArticleProvider>(
          builder: (context, provider, child) {
            if (provider.loading) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: provider.articles.length,
              itemBuilder: (context, index) {
                Article article = provider.articles[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (article.imageUrl.isNotEmpty)
                        Image.network(article.imageUrl),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          article.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(article.content),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
