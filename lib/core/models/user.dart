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
        id: json['id'],
        username: json['username'],
        email: json['email'],
        role: Role.fromJson(json['role']),
      );
}
