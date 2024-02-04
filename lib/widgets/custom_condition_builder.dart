import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_news_item.dart';
import 'package:news_app/widgets/custom_separator.dart';

class CustomConditionalBuilder extends StatelessWidget {
  const CustomConditionalBuilder({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => NewsItem(model: list[index]),
        separatorBuilder: (context, index) => const SeparatorBuilder(),
        itemCount: list.length,
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
