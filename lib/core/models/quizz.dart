class QuizzCategory {

  final int? id;
  final String name;

  const QuizzCategory({
    required this.id,
    required this.name,
  });

  factory QuizzCategory.fromJson(Map<String, dynamic> json) {
    return QuizzCategory(
      id: json['id'], 
      name: json['name'],
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
    id: json['id'], 
    name: json['name'], 
    description: json['description'], 
    category: QuizzCategory.fromJson(json['quizz_category']), 
    questions: null
  );
}
