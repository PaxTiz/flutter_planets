class Planet {
  final int id;
  final String name;
  final String description;
  final String image;
  final int distance;
  final String distanceUnit;
  final Map<String, double>? composition;

  const Planet({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.distance,
    required this.distanceUnit,
    required this.composition,
  });

  static Planet fromJson(Map<String, dynamic> json) {
    return Planet(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        distance: json['distance'],
        distanceUnit: json['distance_unit'],
        composition: json['composition'] == null 
          ? null 
          : Map<String, double>.from(json['composition'])
    );
  }

  String get shortDescription => description.length > 97 
    ? description.substring(0, 97).trim() + '...'
    : description;
}