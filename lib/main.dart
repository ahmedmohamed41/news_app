import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layouts/newslayout/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewsLayout(),
    );
  }
}
