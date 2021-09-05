class Planet {
  final int id;
  final String name;
  final String description;
  final String image;
  final int sunDistanceKm;
  final double sunDistanceLy;
  final Map<String, int> composition;
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
        sunDistanceKm: json['sun_distance_km'],
        sunDistanceLy: json['sun_distance_ly'],
        composition: Map<String, int>.from(json['composition']),
        viewsCount: json['views_count']
    );
  }
}