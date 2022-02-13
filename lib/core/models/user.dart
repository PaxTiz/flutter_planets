import 'role.dart';

class User {
  final int id;
  final String username;
  final String email;
  final Role role;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        username: json['username'] as String,
        email: json['email'] as String,
        role: Role.fromJson(json['role'] as Map<String, dynamic>),
      );
}
