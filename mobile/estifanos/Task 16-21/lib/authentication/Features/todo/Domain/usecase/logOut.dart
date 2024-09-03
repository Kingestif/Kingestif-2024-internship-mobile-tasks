import 'package:dartz/dartz.dart';

import '../../../../../Core/error/failure.dart';
import '../../../../../Features/todo/Domain/entities/Product.dart';
import '../entity/Authentication.dart';
import '../repository/AuthRepository.dart';

class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);

  Future<Either <Failure, void>> call() {
    return repository.logoutUser();
  }
}