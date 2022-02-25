import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String sessionToken;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.sessionToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'sessionToken': sessionToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      sessionToken: map['sessionToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
