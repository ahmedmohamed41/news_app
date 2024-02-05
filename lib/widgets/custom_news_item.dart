import 'package:flutter/material.dart';
import 'package:news_app/modules/webview/web_screen.dart';
import 'package:news_app/shared/components/constaints.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.model,
  });
  final Map model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, WebScreen( url: model['url'],));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 140,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                height: 140,
                width: 130,
                decoration: BoxDecoration(
                  border: Border.all(width: 5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${model['urlToImage'] ?? 'https://st4.depositphotos.com/14953852/24787/v/1600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg'}',
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SizedBox(
                  height: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${model['title']}',
                          maxLines: 4,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '${model['publishedAt']}',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
