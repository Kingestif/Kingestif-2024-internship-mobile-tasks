import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../entities/Product.dart';


// ex on insertProduct we need id, name , price.. to insert a product then after that the program will return
// if Success it returns a Product otherwise it will return us Failure

abstract class ProductRepository_{
  Future<Either<Failure,ProductEntity>> insertProduct(String id, String name, String description, String price, String imageUrl);
  Future<Either<Failure,ProductEntity>> getProductID(String id);
  Future<Either<Failure,List<ProductEntity>>> getProductALL();  //added method to return all list products
  Future<Either<Failure,void>> deleteProduct(String id); //void b/c we don't want to return anything
  Future<Either<Failure,void>> updateProduct(ProductEntity Product);  //pass the product to be updated and receive void
}