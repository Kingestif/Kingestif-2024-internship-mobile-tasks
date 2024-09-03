import 'package:dartz/dartz.dart';

import '../../../../../Core/error/failure.dart';
import '../entity/Authentication.dart';
import '../repository/AuthRepository.dart';

class signupUseCase {
  final AuthRepository repository;
  signupUseCase(this.repository);

  Future<Either <Failure, void >> call(String name, String email, String password) {
    return repository.signupUser(name, email, password);
  }
}