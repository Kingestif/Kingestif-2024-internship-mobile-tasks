import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/Product.dart';
import '../repositories/ProductRepository.dart';

// ** we will send id to the API
class GetProductByIdUsecase {
  final ProductRepository repository;

  GetProductByIdUsecase(this.repository);

  Future<Either<Failure, ProductEntity>> execute(String id) {
    return repository.getProductID(id);
  }
}
