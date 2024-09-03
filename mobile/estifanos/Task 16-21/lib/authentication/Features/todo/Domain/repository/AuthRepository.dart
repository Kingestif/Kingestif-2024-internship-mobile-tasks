import 'package:dartz/dartz.dart';
import '../../../../../Core/error/failure.dart';
import '../../../../../Features/todo/Domain/entities/Product.dart';
import '../entity/Authentication.dart';

abstract class AuthRepository{
  Future<Either<Failure,String>> loginUser(String email, String password);
  Future<Either<Failure,void>> signupUser(String name, String email, String password);
  Future<Either<Failure,void>> logoutUser();
}