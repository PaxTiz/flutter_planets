class Planet {
  final String id;
  final String name;
  final String description;
  final String image;

  const Planet({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  static Planet fromJson(Map<String, dynamic> json) {
    return Planet(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }

  String get shortDescription => description.length > 97
      ? description.substring(0, 97).trim() + '...'
      : description;
}
