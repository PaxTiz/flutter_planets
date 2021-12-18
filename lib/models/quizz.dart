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
