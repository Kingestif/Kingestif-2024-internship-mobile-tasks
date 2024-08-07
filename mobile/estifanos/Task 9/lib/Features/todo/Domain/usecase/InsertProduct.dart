import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/Product.dart';
import '../repositories/ProductRepository.dart';

class InsertProductUsecase {
  final ProductRepository_ repository;
  InsertProductUsecase(this.repository);

  Future<Either <Failure, ProductEntity>> execute(String id,name,description,price,imageUrl) {
    return repository.insertProduct(id, name, description, price, imageUrl);
  }
}