import 'package:flutter/material.dart';
import 'package:news_app/models/source_models.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/widgets/news_card_widget.dart';

import 'models/article_model.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({
    Key? key,
    required this.client,
  }) : super(key: key);

  final ServiceApi client;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: client.getTechArticles(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic>? articles = snapshot.data;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 100),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: articles!.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  String title = articles[index].title;
                  String author = articles[index].author;
                  Source source = articles[index].source;
                  String description = articles[index].description;
                  String url = articles[index].url;
                  String urlToImage = articles[index].urlToImage;
                  DateTime publishedAt = articles[index].publishedAt;
                  String content = articles[index].content;

                  return NewsCardWidget(
                    author: author,
                    content: content,
                    description: description,
                    publishedAt: publishedAt,
                    source: source,
                    title: title,
                    url: url,
                    urlToImage: urlToImage,
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
