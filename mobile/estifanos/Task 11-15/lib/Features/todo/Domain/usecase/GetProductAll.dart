import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/Product.dart';
import '../repositories/ProductRepository.dart';

class GetProductAllUsecase {
  final ProductRepository repository;
  GetProductAllUsecase(this.repository);

  Future<Either <Failure, List<ProductEntity>>> execute() {
    return repository.getProductALL();
  }
}