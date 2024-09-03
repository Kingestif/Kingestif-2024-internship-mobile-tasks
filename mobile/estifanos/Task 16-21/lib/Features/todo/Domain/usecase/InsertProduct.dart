import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/Product.dart';
import '../repositories/ProductRepository.dart';

class InsertProductUsecase {
  final ProductRepository repository;
  InsertProductUsecase(this.repository);

  Future<Either<Failure, ProductEntity>> execute(ProductEntity product) {
    return repository.insertProduct(product);
  }
}
