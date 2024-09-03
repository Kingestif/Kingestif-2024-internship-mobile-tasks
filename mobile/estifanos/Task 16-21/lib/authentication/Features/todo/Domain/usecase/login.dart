import 'package:dartz/dartz.dart';

import '../../../../../Core/error/failure.dart';
import '../../../../../Features/todo/Domain/entities/Product.dart';
import '../entity/Authentication.dart';
import '../repository/AuthRepository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<Either <Failure, String>> call(String email, String password) {
    return repository.loginUser(email, password);
  }
}