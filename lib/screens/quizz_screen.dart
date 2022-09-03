import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/category_selector.dart';
import '../components/header.dart';
import '../config/constants.dart';
import '../core/models/quizz.dart';
import '../core/stores/quizz/quizz_categories_store.dart';

class QuizzScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizz = [
      Quizz(
        id: 1,
        name: 'My first quizz',
        description:
            'The best quizz ever because it is very important to know these things',
        category: QuizzCategory(id: 1, name: 'Space Exploration'),
        questions: null,
      ),
    ];

    return ChangeNotifierProvider(
      create: (_) => QuizzCategoriesStore(),
      builder: (ctx, _) {
        final categories = ctx.watch<QuizzCategoriesStore>().categories;

        List<Widget> widgets = [
          Header(
            title: 'Quizz',
            onSearch: (value) => print(value),
          ),
          SizedBox(height: kSpacing(4)),
        ];

        if (categories == null) {
          widgets.add(CircularProgressIndicator.adaptive());
        } else if (categories.isEmpty) {
          widgets.add(Center(child: Text('No categories..')));
        } else {
          widgets.addAll([
            CategorySelector(
              items: categories.map((e) => e.name).toList(),
              currentIndex: 0,
              onClick: (value) => print(value),
            ),
            SizedBox(height: kSpacing(4)),
            ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  final q = quizz[i];
                  return Container(
                    padding: EdgeInsets.all(kSpacing(2)),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.circular(kSpacing(2))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          q.name,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                        ),
                        Text(
                          q.description,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                  ),
                        ),
                        SizedBox(height: kSpacing(2)),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text('Play')),
                            SizedBox(width: kSpacing(2)),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Leaderboard')),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ]);
        }

        return SingleChildScrollView(
          child: Column(
            children: widgets,
          ),
        );
      },
    );
  }
}
