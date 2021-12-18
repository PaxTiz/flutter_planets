import 'package:flutter/material.dart';
import '../../api/quizz.dart';
import '../../models/quizz.dart';

class QuizzCategoriesStore extends ChangeNotifier {

  List<QuizzCategory>? _categories;

  List<QuizzCategory>? get categories => _categories;

  QuizzCategoriesStore() {
    _loadAll();
  }

  void _loadAll() async {
    await findAllQuizzCategories()
      .then((categories) => _categories = categories)
      .catchError((_) => _categories = [])
      .whenComplete(() => notifyListeners());
  }

}