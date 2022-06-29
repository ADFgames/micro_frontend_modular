// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      map['email'] as String,
      map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParams.fromJson(String source) => LoginParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginParams(email: $email, password: $password)';
}
