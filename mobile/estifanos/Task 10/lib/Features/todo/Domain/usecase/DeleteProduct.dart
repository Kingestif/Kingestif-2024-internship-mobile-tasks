import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/Product.dart';
import '../repositories/ProductRepository.dart';

// ** we will send id to the API
class DeleteProductUsecase{
  final ProductRepository_ repository;

  DeleteProductUsecase(this.repository);

  Future<Either <Failure, void >> execute(String id) {
    return repository.deleteProduct(id);
  }
}