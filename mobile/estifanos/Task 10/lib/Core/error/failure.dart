import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}
// for our project we only use the above failure but if incase we have server...

// class ServerFailure extends Failure{
//   const ServerFailure(super.message);
// }
//
// class ConnectionFailure extends Failure{
//   const ConnectionFailure(super.message);
// }
//
// class DatabaseFailure extends Failure{
//   const DatabaseFailure(super.message);
// }