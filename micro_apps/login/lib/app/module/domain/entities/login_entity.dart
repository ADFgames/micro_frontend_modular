import 'package:dependencies/dependencies.dart';

class LoginEntity extends Equatable {
  final int code;
  final String message;
  final DataEntity dataEntity;

  const LoginEntity(this.code, this.message, this.dataEntity);

  @override
  List<Object?> get props => [code, message, dataEntity];
}

class DataEntity extends Equatable {
  final String token;
  final List<String> links;

  const DataEntity(this.token, this.links);

  @override
  List<Object?> get props => [token, links];
}
