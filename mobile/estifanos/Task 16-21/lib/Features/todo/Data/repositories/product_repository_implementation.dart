import 'package:flutter/cupertino.dart';
import '../../../../Core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/platform/network_info.dart';
import '../../Domain/entities/Product.dart';
import '../../Domain/repositories/ProductRepository.dart';
import '../data sources/local_data_source.dart';
import '../data sources/remote_data_source.dart';
import '../models/Product_Model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    try {
      // Delete the product from the remote data source
      await remoteDataSource.deleteProductId(id);

      // Optionally, delete the product from the local data source
      await localDataSource.deleteProduct(id);

      // Return success (Right(null) because the return type is void)
      return const Right(null);
    } on Exception {
      // Handle any errors and return a failure
      return Left(ServerFailure('Server: Failed to delete product'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductALL() async {
    if (await networkInfo.isConnected) {
      try {
        // Fetch products from the remote data source
        final products = await remoteDataSource.getProductAll();

        // Cache the fetched products locally
        for (var product in products) {
          localDataSource.addProduct(product);
        }

        // Return the list of products
        return Right(products);
      } on ServerFailure {
        return Left(ServerFailure('Server: Failed to get all products'));
      }
    } else {
      try {
        // Fetch products from the local data source
        final products = await localDataSource.getProducts();

        // Return the list of products
        return Right(products);
      } on CacheFailure {
        return Left(CacheFailure('Cache: Failed to get all products'));
      }
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductID(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final product = await remoteDataSource
            .getProductById(id); //get the Product from Remote
        localDataSource.addProduct(product); //Cache the fetched data to local
        return Right(product);
      } on ServerFailure {
        return Left(ServerFailure('Server: Failed to get product'));
      }
    } else {
      try {
        final product = await localDataSource
            .getProduct(id); //incase no internet fetches product form local
        return Right(product);
      } on CacheFailure {
        return Left(CacheFailure('Failed to get product'));
      }
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> insertProduct(
      ProductEntity product) async {
    try {
      // our insertProduct want entity but since we want to pass whole productmodel we have to make conversion
      // Convert ProductEntity to ProductModel before passing to remoteDataSource
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );

      // Now pass the ProductModel to the remoteDataSource
      final result = await remoteDataSource.insertProduct(productModel);

      // Return the result as a ProductEntity
      return Right(product);
    } on Exception {
      return Left(ServerFailure('Server: Failed to add product'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(ProductEntity product) async {
    try {
      // Extract the ID from the product entity since our update need id to update

      final productModel = ProductModel(
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);

      // Call the remote data source update method with the ID
      await remoteDataSource.updateProduct(productModel);

      return const Right(null); // Return success
    } on Exception {
      return Left(ServerFailure('Server: Failed to update product'));
    }
  }
}
