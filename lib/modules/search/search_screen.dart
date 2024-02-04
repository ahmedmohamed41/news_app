import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/newslayout/cubit/news_cubit.dart';
import 'package:news_app/widgets/custom_condition_builder.dart';
import 'package:news_app/widgets/custom_text_from_filed.dart';

class SearchScreen extends StatelessWidget {
  var searchController = SearchController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  labelText: 'search',
                  controller: searchController,
                  inputType: TextInputType.text,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                ),
               Expanded(child: CustomConditionalBuilder(list: list)),
              ],
            ),
          ),
        );
      },
    );
  }
}
