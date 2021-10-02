class Planet {
  final int id;
  final String name;
  final String description;
  final String image;
  final int sunDistanceKm;
  final double sunDistanceLy;
  final Map<String, int>? composition;
  final int viewsCount;

  const Planet({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.sunDistanceKm,
    required this.sunDistanceLy,
    required this.composition,
    required this.viewsCount,
  });

  static Planet fromJson(Map<String, dynamic> json) {
    return Planet(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        sunDistanceKm: json['sunDistanceKm'],
        sunDistanceLy: json['sunDistanceLy'],
        composition: json['composition'] == null ? null : Map<String, int>.from(json['composition']),
        viewsCount: json['viewsCount']
    );
  }

  String get shortDescription => description.length > 97 
    ? description.substring(0, 97) + '...'
    : description;
}