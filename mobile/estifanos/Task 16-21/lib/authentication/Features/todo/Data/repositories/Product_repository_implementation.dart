import 'package:dartz/dartz.dart';

import '../../../../../Core/error/failure.dart';
import '../../../../../Core/platform/network_info.dart';
import '../../Domain/entity/Authentication.dart';
import '../../Domain/repository/AuthRepository.dart';
import '../data sources/Remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource RemoteDataSource;


  AuthRepositoryImpl({
    required this.RemoteDataSource,
  });

  @override
  Future<Either<Failure, String>> loginUser(String email, String password) async {
    try {
      final user = await RemoteDataSource.logInUser(email, password);
      return Right(user);
    } on Exception{
      return const Left(ServerFailure('Server: Failed to Login'));
    }
  }

  @override
  Future<Either<Failure, void>> logoutUser() async {
    try {
      await RemoteDataSource.logOutUser();
      return const Right(null);
    } on Exception{
      return const Left(ServerFailure('Server: Failed to Logout'));
    }
  }

  @override
  Future<Either<Failure, void>> signupUser(String name, String email, String password) async {
    try {
      final user = await RemoteDataSource.signUpUser(name, email, password);
      return Right(user);
    } on Exception{
      return const Left(ServerFailure('Server: Failed to Signup'));
    }
  }
}