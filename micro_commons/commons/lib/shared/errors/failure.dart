// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  String? get message;
}

class UnauthorizedError extends Failure {
  @override
  final String? message;

  UnauthorizedError({this.message});
}

class InternalServerError extends Failure {
  @override
  final String? message;

  InternalServerError({this.message});
}

class ExpiredTokenError extends Failure {
  @override
  final String? message;

  ExpiredTokenError({this.message});
}
