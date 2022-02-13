class QuizzCategory {
  final int? id;
  final String name;

  const QuizzCategory({
    required this.id,
    required this.name,
  });

  factory QuizzCategory.fromJson(Map<String, dynamic> json) {
    return QuizzCategory(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}

class Quizz {
  final int id;
  final String name;
  final String description;
  final QuizzCategory category;
  final List<String>? questions;

  const Quizz({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.questions,
  });

  factory Quizz.fromJson(Map<String, dynamic> json) => Quizz(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      category: QuizzCategory.fromJson(
        json['quizz_category'] as Map<String, dynamic>,
      ),
      questions: null);
}
