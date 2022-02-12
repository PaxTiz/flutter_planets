class Role {
  final int id;
  final String name;
  final String displayName;

  const Role({
    required this.id,
    required this.name,
    required this.displayName,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json['id'],
        name: json['name'],
        displayName: json['displayName'],
      );
}
