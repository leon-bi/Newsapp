import 'dart:convert';

import 'package:http/http.dart';

import '../models/article_model.dart';

class ServiceApi {
  final String endPointUrl =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5084802430fe42a38ffbccfb5ecfdb0b";

  Future<List<Article>> getTechArticles() async {
    try {
      Response res = await get(Uri.parse(endPointUrl));
      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json["articles"];
        List<Article> newModel =
            body.map((dynamic item) => Article.fromJson(item)).toList();

        return newModel;
      }
    } catch (e) {
      return [];
    }
    return [];
  }
}
