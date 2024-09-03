import '../../Domain/entity/Authentication.dart';

class AuthModel extends AuthEntity{ //using the properties and methods of Parent class instead of hardcoding
  const AuthModel({
    required super.name,
    required super.email,
    required super.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    name: json['name'],
    email:json['email'],
    password: json['password'],
  );

  Map <String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };
}