import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/source_models.dart';

class NewsCardWidget extends StatelessWidget {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  // ignore: use_key_in_widget_constructors
  const NewsCardWidget(
      {this.author,
      this.source,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 57, 57),
                border:
                    Border.all(color: const Color.fromARGB(232, 240, 237, 237)),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            constraints: const BoxConstraints(maxWidth: 300),
            height: 370,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      '$urlToImage',
                      fit: BoxFit.fill,
                      height: 180,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(DateFormat.yMMMMd().format(publishedAt!)),
                )
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
