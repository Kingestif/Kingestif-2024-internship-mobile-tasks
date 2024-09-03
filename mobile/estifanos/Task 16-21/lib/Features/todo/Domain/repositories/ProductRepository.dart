import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/Product.dart';


abstract class ProductRepository{
  Future<Either<Failure,ProductEntity>> insertProduct(ProductEntity product);
  Future<Either<Failure,ProductEntity>> getProductID(String id);
  Future<Either<Failure,List<ProductEntity>>> getProductALL();  //added method to return all list products
  Future<Either<Failure,void>> deleteProduct(String id); //void b/c we don't want to return anything
  Future<Either<Failure,void>> updateProduct(ProductEntity Product);  //pass the product to be updated and receive void
}