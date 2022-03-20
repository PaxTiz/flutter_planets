import '../../http.dart';
import '../../models/quizz.dart';
import '../base_store.dart';

class QuizzCategoriesStore extends BaseStore {
  List<QuizzCategory>? _categories;

  List<QuizzCategory>? get categories => _categories;

  QuizzCategoriesStore() : super(null) {
    _loadAll();
  }

  void _loadAll() async {
    await http.get('/quizz/categories').then((response) {
      final data = List.from(response.data as List);
      _categories = data
          .map((e) => e as Map<String, dynamic>)
          .map((e) => QuizzCategory.fromJson(e))
          .toList();
    }).catchError((e) {
      _categories = [];
    }).whenComplete(() => notifyListeners());
  }
}
