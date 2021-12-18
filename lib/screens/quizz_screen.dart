import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../stores/quizz/quizz_categories_store.dart';
import '../components/header.dart';
import '../components/category_selector.dart';

class QuizzScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizzCategoriesStore(),
      builder: (ctx, _) {
        final categories = ctx.watch<QuizzCategoriesStore>().categories;

        List<Widget> widgets = [
          Header(
            title: 'Quizz',
            search: true,
            onSearch: (value) => print(value),
          ),
          SizedBox(height: kSpacing(4)),
        ];

        if (categories == null) {
          widgets.add(CircularProgressIndicator.adaptive());
        } else if (categories.isEmpty) {
          widgets.add(Center(child: Text('No categories..')));
        } else {
          widgets.add(CategorySelector(
            items: categories.map((e) => e.name).toList(),
            currentIndex: 0, 
            onClick: (value) => print(value),
          ));
        }

        return Column(
          children: widgets,
        );
      },
    );
  }
}
