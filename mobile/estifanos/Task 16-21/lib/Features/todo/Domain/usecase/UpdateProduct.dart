import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/Product.dart';
import '../repositories/ProductRepository.dart';

class UpdateProductUsecase {
  final ProductRepository repository;
  UpdateProductUsecase(this.repository);

  Future<Either<Failure, void>> execute(ProductEntity Product) {
    return repository.updateProduct(Product);
  }
}
