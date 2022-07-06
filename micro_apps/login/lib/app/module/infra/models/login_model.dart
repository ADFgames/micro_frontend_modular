import 'dart:convert';

import 'package:login/app/module/domain/entities/entities.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required int code,
    required String message,
    required Map<String, dynamic>? dataEntity,
  }) : super(
          code: code,
          message: message,
          dataEntity: dataEntity,
        );

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'dataModel': dataEntity,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      code: map['code'],
      message: map['message'],
      dataEntity: map['dataModel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source));
}
