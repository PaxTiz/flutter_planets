class Planet {
  final int id;
  final String name;
  final String description;
  final String image;
  final int position;
  final int earthDistanceKm;
  final int earthDistanceLy;
  final Map<String, int> composition;

  const Planet({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.position,
    required this.earthDistanceKm,
    required this.earthDistanceLy,
    required this.composition
  });

  static Planet fromJson(Map<String, dynamic> json) {
    return Planet(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        position: json['position'],
        earthDistanceKm: json['earth_distance_km'],
        earthDistanceLy: json['earth_distance_ly'],
        composition: Map<String, int>.from(json['composition'])
    );
  }
}